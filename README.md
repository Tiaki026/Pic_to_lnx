# Pic_to_lnx

# Описание

## Скачивает картинки с помощью терминала linux с автоматизацией каждый час и архивированием раз в сутки

# Как пользоваться проектом
### Клонируем репозиторий
```linux
git clone git@github.com:Tiaki026/Pic_to_lnx.git
```
### Настраиваем
### Открываем crone
[это он](https://github.com/Tiaki026/Pic_to_lnx/blob/main/crontab)
```
crontab -e
```
### Настройки
замените {имя пользователя} на ваш реальный

>
>В целом можете выбрать любой удобный путь до проекта
>

Первая строка - запускает скачивание картинок раз в час в папку текущего часа (image_12h, где 12 - текущий час)
```
0 * * * * /bin/bash /home/{имя пользователя}/Download_pic/download.sh >> /home/{имя пользователя}/Download_pic/download.log 2>&1

0 0 * * * /bin/bash /home/{имя пользователя}/Download_pic/archive.sh >> /home/{имя пользователя}/Download_pic/archive.log 2>&1

```
### Ручной запуск для теста
```
bash download.sh # скачивает картинки
bash archive.sh # архивирует и удаляет уже скаченные картинки
```
Если на терминале виден вывод ⬇️, то все хорошо
```
---Run download script---
Working directory: image_03h
Downloaded 1/15 --> image_03h/image_1_1746058352.jpg
Downloaded 2/15 --> image_03h/image_2_1746058358.jpg
Downloaded 3/15 --> image_03h/image_3_1746058363.jpg
Downloaded 4/15 --> image_03h/image_4_1746058373.jpg
Downloaded 5/15 --> image_03h/image_5_1746058379.jpg
Downloaded 6/15 --> image_03h/image_6_1746058385.jpg
Downloaded 7/15 --> image_03h/image_7_1746058391.jpg
Downloaded 8/15 --> image_03h/image_8_1746058397.jpg
Downloaded 9/15 --> image_03h/image_9_1746058406.jpg
Downloaded 10/15 --> image_03h/image_10_1746058413.jpg
Downloaded 11/15 --> image_03h/image_11_1746058418.jpg
Downloaded 12/15 --> image_03h/image_12_1746058424.jpg
Downloaded 13/15 --> image_03h/image_13_1746058431.jpg
Downloaded 14/15 --> image_03h/image_14_1746058436.jpg
Downloaded 15/15 --> image_03h/image_15_1746058445.jpg
```
Архивация
```
---Run archive + delete script---
Archive --> images_daily_2025-05-01.tar.gz created!
DIR deleted --> image_02h
DIR deleted --> image_03h
DIR deleted --> image_04h
DIR deleted --> image_05h
DIR deleted --> image_06h
DIR deleted --> image_08h
DIR deleted --> image_09h
DIR deleted --> image_10h
DIR deleted --> image_11h
DIR deleted --> image_12h
DIR deleted --> image_13h
DIR deleted --> image_14h
DIR deleted --> image_15h
DIR deleted --> image_16h
DIR deleted --> image_17h
DIR deleted --> image_18h
```
