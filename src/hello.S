str: 
    .ascii "Hello World !\n" // étiquette pointant vers la chaine a affiché

.global _start // déclaration _start en global

_start:
    /* Print de Hello World */
    movl $4, %eax   // appelle de sys_write
    movl $1, %ebx   // Sortie standart STDOUT
    movl $str, %ecx // appelle de la chaine à afficher
    movl $15, %edx  // indique la taille de la chaine à afficher
    int $0x80       // interruption du kernel

    /* Fin de programme */
    movl $1, %eax   // appelle de sys_exit
    movl $0, %ebx   // code de retour
    int $0x80       // interruption du kernel