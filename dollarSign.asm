masm 
model small
.data
	msg db " I have 50 $" 
.stack 
	db 256 dup ( ? ) 
.code
	main:
		mov ax,@data
		mov ds,ax
		
		mov ah,09h
		lea dx,msg
		int 21h
		
		xor dx,dx
		mov ah,02h
		mov dl,"$"
		int 21h
		
		mov ax,4c00h
		int 21h
		
	end main
	