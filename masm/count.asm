assume cs:code
code segment
start:
	mov cx,100d
	mov bl,0
again:
	mov al,bl
	aam
	add ax,3030h
	mov dl,ah
	mov ah,02
	push ax
	int 21h
	pop ax
	mov dl,al
	mov ah,02
	int 21h
	mov dl,0dh
	mov ah,02
	int 21h
	call delay
	inc bl
	loop again
	mov ah,4ch
	int 21h
delay proc
	mov si,2202h
	i2:mov di,0ffffh
	i1:dec di
	    jnz i2
	    dec si
	    jnz i1
	    ret
delay endp
code ends
end start
	
	
