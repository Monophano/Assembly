#define N 16   // allocation mémoire de 16 block à N

.global _start // déclaration _start en global
.comm BUFF, N  // allocation de stockage BUFF de taille N 16 block

_start: 
    /* Fonction Input */
    mov     $3      , %eax // appelle du sys_read
    mov     $0      , %ebx // Entrer standart STDIN
    mov     $BUFF   , %ecx // stockage de l'entrer de l'utilisateur
    mov     $N      , %edx // récupération de la taille du buffer
    int     $0x80          // interruption du kernel

    /* Fonction print */  
    mov     %eax    , %edx // transfère la valeur renvoyée par sys_read dans edx
    mov     $4      , %eax // appelle du sys_write
    mov     $1      , %ebx // Sortie standart STDOUT
    mov     $BUFF   , %ecx // Affichage de l'entrer utilisateur stocker dans Buffer
    int     $0x80          // interruption du kernel

    /* Fin du programme */
    mov     $1      , %eax // appelle de sys_exit
    mov     $0      , %ebx // code de retour
    int     $0x80          // interruption du kernel