masm 
model small
.stack 256h
.data
	str1 db "I'm a CS student",0
	str2 db "I'm a cS student",0
.code
	main:
		mov ax,@data
		mov ds,ax
		
		mov si,0
		mov cx,16 ;len of string 
		xor ax,ax
		xor bx,bx
		compare:
			mov al,str1[si]
			mov bl,str2[si]
			cmp al,bl ;works only on registers 
			jne not_same
			inc si
			loop compare
		
		same:
			mov ah,02h
			mov dl,'T'
			int 21h
			jmp exit
		
		not_same:
			mov ah,02h
			mov dl,'F'
			int 21h
		
		exit:
			mov ax,4c00h
			int 21h
			
	end main 