# 03 — Циклы (for / while)

## Что это такое

**Цикл** — повторение блока кода несколько раз.

**`for`** — цикл, который перебирает элементы списка (числа, файлы, строки). По-русски: "для каждого из...".

**`while`** — цикл, который выполняется пока условие истинно. По-русски: "пока".

**`until`** — цикл, который выполняется пока условие ложно. Обратный `while`. По-русски: "до тех пор пока не...".

**`break`** — досрочно прервать цикл.

**`continue`** — пропустить текущую итерацию и перейти к следующей.

## Для чего нужно

- Без циклов: пишешь одну и ту же команду 100 раз для 100 файлов.
- С циклами: один раз написал, цикл сам пройдёт по всем элементам.

**Примеры в реальной жизни:**
- Обработать все файлы в папке
- Удалить старые бэкапы (старше N дней)
- Подождать пока сервис запустится
- Прочитать строки из файла и что-то с ними сделать

---

## `for` — как пользоваться

### По списку значений
```bash
for i in 1 2 3; do
    echo "номер $i"
done
```

Вывод:
```
номер 1
номер 2
номер 3
```

### По диапазону
```bash
for i in {1..5}; do
    echo $i
done
```

Вывод: `1 2 3 4 5` (каждое на новой строке)

### По файлам в папке
```bash
for FILE in /etc/*.conf; do
    echo "Конфиг: $FILE"
done
```

### По строкам команды
```bash
for USER in $(cat /etc/passwd | cut -d: -f1); do
    echo "Юзер: $USER"
done
```

### Классический C-стиль
```bash
for ((i=0; i<5; i++)); do
    echo $i
done
```

---

## `while` — как пользоваться

```bash
COUNT=0
while [[ $COUNT -lt 5 ]]; do
    echo "счёт: $COUNT"
    COUNT=$((COUNT + 1))
done
```

Вывод: `счёт: 0 ... счёт: 4`

`$((...))` — арифметика в bash.

### Бесконечный цикл
```bash
while true; do
    echo "работаю..."
    sleep 1
done
```

### Чтение файла построчно
```bash
while read LINE; do
    echo "Строка: $LINE"
done < /etc/hosts
```

---

## `until` — как пользоваться

Обратный `while`: работает **пока условие ложно**.

```bash
COUNT=0
until [[ $COUNT -ge 5 ]]; do
    echo $COUNT
    COUNT=$((COUNT + 1))
done
```

**Типичное использование** — подождать пока что-то заработает:
```bash
until curl -s http://localhost:8000 > /dev/null; do
    echo "Жду пока сервер запустится..."
    sleep 1
done
echo "Сервер готов!"
```

---

## `break` и `continue` — как пользоваться

**`break`** — выйти из цикла полностью.
```bash
for i in 1 2 3 4 5; do
    if [[ $i -eq 3 ]]; then
        break
    fi
    echo $i
done
# Вывод: 1 2
```

**`continue`** — пропустить итерацию.
```bash
for i in 1 2 3 4 5; do
    if [[ $i -eq 3 ]]; then
        continue
    fi
    echo $i
done
# Вывод: 1 2 4 5
```

---

## Шпаргалка

```bash
# for по списку
for i in 1 2 3; do
    echo $i
done

# for по диапазону
for i in {1..10}; do echo $i; done

# for по файлам
for f in *.txt; do echo $f; done

# for по выводу команды
for x in $(команда); do echo $x; done

# for C-стиль
for ((i=0; i<10; i++)); do echo $i; done

# while с условием
while [[ условие ]]; do
    команды
done

# while бесконечный
while true; do команды; sleep 1; done

# while читает файл
while read LINE; do
    echo "$LINE"
done < файл.txt

# until — пока ложно
until [[ условие ]]; do команды; done

# Управление
break       # выйти из цикла
continue    # следующая итерация

# Арифметика
$((COUNT + 1))
$((A * B))
```

---

## Полный пример

```bash
#!/bin/bash
# Удалить лог-файлы старше 7 дней в /var/log/myapp/
# Запуск: bash cleanup.sh

LOG_DIR="/var/log/myapp"
DAYS=7
DELETED=0

# Проверка что директория есть
if [[ ! -d $LOG_DIR ]]; then
    echo "Ошибка: папка $LOG_DIR не найдена"
    exit 1
fi

# Цикл по всем .log файлам
for FILE in "$LOG_DIR"/*.log; do
    # Пропустить если файла нет (на случай если папка пустая)
    if [[ ! -f $FILE ]]; then
        continue
    fi

    # Возраст файла в днях
    AGE=$(( ($(date +%s) - $(stat -c %Y "$FILE")) / 86400 ))

    if [[ $AGE -gt $DAYS ]]; then
        rm "$FILE"
        echo "Удалён: $FILE (возраст $AGE дней)"
        DELETED=$((DELETED + 1))
    fi
done

echo "Удалено файлов: $DELETED"
```
