assume cs:code,ds:data
data segment
	x db 01h,04h,02h,05h,03h,06h
	n dw n-x
data ends
code segment
start:
	mov ax,data
	mov ds,ax

	mov bx,n
	dec bx
next_pass:
	mov cx,bx
	mov ah,00
	lea si,x
next_comp:
	mov al,[si]
	cmp al,[si+1]
	jle do_nothing
	xchg al,[si+1]
	mov [si],al
	mov ah,1
do_nothing:
	inc si
	loop next_comp
	cmp ah,00h
	je finish
	dec bx
	jnz next_pass

finish:
	mov ah,4ch
	int 21h
code ends
end start
