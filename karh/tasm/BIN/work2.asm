masm 
model small 
.data

.stack
	db 256 dup(?)
	
.code
main: 
	mov ax,@data
	mov ds,ax
	
	mov dl,2
	mov ah,02
	int 21h
end main
