masm 

model small 

.stack 256h

.data 

.code 

 main : 
	 mov ax,@data
	 mov ds,ax
	 
	 xor ax,ax
	 
	 ; a=1 b=7 c= 2 
	 mov ax,1
	 mov bx,7
	 mov cx,2
	 
	 xor ax,cx
	 not cx
	 not ax
	 
	 and bx,cx
	 
	 or ax,bx
	 
	 not ax
	 
	 
	 
	 mov ax,4c00h;
	 int 21h
	 
	
 end main