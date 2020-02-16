model small

.stack 256h

.data 
	array1 db 5 dup (?) 
.code 
	main :
		mov ax,@data
		mov ds,ax 
		
		;sum numbers all numbers entered
		mov cx,5
		mov ah,01h
		xor dx,dx ;used for sum 
		input:
			int 21h
			sub al,30h;convert to number
			adc dl,al
			
			loop input
		
		xor ax,ax
		mov cl,10 
		mov si,0 
		store_result:
		    xor ah,ah 
			mov al,dl 
			cmp al,0
			je setup
			div cl
			mov dl,al ;quotient 
			mov bl,ah ;remainder
			adc bl,30h 
			push bx  
			inc si
			jmp store_result
		
	    setup:
			 mov ah,02h 
		     xor dx,dx 
		     mov dx,10
		     int 21h 
		     
		
		print_stack: 
		    pop dx
		    int 21h 
		    sub si,1
		    jnz print_stack 	
		    	
		
		exit:
			mov ax,4c00h
			int 21h   
			
			
	end main 