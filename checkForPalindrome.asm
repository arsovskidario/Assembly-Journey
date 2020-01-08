masm
model small
.stack 256h
	
.data
	array db 10 dup (?)
	
.code
	main:
		mov ax,@data
		mov ds,ax
		
		mov cx,10
		mov ah,01h
		xor si,si
		input:
			xor al,al
			int 21h
			
			mov array[si],al ;add to array
			
			xor dx,dx
			mov dl,al
			push dx ;push to stack;
			
			inc si
			loop input
		
		
		mov cx,10
		xor si,si
		check_palindrome:
			xor dx,dx
			pop dx 
			
			cmp array[si],dl
			jnz not_palindrome
			
			;need to jump to not_palindrome
			inc si 
			loop check_palindrome
		
		
		
		palindrome:
			mov ah,02h
			mov dl,10 ;cariage return 
			int 21h
			mov dl,'T'
			int 21h
			jmp exit
		
		not_palindrome:
			mov ah,02h
			mov dl,10 
			int 21h
			mov dl,'F'
			int 21h
			jmp exit
		
		exit:
			mov ax,4c00h
			int 21h
		
	end main
