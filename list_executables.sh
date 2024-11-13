#!/bin/bash

# Список директорий для поиска исполняемых файлов
directories=("/sbin" "/usr/sbin")

# Имя файла куда будет сохранён результат
output_file="executable_files_list.txt"

> "$output_file"

# Проходим по каждой директории и записываем файлы с правами на исполнение
for dir in "${directories[@]}"; do
  if [ -d "$dir" ]; then
    find "$dir" -type f -executable >> "$output_file"
  else
    echo "Директория $dir не найдена"
  fi
done

echo "Список исполняемых файлов сохранён в $output_file"
