import os, pty, fcntl, termios, struct, time, sys, re

def run_simulation(mob_file, max_sec=5.0):
    master, slave = pty.openpty()
    winsize = struct.pack('HHHH', 40, 100, 0, 0)
    fcntl.ioctl(slave, termios.TIOCSWINSZ, winsize)

    pid = os.fork()
    if pid == 0:
        os.close(master)
        os.setsid()
        os.dup2(slave, 0)
        os.dup2(slave, 1)
        os.dup2(slave, 2)
        os.close(slave)
        sim_path = os.path.abspath("../simulador_completo/bin/simulador")
        mob_path = os.path.abspath(mob_file)
        os.execlp(sim_path, sim_path, mob_path)
    else:
        os.close(slave)
        time.sleep(0.3)
        # Velocidade máxima (D0) e Continua (C)
        os.write(master, b'D0\nC\n')
        
        start_time = time.time()
        output = b''
        # Le ate achar que parou ou timeout
        while time.time() - start_time < max_sec:
            try:
                r = os.read(master, 2048)
                if not r: break
                output += r
                if b'CPU PARADA' in output:
                    break
            except Exception:
                break
            time.sleep(0.05)
        
        os.write(master, b'F\n')
        time.sleep(0.2)
        try:
            os.waitpid(pid, 0)
        except Exception:
            pass
        return output

def clean_curses(text):
    # Remove sequencias ANSI de escape
    clean = re.sub(r'\x1b\[[0-9;]*[a-zA-Z]', '', text)
    clean = re.sub(r'\x1b\([a-zA-Z0-9]', '', clean)
    clean = re.sub(r'[\x00-\x08\x0b\x0c\x0e-\x1f]', '', clean)
    return clean

if __name__ == '__main__':
    mob = sys.argv[1] if len(sys.argv) > 1 else "multitarefa_c.mob"
    out = run_simulation(mob, float(sys.argv[2]) if len(sys.argv) > 2 else 4.0)
    text = clean_curses(out.decode('utf-8', errors='ignore'))
    
    # Procura onde aparecem os blocos das metricas e da console
    idx = text.rfind("METRICAS DA EXECUCAO DO SO")
    if idx != -1:
        fim_idx = text.find("CPU PARADA", idx)
        if fim_idx != -1:
            print(text[idx-50:fim_idx+40])
        else:
            print(text[idx-50:idx+1500])
    else:
        # Imprime os trechos com [SO] ou METRICAS
        for line in text.splitlines():
            if any(k in line for k in ["[SO]", "METRICAS", "PID", "Preemptoes", "Tempo", "Processos", "Escalonador"]):
                print(line.strip())
