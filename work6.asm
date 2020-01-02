masm 
model small

.stack 256h
  
.data 

.code 
	main:
	
		mov ax,@data
		mov ds,ax
		
		mov ah,01h
		int 21h
		
		xor cx,cx
		mov cl,al
		
		push cx
		xor cx,cx
		
		int 21h
		mov cl,al
		push cx
		xor cx,cx
		
		int 21h
		mov cl,al
		push cx
		xor cx,cx
		
		; printing 
		mov ah,02h
		mov dl,10
		int 21h
		
		xor dx,dx
		
		pop dx
		int 21h
		
		pop dx
		int 21h
		
		pop dx
		int 21h
		
		
		
		mov ax,4c00h
		int 21h
		
	end main