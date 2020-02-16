masm

model small

.stack 256h

.data
	file_name db "shopList.txt",0
	handle dw ?
.code 
	main:
		mov ax,@data
		mov ds,ax
		
		mov ah,3ch
		lea dx,file_name
		xor cx,cx
		int 21h
		jc exit ; cf is 0 and okay
		mov handle,ax
			
		mov ax,0 
		mov dx,ax
		mov ah,02h
		int 21h
		exit:
			mov ax,4c00h
			int 21h
	end main 