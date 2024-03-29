## Общее описание проекта
- Написанные Bash-скрипты находятся в папке src
- Для каждого задания создана папка с названием вида: 0x, где x - номер задания
- Все скрипты должны декомпозированы и разбиты на несколько файлов
- Файл с основным сценарием для каждого задания должен называться main.sh
- Во всех скриптах предусмотрены проверки на некорректный ввод (указаны не все параметры, параметры неправильного формата и т.д.)
- Все написанные скрипты написаны для Ubuntu Server 20.04 LTS


## 1 задание
Скрипт запускается с одним параметром. Параметр текстовый. Скрипт выводит значение параметра. При любом другом параметре показывается ошибка.

## 2 задание
Скрипт выводит на экран информацию в виде:

**HOSTNAME** = _сетевое имя_  
**TIMEZONE** = _временная зона в виде: **America/New_York UTC -5**_  
**USER** = _текущий пользователь который запустил скрипт_  
**OS** = _тип и версия операционной системы_  
**DATE** = _текущее время в виде: **12 May 2023 12:24:36**_  
**UPTIME** = _время работы системы_  
**UPTIME_SEC** = _время работы системы в секундах_  
**IP** = _ip-адрес машины в любом из сетевых интерфейсов_  
**MASK** = _сетевая маска любого из сетевых интерфейсов в виде: **xxx.xxx.xxx.xxx**_  
**GATEWAY** = _ip шлюза по умолчанию_  
**RAM_TOTAL** = _размер оперативной памяти в Гб c точностью три знака после запятой в виде: **3.125 GB**_  
**RAM_USED** = _размер используемой памяти в Гб c точностью три знака после запятой_  
**RAM_FREE** = _размер свободной памяти в Гб c точностью три знака после запятой_  
**SPACE_ROOT** = _размер рутового раздела в Mб с точностью два знака после запятой в виде: **254.25 MB**_  
**SPACE_ROOT_USED** = _размер занятого пространства рутового раздела в Mб с точностью два знака после запятой_  
**SPACE_ROOT_FREE** = _размер свободного пространства рутового раздела в Mб с точностью два знака после запятой_

После вывода значений предлагается записать данные в файл. Ответы **Y** и **y** считаются положительными, все прочие - отрицательными.

При согласии пользователя, в текущей директории создать файл содержащий информацию, которая была выведена на экран. Название файла должно иметь вид: **DD_MM_YY_HH_MM_SS.status** (Время в имени файла указывает момент сохранения данных).

## 3 задание
Скрипт запускается с 4 параметрами. Параметры числовые - от 1 до 6. При вводе неверных или совпадающих значений должно выводится сообщение, описывающее проблему, и предложение повторно вызвать скрипт.  После вывода сообщения, программа должна корректно завершается.
Обозначения цветов: (1 - white, 2 - red, 3 - green, 4 - blue, 5 – purple, 6 - black)  

**Параметр 1** - это фон названий значений (HOSTNAME, TIMEZONE, USER и т.д.)  
**Параметр 2** - это цвет шрифта названий значений (HOSTNAME, TIMEZONE, USER и т.д.)  
**Параметр 3** - это фон значений (после знака '=')  
**Параметр 4** - это цвет шрифта значений (после знака '=')

## 4 задание
Скрипт запускается без параметров. Параметры задаются в конфигурационном файле до запуска скрипта.  
Конфигурационный файл имеет вид:
```
column1_background=2
column1_font_color=4
column2_background=5
column2_font_color=1
```

Если один или несколько параметров не заданы в конфигурационном файле, то цвет подставляется из цветовой схемы, заданной по умолчанию.

После вывода информации о системе, выводится цветовая схема в  виде:
```
Column 1 background = 2 (red)
Column 1 font color = 4 (blue)
Column 2 background = 5 (purple)
Column 2 font color = 1 (white)
```

При запуске скрипта с цветовой схемой по умолчанию вывод имеет вид:
```
Column 1 background = default (black)
Column 1 font color = default (white)
Column 2 background = default (red)
Column 2 font color = default (blue)
```
## 5 задание
Скрипт запускается с одним параметром. Параметр - это абсолютный или относительный путь до какой-либо директории. Параметр должен заканчиваться знаком '/', например:  
`script05.sh /var/log/`

Скрипт выводит следующую информацию о каталоге, указанном в параметре:
- Общее число папок, включая вложенные
- Топ 5 папок с самым большим весом в порядке убывания (путь и размер)
- Общее число файлов
- Число конфигурационных файлов (с расширением .conf), текстовых файлов, исполняемых файлов, логов (файлов с расширением .log), архивов, символических ссылок
- Топ 10 файлов с самым большим весом в порядке убывания (путь, размер и тип)
- Топ 10 исполняемых файлов с самым большим весом в порядке убывания (путь, размер и хеш)
- Время выполнения скрипта
