assume cs:code,ds:data
disp macro mesg
lea dx,mesg
mov ah,9
int 21h
endm
;
data segment
	x db "malayalam"
	n dw n-x
	str2 db 10 dup(?)
	msg1 db "Palindrome$"
	msg2 db "Not a Palindrome$"
data ends
code segment
start:
	mov ax,data
	mov ds,ax
	mov es,ax
	
	mov cx,n
	mov si,n
	dec si
	lea di,str2

again:
	mov al,[si]
	mov [di],al
	dec si
	inc di
	loop again
comp:
	lea si,x
	lea di,str2
	cld
	mov cx,n
	repe cmpsb
	jnz finish
	disp msg1
	mov ah,4ch
	int 21h
finish:
	disp msg2
	mov ah,4ch
	int 21h
code ends
end start
	
