assume cs:code,ds:data
disp macro msg
lea dx,msg
mov ah,9
int 21h
endm
data segment
	pwd1 db "Harshubh"
	len1 db len1-pwd1
	pwd2 db 10 dup(?)
	len2 db ?
	msg1 db 0ah,0dh, "Passwords Match$"
	msg2 db 0ah,0dh, "Passwords do not match. Try again$"
	msg3 db 0ah,0dh, "Three attempts exceeded$"
	msg4 db 0ah,0dh, "Enter Password$"
data ends
code segment
start:
	mov ax,data
	mov ds,ax
	mov es,ax
	mov bl,0
	

rpt:
	call readpwd
	call match
	inc bl
	cmp bl,3
	jb rpt
	disp msg3
	mov ah,4ch
	int 21h
readpwd proc near
	disp msg4
	mov bh,0
	lea si, pwd2
	
again:
	mov ah,08
	int 21h
	cmp al,0dh
	je next
	mov [si],al
	inc si
	inc bh
	mov dl,'*'
	mov ah,02
	int 21h
	jmp again
next:
	mov len2,bh
	ret
readpwd endp
match proc near
	mov cl,len1
	cmp cl,len2
	je machstr
	jmp failed
machstr:
	lea si,pwd1
	lea di,pwd2
	mov ch,0
	cld
	repe cmpsb
	jnz failed
	disp msg1
	mov ah,4ch
	int 21h
failed:
	disp msg2
	ret
match endp
code ends
end start


	
