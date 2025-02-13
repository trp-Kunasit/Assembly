# Assembly Lang Midterm Summary by BTxS
- [Data Type](#variable-type-in-x86-64-assembly)
- [Basic command](#basic-commmand)
- [Basic format of code](#basic-format-of-code)
- [mov(e)](#data-movement-page-3-7-of-slide)
- [Add +](#addition)
- [Sub -](#subtraction)
- [Multiply](#multiply) (mul and imul)
- [Divide](#divide) (div and idiv)
- Logic (and, or, xor, not)
- Shift (shl, shr, sal, sar)
- [Compare](#comparator) (cmp)
- [Jump](#jump) (jmp)

## Launching slide and github
- examble code on [Github](https://github.com/watisleelapatra/X86-64-Assembly)
0. [Course syllabus](https://gear.kku.ac.th/~watis/courses/EN812700/Syllabus.pdf)
1. Introduction (404)
2. [Architecture Overview](https://gear.kku.ac.th/~watis/courses/EN812700/02-ArchitectureOverview.pdf)
3. [Data Representation](https://gear.kku.ac.th/~watis/courses/EN812700/03-DataRepresentation.pdf)
4. [Program Format](https://gear.kku.ac.th/~watis/courses/EN812700/04-ProgramFormat.pdf)
5. [Tool Chain](https://gear.kku.ac.th/~watis/courses/EN812700/05-Toolchain.pdf)
6. [Instruction Set](https://gear.kku.ac.th/~watis/courses/EN812700/06-InstructionSet.pdf) : mov, movzx, movsx, add, inc, sub, dec, mul, imul, div, idiv, and, or, xor, not, shl, shr, sal, sar, rol, ror, jmp, cmp

## Number system
- Binary : 0 and 1
- Octal : 0-7
- Hexadecimal : 0-9 and A-F
### Binary
| n-Bit     | count     | 
| --------  | -------   | 
| 2         | 4         | 
| 3         | 8         | 
| 4         | 16        | 
| 5         | 32        | 
| 6         | 64        | 
| 7         | 128       | 
| 8         | 256       | 
| 9         | 512       | 
| 10        | 1024      | 
- sign number most significance is sign of number for example ->1101 = -3, ->0111 = +9
- 2's compliment number (signed number : -n) 
`flip bit => + 1` </br>
ex. -(5) = -twos(0101) = 1010+1 = 1011 (-5)</br>
ex. 1111 = twos(-1111) = -(0000+1) = -(0001) (-1)
- expand count of bits `(+) add 0 in front of number : 0111 => 00000111` and `(-) add 1 of F in front of number : 1011 => 11111011, 0xF058 => 0xFFFFF058` 

### Convert Binary to Hex
0000 1011 0101 1111
- Seperate 4 Bits to a set of 1 digit hex `{0000} {1011} {0101} {1111}`
- convert to hex one by one set `{0} {11} {5} {15}`
- if number >= 10 then use A-F instead of 11-15 `{0} {B} {5} {F}`

## Variable type in x86-64 Assembly
| Storage | Declaration | bits | bytes |  range (unsign) | range (sign) |
| ------ | ------- | ------ | ------ | ------ | ------|
| Byte | db / byte | 8 | 1 | 0 to 255 | -128 to 127 |
| Word | dw / word | 16 | 2 | 0 to 65,535 | -32,768 to 32,767 |
| Double-Word | dd / dword | 32 | 4  | 0 to 4,294,967,295 | -2,147,483,648 to 2,147,483,647 |
| Quad-Word | dq / qword | 64 | 8  | 0 to 1.845e19 |-9.223e18 to 9.223e18 |
| Double-Quad-Word | ddq / dqword | 128 | 16 | 0 to 3.408e38 | -1.7e38 to 1.7e38 |


## Data Storage Size
| C/C++ Var | Storage | Size (bits) | Size (bytes) |
| ------ | ------ | ------ | ------ |
| char | Byte | 8 | 1 | 
| short | Word | 16 | 2 |
| int | Double-Word | 32 | 4 |
| unsigned int | Double-Word | 32 | 4 |
| long | Quad-Word | 64 | 8 |
| long long | Quad-Word | 64 | 8 |
| char* | Quad-Word | 64 | 8 |
| int* | Quad-Word | 64 | 8 |
| float | Double-Word | 32 | 4 |
| double | Double-Quad-Word | 64 | 4 |

## Basic commmand
### compile assembly with DDD readable code<br>
`yasm -f elf64 -g dwarf2 -o <output_file.o> <input_file.s>`</br>
`-f elf64` : format x86-64</br>
`-g dwarf2` : set compiled file as DDD readable code</br>

### linked compiled file </br> 
`ld -o <output_file(no format)> <input_files.o>`
### open file on DDD
`ddd <file> &`

## Basic format of code
first create `.s` file. linux comand `echo "" > {filename}.s` then use code editor. <mark>Trick : use "tab" on your keyboard instead type fullname of file.</mark> nano : `nano {filename}.s`, vim `vim {filename}.s` and vscode `code .`

```s
global _start

section .data

; declare variable in this area
    myVar dw 55

section .text
_start:

; area for coding

    mov rax, 60; call code for terminate
    mov rdi, 0; successful operation
    syscall; 
```

- Declaring variable : from `myVar db 55`  `db`(data byte) you can choosing data type follow [Variable type in x86-64 Assembly](#variable-type-in-x86-64-assembly). This code in Java that mean 
```java
byte myVar = 55;
```
## Register
### 16 bits (ax bx cx dx)
| ax (16) || 
| ----- | ------|
| ah (8) | al (8) ||



### 32 bits (eax, ebx, ecx, edx)
|eax (32)||||
|----- | ------ | ----- | ------|
|-|-|**ax (16)**|
|-|-|ah(8)|al(8)|

### 64 bits (rax, rbx, rcx, rdx)
|rax (64)||||||||
|---|----|----|----|----|----|----| -----|
|-|-|-|-|-|-|-|-|
|-|-|-|-|**eax (32)**||||
|-|-|-|-|+|+|**ax (16)**||
|-|-|-|-|+|+|ah (8)|al (8)|

## Data Movement (page 3-7 of [slide](https://gear.kku.ac.th/~watis/courses/EN812700/06-InstructionSet.pdf))
### `mov` (Move) format : `mov <to> <from>`
used to move data form
- Memory to Register
- Register to Memory
- Register to Register

`!!! warning : Memory to Memory not allowed !!!`

for example, move aVar data in memory to register al.
```s
global _start

section .data
    aVar db 8

section .text
_start:
    mov al, byte [aVar]
```
### `movzx` : move `unsigned` small to large size.</br>`movzx <to> <from>` (condition same as mov)
### `movsx` : move `signed` small to large size.</br>`movzx <to> <from>` (condition same as mov)

## Addition
### `add <to> <from>`
ex. 89 + 90
```s
global _start
section .data
    aVar    db  89
    bVar    db  90
    ansVar  db  0
section .text
_start:
    mov     al, byte [aVar] ; reg al = aVar
    add     al, byte [bVar] ; al = al + bVar
    mov     byte [ansVar]   ; ansVar = aVar + bVar
last:
    mov     rax, 60
    mov     rdi, 0
    syscall
```

## Subtraction
### `sub <to> <from>`
ex. 60 - 30
```s
global _start
section .data
    aVar    db  60
    bVar    db  30
    ansVar  db  0
section .text
_start:
    mov     al, byte [aVar] ; reg al = aVar
    sub     al, byte [bVar] ; al = al - bVar
    mov     byte [ansVar]   ; ansVar = aVar - bVar
last:
    mov     rax, 60
    mov     rdi, 0
    syscall
```

## Multiply
### `mul <from> ; for unsigned num`
### !!! over number in a register. data will be in `dx:ax`
```s
global _start
section .data
    aVar    db  20
    bVar    db  30
    ansVar  dw  0

section .text
_start:
    mov     al, byte [aVar] ; al = aVar
    mul     byte [bVar] ; al = al * bVar
    mov     byte [ansVar], al ; ansVar = al
    mov     byte [ansVar+1], ah ; ansVar = ah:al
last:
    mov     rax, 60
    mov     rdi, 0
    syscall
```
### `imul <from> ; for signed num`

## Divide
### `div <from> ; unsigned`
```s
global _start
section .data
    wNumA   dw  4321
    wNumB   dw  1234
    wAns2   dw  0
    wRem2   dw  0
section .text
_start:
    ; wAns2 = wNumA / wNumB (unsigned)
	mov     dx, 0
	mov     ax, word [wNumA]
	div     word [wNumB]        ; ax = dx:ax / wNumB
	mov     word [wAns2], ax    ; result
	mov     word [wRem2], dx    ; remainder
last: 
    mov     rax, 60
    mov     rdi, 0
    syscall
```
### `idiv <from> ; signed`

## Comparator
### `cmp <operand1> <operand1>`

## Jump
### normal jump to section `jmp <section_to_jmp>`
code in java `if (condition) then {section}` in assembly use `jmp` and `cmp`
```java
if (90 >= 70) {
    ans = 55;
} else {
    ans = 88;
}
```

| condition | cmd | mean | note |
| ---- | ---- | ---- | ---- |
|Jump if Equal|`je`| `if <op1> == <op2>`| - |
|Jump if Not Equal|`jne`| `if <op1> != <op2>`| - |
|Jump if Less than|`jl`| `if <op1> < <op2>`| Signed |
|Jump if Less than or Equal|`jle`| `if <op1> <= <op2>`| Signed |
|Jump if Greater than|`jg`| `if <op1> > <op2>`| Signed |
|Jump if Greater than or Equal|`jge`| `if <op1> >= <op2>`| Signed |
|Jump if Below|`jb`| `if <op1> < <op2>`| Unsigned |
|Jump if Below or Equal|`jbe`| `if <op1> <= <op2>`| Unsigned |
|Jump if Above|`ja`| `if <op1> > <op2>`| Unsigned |
|Jump if Above or Equal|`jae`| `if <op1> >= <op2>`| Unsigned |

assembly code example
```s
global _start
section .data
    dLeft   db  90
    dRight  db  70
    ansVar  db  0
section .text
_start:
    mov al, byte [dLeft]
    cmp al, byte [dRight] ; compare dLeft : dRight
    jge doSection
    mov byte [ansVar], 88 ; else {ansVar = 88}
    jmp last ; skip doSection
doSection:
    ; if (true) {ansVar = 55}
    mov byte [ansVar], 55 
last:
    mov rax, 60
    mov rdi, 0
    syscall
```