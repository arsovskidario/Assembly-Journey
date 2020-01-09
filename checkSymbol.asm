; see if char entered is number or char
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
		cmp al,'0'
		jl is_nothing
		cmp al,'9'
		jle number
		cmp al,'A'
		jl is_nothing
		cmp al,'Z'
		jle character
		cmp al,'a'
		jl is_nothing
		cmp al,'z'
		jle character
		
		
		number:
			mov ah,02h
			mov dl,10
			int 21h
			mov dl,'N'
			int 21h
			jmp exit
		character:
			mov ah,02h
			mov dl,10
			int 21h
			mov dl,'C'
			int 21h
			jmp exit
		
		is_nothing:
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