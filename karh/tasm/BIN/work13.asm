masm
model small
.stack 256h
.data
	even_counter db 0
	uneven_counter db 0
	
.code
	main :	
		mov ax,@data
		mov ds, ax
		
		mov cx,5 ; 15 numbers 
		;convert char to normal number
		;see how compare works and jump statement 
		
		input :
			mov ah,01h
			int 21h
			xor ah,ah
			mov bl,2 ; divident 
			sub al,'0'
			mov dl,al ; save number 
			div bl ;divide ax by 2 
			cmp ah,0 ; if  remainder is zero 
			je even_number
			
			not_even :
				add uneven_counter,dl
				jmp exit_loop
				
			even_number : 
				add even_counter,dl 
			
			exit_loop : 
				dec cx 
				cmp cx,0
				jne input
					
					
		xor dx,dx
		xor ax,ax
		mov dl,even_counter
		mov al,uneven_counter
		cmp dx,ax
		;absolute function 
		jge absolute_	
		xchg dx,ax
		
		absolute_:
			sub dx,ax

		
		xor ax,ax 
		mov ax,dx ; move result 
		xor bx,bx 
		mov bx,10 ;divide by 
		mov si, 0 
		divide : 
			div bx
			cmp al,0
			je print_stack
			inc si 
			xor cx,cx 
			mov cl,ah ; remainder =ah
			adc cx,'0'
			push cx 
			jmp divide
			
			
			
			
		
		print_stack : 
			mov ah,02h
			xor cx,cx
			xor dx,dx 
			pop dx 
			int 21h 
			dec si 
			cmp si,0
			je exit
			jmp print_stack
			
		
		exit:
			mov ax,4c00h
			int 21h 
	end main 