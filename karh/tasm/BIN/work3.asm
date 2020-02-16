;task

;shift
;sub, add 
; vidi sve toj u registers  turbo debugger
;jmp 
; loops  
;loops with jmp 	
;
;make progra that defines a string and prints it 5 times ^_^
;make program to declare variable, enter the variable and print it ; ^_^
;make program to declare an array, enter the array and print all the elements of it  ^_ _ _ ^ nevozmozno samo ss stek 

model small 

.data
	msg db "Dario is the best $ " 
	var1 db ?  ;declared variable 
	array_size db ? 
.stack
  db 256 dup(?)

.code
main:
mov ax,@data
mov ds,ax

; enter value for loop
mov ah,01h
int 21h
sub al,47
mov var1,al
xor ax,ax
mov al,var1
mov cx,ax

	;lp:
	;	xor ax,ax ; clear register
	;	mov ah,01h
	;	int 21h
	;	;push ax
	;	
	;	mov ah,02h
	;	mov dl,al
	;	int 21h
	;	
	;	mov dl,10
	;	int 21h 
	;
	;loop lp
	
	lp:
		xor ax,ax
		mov ah,01h
		int 21h
		mov ah,0
		push ax
	
	loop lp
	
	xor ax,ax 
	mov al,var1
	mov cx,ax
	lp2:
		xor ax,ax
		pop ax
		mov dx,ax
		mov ah,02h
		int 21h
		loop lp2 
		
	;pop stack 

	
	;mov ah,01h
	;int 21h
	;mov cl,al ;save result
	;
	;mov ah,02h
	;mov dl,32 ;space
	;int 21h
	;
	;mov dl,cl ;get input
	;int 21h
	
	;mov cx,5
	;;lp:
	;;	mov ah,09h
	;;	lea dx,msg
	;;	int 21h
	;;	mov ah,02h
	;;	mov dl,10 ; new line ascii code 
	;;	int 21h
	;;	dec cx
	;;	jnz lp
	
	;lp: 
	;	mov ah,01h
	;	int 21h;
	;	
	;	; save entered input into register 
	;	mov bl,al
	;
	;	mov ah,02h
	;	;add space between entered and result 
	;	mov dl,32 ;32 ascii code for space 
	;	int 21h
	;
	;	mov dl,bl
	;	int 21h
	;	
	;	mov dl,10 ;10 ascii code for new line 
	;	int 21h
	;	loop lp
	
	 
	mov ax,4c00h
	int 21h
end main

