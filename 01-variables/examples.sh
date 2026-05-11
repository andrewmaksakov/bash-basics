#!/bin/bash
# Примеры работы с переменными и аргументами
# Запуск: bash examples.sh hello 42

# === Переменные ===
NAME="Andrew"
AGE=25
echo "Имя: $NAME, возраст: $AGE"

# === Аргументы скрипта ===
echo "Имя скрипта: $0"
echo "Первый аргумент: $1"
echo "Второй аргумент: $2"
echo "Количество аргументов: $#"
echo "Все аргументы: $@"

# === Exit code ===
ls /etc > /dev/null
echo "Exit code ls /etc: $?"     # 0

ls /нет_такой_папки 2> /dev/null
echo "Exit code ls /нет: $?"     # не 0

# === Команда внутри строки ===
echo "Сейчас: $(date)"
echo "Я: $(whoami)"
echo "Папка: $(pwd)"

# === Логирование ===
LOG="/tmp/example.log"
echo "$(date): скрипт запущен" >> "$LOG"
echo "Лог записан в $LOG"
