# Bash Basics

База Bash и DevOps: переменные, условия, циклы, OSI, RAID.

## Содержание

| Файл | Тема |
|------|------|
| [01-variables.md](01-variables.md) | Переменные, аргументы, exit code, логирование |
| [02-conditions.md](02-conditions.md) | `if` / `else`, операторы сравнения |
| [03-loops.md](03-loops.md) | `for` / `while` / `until` |
| [OSI.md](OSI.md) | Модель OSI: 7 уровней, TCP/UDP, 3-way handshake |
| [RAID.md](RAID.md) | RAID 0/1/5/6/10, parity, RAID ≠ бэкап |

---

## Что такое Bash

**Bash (Bourne Again Shell)** — командная оболочка Linux. Интерпретирует команды и запускает их.

**Bash-скрипт** — текстовый файл с командами, которые Bash выполняет по порядку.

```bash
#!/bin/bash
echo "Привет"
echo "Я скрипт"
```

`#!/bin/bash` (шебанг) — говорит системе чем выполнять файл.

**Запуск:**
```bash
bash script.sh        # запустить через bash
./script.sh           # запустить напрямую (нужно chmod +x)
chmod +x script.sh    # сделать файл исполняемым
```
