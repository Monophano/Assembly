/* Allocation mémoire */
#define A 16
#define B 16

/* Définition des messages */
msg1: .ascii "Veuiller entrer un nombre entier : "
msg2: .ascii "Veuiller entrer un autre nombre entier : "
msg3: .ascii "Les deux nombres sont égaux"

.global _start
.comm BUFFA, A // Entrer utilisateur 1 BUFFA
.comm BUFFB, B // Entrer utilisateur 1 BUFFB

_start:
    /* PRINT MSG1 */
    movl    $4      , %eax  // appelle de sys_write
    movl    $1      , %ebx  // Sortie standart STDOUT
    movl    $msg1   , %ecx  // appelle de la chaine à afficher
    movl    $35     , %edx  // indique la taille de la chaine à afficher
    int     $0x80           // interruption du kernel

    /* Premier entrer utilisateur */
    mov     $3      , %eax  // appelle du sys_read
    mov     $0      , %ebx  // Entrer standart STDIN
    mov     $BUFFA  , %ecx  // stockage de l'entrer de l'utilisateur
    mov     $A     , %edx  // récupération de la taille du buffer
    int     $0x80           // interruption du kernel

    /* PRINT MSG2 */
    movl    $4      , %eax  // appelle de sys_write
    movl    $1      , %ebx  // Sortie standart STDOUT
    movl    $msg2   , %ecx  // appelle de la chaine à afficher
    movl    $41     , %edx  // indique la taille de la chaine à afficher
    int     $0x80           // interruption du kernel

    /* Second entrer utilisateur */
    mov     $3      , %eax  // appelle du sys_read
    mov     $0      , %ebx  // Entrer standart STDIN
    mov     $BUFFB  , %ecx  // stockage de l'entrer de l'utilisateur
    mov     $B     , %edx  // récupération de la taille du buffer
    int     $0x80           // interruption du kernel

    /* Comparaison */
    mov $BUFFA, %eax
    mov $BUFFB, %ebx
    cmp %eax, %ebx
    je equal

equal:
    /* PRINT MSG3 */
    movl    $4      , %eax  // appelle de sys_write
    movl    $1      , %ebx  // Sortie standart STDOUT
    movl    $msg3   , %ecx  // appelle de la chaine à afficher
    movl    $28     , %edx  // indique la taille de la chaine à afficher
    int     $0x80           // interruption du kernel

    /* Fermeture du programme */
    movl $1, %eax   // appelle de sys_exit
    movl $0, %ebx   // code de retour
    int $0x80       // interruption du kernel