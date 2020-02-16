masm
model small 

.data
 msg db "Hello " 
 dollar db 36
 name_user db " Dario $" 
.stack
	db 256 dup (?)

.code

main : 
	mov ax,@data
	mov ds,ax
	
	mov ah,09
	lea dx,msg
	int 21h
	
	mov ah,02
	mov dx,36
	int 21h
	
	mov ah,09
	lea dx,name_user
	int 21h
	
	
	mov ax,4c00h
	int 21h
	
end main
; sum and sub some digits and print them  
; s predefinirani variables 
