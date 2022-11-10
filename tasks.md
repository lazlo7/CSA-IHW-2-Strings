# Aiming for 9.

✔❌
C на 9:
- ✔ Функции с передачей данных через параметры
- ✔ Локальные переменные



TODO:
- **4**
- ✔ Приведено решение задачи на C на планируемую оценку. 
- В полученную ассемблерную программу, откомпилированную без оптимизирующих и отладочных опций, добавлены комментарии, поясняющие
эквивалентное представление переменных в программе на C.
- Из ассемблерной программы убраны лишние макросы за счет использования соответствующих аргументов командной строки и/или за счет
ручного редактирования исходного текста ассемблерной программы.
- Модифицированная ассемблерная программа отдельно откомпилирована
и скомпонована без использования опций отладки.
- Представлено полное тестовое покрытие, дающее одинаковый результат
на обоих программах. Приведены результаты тестовых прогонов для обоих программ, демонстрирующие эквивалентность функционирования.
- Сформирован отчет с результатами тестовых прогонов и описанием используемых опций компиляции, проведенных модификаций ассемблерной программы.

- **5**
- ✔ В реализованной программе необходимо использовать функции с передачей данных через параметры.
- ✔ Использовать локальные переменные.
- В ассемблерную программу при вызове функции добавить комментарии,
описывающие передачу фактических параметров и перенос возвращаемого результата.
- В функциях для формальных параметров добавить комментарии, описывающие связь между параметрами языка Си и регистрами (стеком).
- Информацию о проведенных изменениях отобразить в отчете.

- **6**
- Рефакторинг программы на ассемблере за счет оптимизации использования регистров процессора. Или написание ассемблерной программы с
нуля, используя собственное распределение регистров.
- Добавление комментариев в разработанную программу, поясняющих эквивалентное использование регистров вместо переменных исходной программы на C.
- Представление результатов тестовых прогонов для разработанной программы. Оценка корректности ее выполнения на основе сравнения тестовых прогонов результатами тестирования программы, разработанной
на языке C.
- Сопоставление размеров программы на ассемблере, полученной после
компиляции с языка C с модифицированной программой, использующей
регистры.
- Добавление информации о проведенных изменениях в отчет.

- **7**
- Реализация программы на ассемблере в виде двух или более единиц компиляции (программу на языке C разделять допускается, но не обязательно).
- Использование файлов с исходными данными и файлов для вывода результатов. Имена файлов задаются с использованием аргументов командной строки. Командная строка проверяется на корректность числа аргументов и корректное открытие файлов.
- Подготовка нескольких файлов, обеспечивающих тестовое покрытие разработанной программы.
- Добавление в отчет информации о проведенном функциональном расширении, формате входных файлов, формате командной строки и результатах работы с тестовыми файлами.

- **8**
- Использование в разрабатываемых программах генератора случайных
наборов данных, расширяющих возможности тестирования.
- Изменение формата командной строки с учетом выбора ввода из файлов
или с использованием генератора.
- Включение в программы функций, обеспечивающих замеры времени для
проведения сравнения на производительность. Необходимо добавить замеры во времени, которые не учитывают время ввода и вывода данных.
Для увеличения времени работы минимум до 1 секунды, в зависимости от особенностей программы, можно либо выбирать соответствующие
размеры исходных данных, либо зацикливать для многократного выполнения ту часть программы, которая выполняет вычисления. В последнем
случае можно использовать соответствующую опцию командной строки,
задающей количество повторений.
- Представить полученные временные данные в отчете для разных вариантов тестовых прогонов (наряду с другими данными, полученные при
выполнении ранее описанных требований).

- **9**
- Используя опции оптимизации по скорости, сформировать из программы на на C исходный код ассемблере. Провести сравнительный анализ
с ассемблерной программой без оптимизации по размеру ассемблерного
кода, размеру исполняемого файла и производительности. Сопоставить
эти программы с собственной программой, разработанной на ассемблере, в которой вместо переменных максимально возможно используются
регистры.
- Аналогично, используя опции оптимизации по размеру, сформировать
код на ассемблере. Провести сравнительный анализ с неоптимизированной программой по размеру ассемблерного кода, размеру исполняемого
файла и производительности. Сопоставить эти программы с собственной
программой, разработанной на ассемблере, в которой вместо переменных
максимально возможно используются регистры.
- Представить в отчете полученные результаты, дополнив данные, представленные в предыдущем по предыдующим требованиям.