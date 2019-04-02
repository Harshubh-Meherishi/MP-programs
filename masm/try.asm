assume cs:code, ds:data
data segment
	disp	db	"This works$"
data ends
code segment
start:
	mov ax,data
	mov ds,ax
	lea dx,disp
	mov ah,9
	int 21h
	mov ah,4ch
	int 21h
code ends
end start
