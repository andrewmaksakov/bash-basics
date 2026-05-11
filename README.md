# Bash Basics

База Bash для DevOps: переменные, условия, циклы.

## Структура

```
bash-basics/
├── 01-variables/      # Переменные и аргументы
├── 02-conditions/     # if / else
├── 03-loops/          # for / while
└── README.md
```

В каждой папке:
- `README.md` — теория
- `cheatsheet.md` — шпаргалка (краткая выжимка)
- `examples.sh` — рабочие примеры

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

---

## Темы

| Раздел | Что внутри |
|--------|-----------|
| [01-variables](01-variables/) | Переменные, аргументы, exit codes |
| [02-conditions](02-conditions/) | `if`, `else`, операторы сравнения |
| [03-loops](03-loops/) | `for`, `while` |
