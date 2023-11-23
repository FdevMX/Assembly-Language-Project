;MACROS QUE SE IMPORTARAN EN EL ARCHIVO PRINCIPAL PROGRAMA6.ASM

macro LIMPIAR_PANTALLA
    MOV AH, 0   											        ; Función 0 del servicio de interrupción 10H (BIOS)
    MOV AL, 3   											        ; Borrar la pantalla
    INT 10H

    ; Establecer la posición del cursor en fila 1, columna 1
    MOV AH, 02h  											        ; Función 02h del servicio de interrupción 10H (BIOS)
    MOV BH, 0    											        ; Página de visualización
    MOV DH, 0    											        ; Fila
    MOV DL, 0    											        ; Columna
    INT 10H
ENDM

macro SALTOLINEA
    INC BX
    MOV AH, 02
    MOV DH, BL
    MOV DL, 0
    INT 10h
ENDM

print MACRO msg
    PUSH AX                                                         ; Guarda el valor del registro AX en la pila
    PUSH DX                                                         ; Guarda el valor del registro DX en la pila
    MOV DX,OFFSET msg                                               ; Carga DX con la dirección del mensaje a mostrar
    MOV AH,09H                                                      ; Configura AH con la función de servicio para mostrar un mensaje
    INT 21H                                                         ; Llama a la interrupción 21H para mostrar el mensaje
    POP DX                                                          ; Restaura el valor original del registro DX desde la pila
    POP AX                                                          ; Restaura el valor original del registro AX desde la pila
ENDM                                                                ; Fin del macro "print"

macro imprimirMensaje
    MOV AH, 09                                                      ; Función 09h del servicio de interrupción 21H (DOS)
    LEA DX, [SI]                                                    ; Cargar la dirección del mensaje en DX
    INT 21H
ENDM
