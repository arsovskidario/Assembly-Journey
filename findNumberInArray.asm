;find number in array
model small 
.data
    array db 10 dp ? 
    
.code              
    main:          
        mov ax,@data
        mov ds,ax
        mov cx,10
        mov si,0
        mov ah,01h
        input:     
             int 21h
             mov array[si],al
            inc si 
        loop input           
         
        mov ah,01h
        int 21h  
        xor bx,bx
        mov bl,al ;find number  
                     
        mov cx,10                 
        mov si,0 
        find:           
            cmp array[si],bl
            je found  
            inc si 
            loop find
                 
         
        not_found:
            mov ah,02h
            mov dl,'F'
            int 21h
            jmp exit 
            
         found:
            mov ah,02h
            mov dl,'T'
            int 21h
            jmp exit
                   
        exit:
            mov ax,4c00h
            int 21h
    end main 