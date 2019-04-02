assume cs:code, ds:data
data segment
	num1 db 01h
	num2 db 03h
	
data ends
code segment
start:
	mov ax,data
	mov ds,ax
	
	mov al,num1
	add al,num2
	
	mov ah,00h
	adc ah,00h
	
	mov bl,02h
	div bl
	mov dl, al
	add dl, 30h
	mov ah,02
	int 21h
	
	mov ah,4ch
	int 21h
code ends
end start
	
	
