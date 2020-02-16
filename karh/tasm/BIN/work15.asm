model small 

.stack 5h 

.data 
	;variables 
	msg db "Hello, world $ "
	; 8 bit  ah ,al
	
	
.code 
	main :
		mov ax,@data 
		mov ds,ax
		
		mov ah,09h 
		; dx  = destination source 
		lea dx,msg 
		int 21h 
		

		;01h - > cetena inout 02h->print edin simbol 09h -print string  $=nullptr 
			
		
		
	
	end main 