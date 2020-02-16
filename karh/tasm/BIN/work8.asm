
masm 
model small 

.stack 256h

.data 
	var1 db ?
	arr1 dw 3 dup(?)
.code 

	main : 
		mov ax,@data
		mov ds,ax
		
		mov ah,01h
		int 21h
	    
	    
	    sub al,'0'
		mov var1,al
		
		int 21h   
		sub al,'0'
		adc var1,al
		
		xor ax,ax
		mov al,var1
		xor bx,bx ; counter for number of digits
		mov cx,10 ; div by 10 
		divide: 
			xor dx,dx
			div cx
			inc bx
			push dx
			
			test ax,ax
			jnz divide
		
		mov cx,bx
		xor si,si
		merge: 
			pop ax
			mov arr1[si],ax
			inc si
			loop merge
			
			
		mov ah,02h
		mov dl,10
		int 21h
		
		
		xor si,si
		mov cx,bx
		
		print:
			xor dx,dx
			mov dx,arr1[si] 
			adc dx,'0'
			int 21h
			inc si
			loop print
		
		
		mov ax,4c00h
		int 21h
		
		
		
	
	end main 
		
		
		
	
	end main 
	