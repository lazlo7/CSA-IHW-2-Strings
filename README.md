# АВС. Индивидуальная работа 2: Вариант 18
## Обработка строк символов

ASCII-строка — строка, содержащая символы таблицы кодировки
ASCII. (https://ru.wikipedia.org/wiki/ASCII). Размер строки может
быть достаточно большим, чтобы вмещать многостраничные тексты, например, главы из книг, если задача связана с использованием файлов или
строк, порождаемых генератором случайных чисел. Тексты при этом могут не нести смыслового содержания. Для обработки в программе предлагается использовать данные, содержащие символы только из первой
половины таблицы (коды в диапазоне 0–12710), что связано с использованием кодировки UTF-8 в ОС Linux в качестве основной. Символы,
содержащие коды выше 12710, должны отсутствовать во входных данных
кроме оговоренных специально случаев.

18\. Разработать программу, заменяющую все согласные буквы в заданной ASCII-строке на заглавные.  

Будем считать, что 'y' - гласная.  

Используется intel-синтаксис для простоты.  

- ./src/: исходные файлы.
- compile_flags.txt: флаги компиляции для clangd (не свзяно напрямую с проектом).
- report.md: отчет.

Представлено решение на 6 баллов.
