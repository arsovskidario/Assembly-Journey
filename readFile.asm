masm 
model small
.stack 256h
.data
	file_name db "SHOPLIST.txt",0
	len_file dw $ - file_name
	handle dw ? 
	
	buffer db ? 
.code
	main :
		mov ax,@data
		mov ds,ax
		
		;open file 
		lea dx,file_name
		mov al,02 ;read and write to file ;access atribute 
		mov ah,3dh
		int 21h
		mov handle,ax
		jc exit ; if it doesnt exist exit 
		
		;read file 
		mov ah,3fh
		;mov bx,handle
		mov cx,20h ; Limit  - > how much chars will it read ( bytes ) 
		
		
		lea dx,buffer  ; read file into buffer 
		int 21h 
		mov handle,ax
		mov len_file,ax
		
		mov si,len_file
		mov buffer[si],'$' ; add to last element null ptr so it doesnt overflow
		mov ah,09h
		int 21h 
		
		exit:
			mov ax,4c00h
			int 21h
	end main 