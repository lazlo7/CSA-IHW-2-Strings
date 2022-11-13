	// Название файла исходного кода. 
	.file	"prog.c"

	// Интел-синткаксис.
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"prog.c"
	.align 8
.LC1:
	// Строка, которая будет использоватся при выводе ошибки в assert'е.
	.string	"i + 1 < STR_CAPACITY && \"Input string is too long\""
	.text
	.globl	input_string
	.type	input_string, @function
input_string:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32

	// Первый аргумент - указатель на строку: char* str - rdi, qword: 4 байта - указатель.
	mov	QWORD PTR -24[rbp], rdi 

	// int i = 0, используем регистр ebx (был -4[rbp]).
	mov	ebx, 0
	jmp	.L2
.L4:
	// assert(i + 1 < STR_CAPACITY).
	cmp	ebx, 9998
	jle	.L3
	
	lea	rcx, __PRETTY_FUNCTION__.2102[rip]
	mov	edx, 13
	lea	rsi, .LC0[rip]
	lea	rdi, .LC1[rip]

	call	__assert_fail@PLT
.L3:
	// str[i] = c.
	movsx	rdx, ebx
	add	rdx, QWORD PTR -24[rbp]
	mov	BYTE PTR [rdx], al

	// ++i.
	add	ebx, 1
.L2:
	// Считываем символ с stdin в регистр al (low 8 bit accumulator).
	call	getchar@PLT

	// getchar возвращает символ в регистре al.
	// al: char c.
	// -1 - EOF (ctrl+d).
	// while ((c = getchar()) != -1).
	cmp	al, -1
	jne	.L4

	// str[i] = '\0'.
	movsx	rdx, ebx
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0

	nop
	leave
	ret
	.size	input_string, .-input_string
	.globl	print_string
	.type	print_string, @function
print_string:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32

	// Первый аргумент - указатель на строку: const char* str - rdi, qword: 4 байта - указатель.
	mov	QWORD PTR -24[rbp], rdi

	// int i = 0, используем регистр ebx (был -4[rbp]).
	mov	ebx, 0

	jmp	.L6
.L7:
	// Загружаем str[i] в al.
	movsx	rdx, ebx
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al

	// putchar принимает 1 аргумент - символ, который нужно вывести, в edi.
	mov	edi, eax
	call	putchar@PLT

	// ++i.
	add ebx, 1
.L6:
	// Загружаем str[i].
	movsx	rdx, ebx
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]

	// str[i] != '\0', производим побитовое AND на 8 low битах acuumulator'а.
	test	al, al
	jne	.L7

	nop
	nop
	leave
	ret
	.size	print_string, .-print_string
	.globl	is_vowel
	.type	is_vowel, @function
is_vowel:
	push	rbp
	mov	rbp, rsp

	// Первый аргумент - символ: char c - edi.
	mov	eax, edi

	// 97 - 'a' в ascii.
	cmp al, 97
	je	.L9

	// 101 - 'e' в ascii.
	cmp	al, 101
	je	.L9

	// 105 - 'i' в ascii.
	cmp	al, 105
	je	.L9

	// 111 - 'o' в ascii.
	cmp	al, 111
	je	.L9
	
	// 117 - 'u' в ascii.
	cmp	al, 117
	je	.L9

	// 121 - 'y' в ascii.
	cmp	al, 121

	jne	.L10
.L9:
	// return 1, если гласная.
	mov	eax, 1
	jmp	.L11
.L10:
	// return 0, иначе.
	mov	eax, 0
.L11:
	and	eax, 1
	pop	rbp

	// Возвращаем eax, в котором 1, если символ - гласная буква, иначе 0.
	ret
	.size	is_vowel, .-is_vowel
	.globl	capitalize_consonants
	.type	capitalize_consonants, @function
capitalize_consonants:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 24

	// Первый аргумент - указатель на строку: char* str - rdi, qword: 4 байта - указатель.
	mov	QWORD PTR -24[rbp], rdi

	// int i = 0, используем регистр ebx (был -4[rbp]).
	mov	ebx, 0

	jmp	.L14
.L16:
	// Проверяем, что символ - буква.
	// Загружаем str[i] для str[i] >= 'a'.
	movsx	rdx, ebx
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]

	// 96 - 'a' в ascii.
	cmp	al, 96
	jle	.L15

	// Загружаем str[i] для str[i] <= 'z'.
	movsx	rdx, ebx
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]

	// 123 - 'z' в ascii.
	cmp	al, 122
	jg	.L15

	// Загружаем str[i] для is_vowel(str[i]).
	movsx	rdx, ebx
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al

	// edi - первый аргумент для is_vowel.
	mov	edi, eax
	call	is_vowel

	// В eax возвращемое значение is_vowel.
	xor	eax, 1

	// Прыгаем, если !is_vowel(str[i])
	test	al, al
	je	.L15

	// Загружаем str[i] для получения str[i] - 32.
	movsx	rdx, ebx
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]

	// Загржуаем в ecx адрес str[i] - 32.
	lea	ecx, -32[rax]

	// Загружаем str[i] для str[i] -= 32.
	movsx	rdx, ebx
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx

	mov	edx, ecx

	// Кладем в str[i] под адресом rax значение из edx = str[i] - 32.
	// dl - регистр младших 8 битов регистра data.
	mov	BYTE PTR [rax], dl
.L15:
	// ++i.
	add	ebx, 1
.L14:
	// Загружаем str[i].
	movsx	rdx, ebx
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]

	// str[i] != '\0', производим побитовое AND на 8 low битах acuumulator'а.
	test	al, al
	jne	.L16
	
	nop
	nop
	leave
	ret
	.size	capitalize_consonants, .-capitalize_consonants
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp

	sub	rsp, 4096
	or	QWORD PTR [rsp], 0

	sub	rsp, 4096
	or	QWORD PTR [rsp], 0

	sub	rsp, 1824
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	
	xor	eax, eax

	// Загружаем -10016[rbp] - адрес char str[STR_CAPACITY].
	lea	rax, -10016[rbp]

	// Первый аргумент - адрес char str[STR_CAPACITY].
	mov	rdi, rax
	call	input_string
	
	// Загружаем -10016[rbp] - адрес char str[STR_CAPACITY].
	lea	rax, -10016[rbp]

	// Первый аргумент - адрес char str[STR_CAPACITY].
	mov	rdi, rax
	call	capitalize_consonants

	// Загружаем -10016[rbp] - адрес char str[STR_CAPACITY].
	lea	rax, -10016[rbp]

	// Первый аргумент - адрес char str[STR_CAPACITY].
	mov	rdi, rax
	call	print_string

	// return 0.
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	xor	rdx, QWORD PTR fs:40
	je	.L19
	call	__stack_chk_fail@PLT
.L19:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.2102, @object
	.size	__PRETTY_FUNCTION__.2102, 13
__PRETTY_FUNCTION__.2102:
	.string	"input_string"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
