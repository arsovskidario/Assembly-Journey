;use stack for revering a number
;
masm 
model small
.data
	value db ?
.stack
	db 256 dup (?)
	
.code

main:
	mov ax,@data
	mov ds,ax
	
	mov ah,01h
	int 21h
	
	sub al,47
	mov value,al
	
	xor ax,ax
	mov al,value
	mov cx,ax
	
	lp:
		xor ax,ax
	    mov ah,01h
		int 21h
		mov ah,0
		push ax
		
	loop lp 
	
	empty_stack:
		xor ax,ax 
		pop ax
		mov dx,ax
		mov ah,02h
		int 21h
	loop empty_stack
	
		
	mov ax,4c00h
	int 21h
		
end main 