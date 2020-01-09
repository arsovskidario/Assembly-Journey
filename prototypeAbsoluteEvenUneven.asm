masm
model small
;take 15 numbers find even and uneven and subtract them 
;works for 1 symbol result only 
.data
	saved_number dw ?
	even1 dw ? 
	result dw ?
	uneven dw ?
.code
	main:
		;dx even
		;bx not_even       
		; 2 4 5 6 9 12 - 14 =2
		; 4 4 2 3 3 =10 - 6= 4
		mov cx,5
		mov even1,0
		mov uneven,0  
		input:
			mov ah,01h
			int 21h  
			mov bl,2
			xor ah,ah
			sub al,30h ;conver to number
			mov saved_number,ax
			div bl
			cmp ah,0
			je add_even
				not_even:
					mov dx,uneven
					adc dx,saved_number 
					mov uneven,dx
					jmp exit_loop
			
				add_even:
					mov dx,even1
					adc dx,saved_number
					mov even1,dx
				
			  exit_loop:  
			    loop input
			
			xor dx,dx
			xor bx,bx
			mov dx,even1
			mov bx,uneven
			
			cmp dx,bx
			jge absolut
				
			xchg dx,bx
				
			absolut:
				sub dx,bx 
			    adc dx,30h
				mov result,dx
				
			mov ah,02h  ;print result
			mov dl,10  
			int 21h
			mov dx,result
			int 21h 
		
		
	
		exit:
			mov ax,4c00h
			int 21h
	end main