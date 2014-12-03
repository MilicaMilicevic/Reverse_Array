;Fill array ARRAY using reverse order (LIFO).

;Sadrzaj niza ARRAY popuniti obrnutim redoslijedom (koristeci princip steka-LIFO)

SECTION .data
array db '1','2','3','a'
array_lenght equ $-array

SECTION .text
global _start
_start:

CLD 
MOV ESI,array
MOV CX,array_lenght

MOV AH,0	;clear so you can move it to stack

to_stack:   	
  LODSB		;move from ESI to AL
  PUSH AX		;storage element on stack
  LOOP to_stack

MOV EDI,array
MOV CX,array_lenght

from_stack:
  POP AX
  STOSB		;move from AL to EDI
  LOOP from_stack

MOV EAX,1
MOV EBX,0
INT 80h