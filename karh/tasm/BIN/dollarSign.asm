masm 
model small
.data
.stack 256
.code
	main:
		mov ax,@data
		mov ds,ax
		
		mov ah,4c00h
		int 21h
		
	end main
	