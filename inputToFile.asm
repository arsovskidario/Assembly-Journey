masm
model small
.stack 256h
.data
	file_name db "SHOPLIST.TXT",0
	handle dw ?
	buffer db  ? 
	len_buffer dw $ - buffer
.code 
	main :
		mov ax,@data
		mov ds,ax
		
		;enter what you want to input
		mov cx,10 ;limit for the input 
		mov ah,01h
		mov si,0
		input:	
			int 21h
			mov buffer[si],al
			inc si
			loop input
		
		xor ax,ax
		mov ah,02h
		mov dl,10
		int 21h ;new line
		
		mov buffer[10],'$'  
		
		;test for buffer
		;mov ah,09h
		;lea dx,buffer
		;int 21h 
		
		;open file
		xor dx,dx
		lea dx,file_name
		mov al,02
		mov ah,3dh
		int 21h
		mov handle,ax
		jc exit ; if error shows up while opening 
		
		;input to file 
		mov cx,10 ; limit 
		lea dx,buffer
		mov ah,40h 
		int 21h
		
		
		;close file 
		mov ah,3eh
		mov bx,handle
		int 21h
	
		exit : 
			mov ax,4c00h
			int 21h
	end main 