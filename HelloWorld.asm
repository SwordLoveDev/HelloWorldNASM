BITS 64

global _start					;appelle de notre étiquette principale nommée _start

section .rodata 				;section dédier à la déclaration de nos variable
	phrase db "Hello World", 10, 0 		;déclaration de notre variable qui contient le fameux Hello World !
	phrase_len equ $-phrase 		;variable qui va compter le nombre de caractère de notre variable phrase

section .script 				;section dédié à l'éxécution de notre script

_start: 					;on va déclaré les valeurs au registre dans cette étiquette
	mov rax, 1	 			;on ajoute l'id (1) de sys_write qui va nous permettre d'écrire dans le terminal dans le registre rax
	mov rdi, 1
	mov rsi, phrase 			;on spécifie notre chaine de caractère qui est une variable au registre rsi
	mov rdx, phrase_len 			;on indique la taille de notre chaine de caractère qui est contenu dans la variable phrase_len
	syscall 				;on appelle le kernel
	jmp _exit 				;execute l'étiquette _exit

_exit:						;on déclare dans cette étiquette le syscall qui va mettre fin au script
	mov rax, 60				;on ajoute au registre rax, l'id 60
	mov rdi, 0 				;on met la valeur 0 pour le sys_exit (id 60) pour ne pas avoir d'érreur
	syscall					;puis on appel le kernel
