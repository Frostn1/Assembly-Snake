org 100h
jmp main
    x dw 5
    y dw 5
    x_counter dw 0
    y_counter dw 0
    snake db '#',24h
main:            
    mov cx, 0xFFFFh
    mainLoop:
       
       mov ax,x     
       cmp ax,x_counter
       je y_check
       jne xPlus
        jmp back
       y_check:
        mov ax,y
        cmp ax, y_counter
        je print
        jne yPlus
       back:     
         
    
    
    loop mainLoop
    
print proc
    mov dl,snake
    mov ah,6
    int 21h
    mov x_counter, 0h
    mov y_counter, 0h
    mov dl,13
    mov ah,6
    int 21h
    mov dl,8
    mov ah,6
    int 21h
    mov ah,0
    mov al,3
    int 10h
    jmp back
print endp

xPlus proc
    inc x_counter
    mov dl,' '
    mov ah,6
    int 21h
    jmp back
xPlus endp

yPlus proc
    mov dl,10
    mov ah,6
    int 21h
    inc y_counter
    jmp back
yPlus endp
mov ah,0
int 21h
ret