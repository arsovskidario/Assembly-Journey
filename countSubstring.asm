
masm 
model small

.data
	arr db 15 dup ? 
.code
	main:
		mov ax,@data
		mov ds,ax
		
		mov cx,15
		xor dx,dx ; counter
		
		mov ah,01h
		xor si,si
		input:
			int 21h
			mov arr[si],al
			inc si 	
			loop input
		
		xor si,si
		mov cx,14
		find_substr:
			cmp arr[si],'i'
			jne	reset
			cmp arr[si+1],'s'
			jne reset
			inc dx
			
			
			reset:
			inc si
			loop find_substr
		
			
		
		exit:
			mov ah,02h  
			add dx,30h
			int 21h 
			mov ax,4c00h
			int 21h 
	end main 
