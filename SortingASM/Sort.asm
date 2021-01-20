TITLE Project (Text.asm)
INCLUDE Irvine32.inc

.data
;--------------------------------Part 1--------------------------------------

	temp byte ?
	con byte "Continue",0
	ms byte "Do you want to continue.........?",0
	sb byte "Enter 10 number to perform selection sort : ",0
	ssort dword 10 dup(?)
	i dword ?
	j dword ?
	p dword ?
	size_1 dword sizeof ssort - 4
	size2 dword sizeof ssort
	ssort2 dword 10 dup(?)
	
	dat dd 10 dup(?)
	cnt dd ?
	l dd ?
	r dd ?

	d dword ?

	
	string byte "The selection sort array is : ",0
	string1 byte "       Enter the array of size 10 : ",0
	filehandle DWORD ?
	filese BYTE "Selection.txt", 0 
	buffSize = 1000 
	buffer byte buffsize dup(?)
	filequ BYTE "Quick.txt", 0 
	buffSize1 = 1000 
	bufferqu byte buffsize dup(?)
	quickstring byte "The Quick sort array is :",0

	go Byte "Enter 1 to go back to menu or any other key to exit : ",0h

;--------------------------------Part 2--------------------------------------
	
	gap dword ?
	swp dword ?
	ssort1 dword 10 dup(?)

	combstring byte "The Comb sort array is :",0
	insertionsort byte "The Insertion sort array is :",0
	file BYTE "Comb.txt", 0
	file1 BYTE "Insertion.txt", 0 
	file3 BYTE "Merge.txt", 0
	n DWORD ? 
	key DWORD ?
	arr DWORD 10 dup (?)
    lens DWORD ($ - arr)
    ssort5 DWORD 10 DUP(0)

    array textequ <esi>
    im textequ <eax>
    jm textequ <ebx>
    km textequ <edi>
    lm textequ <ebp>
    mm textequ <edx>
    rm textequ <ecx>


;--------------------------------Part 3-------------------------------------
	
	count = 10

	arrayb dword 10 DUP (?)

	str1 byte "BUBBLE SORTING",0h
	str2 byte "Enter The Elements of Array : ",0h
	str3 byte "Sorting The Elements ..... ",0h
	str4 byte "Resultant Array : ",0h

	filehandleb DWORD ?  
	fileb BYTE "Bubble.txt", 0    
	bufferb BYTE 1000 DUP(?)


	count2 = 10
	arraysh dword 10 DUP (?)
	resultsh dword 10 DUP (?)

	str9 byte "SHELL SORTING",0h
	str10 byte "Enter The Elements of Array : ",0h
	str11 byte "Sorting The Elements ..... ",0h
	str12 byte "Resultant Array : ",0h

	filehandlesh DWORD ?  
	filesh BYTE "Shell.txt", 0    
	buffersh BYTE 1000 DUP(?)


	count1 = 10

	arrayh dword 10 DUP (?)
	result dword 10 DUP (?)

	str5 byte "HEAP SORTING",0h
	str6 byte "Enter The Elements of Array : ",0h
	str7 byte "Sorting The Elements ..... ",0h
	str8 byte "Resultant Array : ",0h

	filehandleh DWORD ?  
	fileh BYTE "Heap.txt", 0    
	bufferh BYTE 1000 DUP(?)


;---------------------------AFTER LOADING-----------------------

casetable		    byte 1
                    dword selectionsort
					entry=($-casetable)
					byte 2
					dword quicksort
					byte 3
                    dword Insertion_sort
					byte 4
                    dword combsort
					byte 5
					dword bubblesort 
					byte 6
					dword shell_sort
					byte 7
					dword heap_sort
					byte 8 
					dword Mergeproc

					numberofentries=($-casetable)/entry
loading              byte "Sorting" ,0 
Display             byte " SORTING LIBRARY " , 0dh,0ah,0dh
					byte " " , 0dh,0ah,0dh
		            byte "1 -- Selection Sort ",0dh,0ah,0dh
					byte " " , 0dh,0ah,0dh
		            byte "2 -- Quick Sort",0dh,0ah,0dh
					byte " " , 0dh,0ah,0dh
		            byte "3 -- Insertion Sort " ,0dh,0ah,0dh
					byte " " , 0dh,0ah,0dh
	                byte "4 -- Comb Sort" ,0dh,0ah,0dh
					byte " " , 0dh,0ah,0dh
		            byte "5 -- Bubble Sort ",0dh,0ah,0dh
					byte " " , 0dh,0ah,0dh
					byte "6 -- Shell Sort",0dh,0ah,0dh
					byte " " , 0dh,0ah,0dh
					byte "7 -- Heap Sort",0dh,0ah,0dh
					byte " " , 0dh,0ah,0dh
					byte "8 -- Merge Sort",0dh,0ah,0dh
					byte " " , 0dh,0ah,0dh
					
										
					byte "Enter Your Choice :  ",0


;--------------------------------MENU------------------------------------

.code
menu proc
          mov Dh , 0
	      mov DL , 35
		  call GOTOXY
          mov edx,offset display
          call writestring

ret
menu endp

;-------------------------------------MAIN------------------------------------
main proc 
	call menu
	mov ebx,offset casetable
	mov ecx,numberofentries
	call readint
	call clrscr
	l1:
	cmp al,[ebx]
	jne l2
	call near ptr [ebx+1]
	jmp l3
	l2:
	add ebx,entry
	loop l1
	l3:
	exit
main endp


;-----------------------------------------------Sorting---------------------------------------

;------------------------------------------SELECTION SORT---------------------------------------------
selectionsort proc
	mov edx, offset filese
	call OpenInputFile
	mov filehandle, eax
	mov eax, filehandle 
	mov edx, OFFSET buffer 
	mov ecx, buffSize
	call readfromfile
	mov edx,offset buffer
	call writestring
	mov eax,filehandle
	call closefile
	call crlf

	mov edx,offset string1
	call writestring
	mov ecx,10
	mov esi,offset ssort2
	li:
	call readint
	mov [esi],eax
	add esi,4
	loop li
	call loadi
	call crlf
	mov esi, 0
	mov i, 0
	mov ecx,size_1
	l1:
	push ecx
	mov ebx, i
	mov p, ebx
	mov ecx, size2
	add ebx, 4
	mov j, ebx
	l2:
	push ecx
	mov esi, j
	mov eax, ssort2[esi]
	mov edi, p
	mov ebx, ssort2[edi]
	cmp eax, ebx
	jnb l3
	mov p, esi
	l3:
	pop ecx
	add j, 4
	mov edx, j
	cmp edx, ecx
	jb l2
	mov edi, p
	mov edx, i
	mov eax, ssort2[edx]
	xchg ssort2[edi], eax
	mov ssort2[edx], eax
	pop ecx
	add i, 4
	mov edx, i
	cmp edx, ecx
	jb l1
	mov edx, offset string
	call writestring
	call crlf
	mov esi, offset ssort2
	mov ecx, lengthof ssort2
	print_array:
	mov eax, [esi]
	call writedec
	mov eax, 32
	call writechar
	add esi, 4
	loop print_array
	call crlf

	mov edx,offset go
    call WriteString
	call ReadDec

	cmp eax,1
    jne mainmenu
    call Clrscr
	call main

    mainmenu: 
	ret
selectionsort endp

;-------------------------------QUICK SORT-------------------------------
quicksort proc

    mov edx, offset filequ
	call OpenInputFile
	mov filehandle, eax
	mov eax, filehandle 
	mov edx, OFFSET bufferqu
	mov ecx, buffSize1
	call readfromfile
	mov edx,offset bufferqu
	call writestring
	mov eax,filehandle
	call closefile
	call crlf

    mov eax,10
	mov edx,offset string1
	call writestring
	mov ecx,10
	mov esi,offset ssort1
	call crlf
	mov cnt,eax
	call scan
	 ; initialize l, r
	mov eax,0
	mov l,eax;
	mov eax,9
	mov r,eax
	 ; call fast row
	call quicksor
	call print
ret
quicksort endp

swap proc 
	 ; use xchg to use one less register to act as a temporary variable
	mov edx,dat[esi*4];
	xchg edx,dat[ebx*4];
	xchg edx,dat[esi*4];
	ret
swap endp

quicksor proc
	mov eax,l
	cmp eax,r
	jg over
	xor esi,esi;
	xor ebx,ebx;
	mov esi,l;i
	mov ebx,r;j
	mov eax,dat[esi*4] 
	sort_again:
	cmp ebx,esi;				while (i!=j)
	je over_loop;
		loop_j_again:
			cmp esi,ebx; 			while(i<j)
			jge over_loop
			cmp eax,dat[ebx*4]; 	while (a[j]>=a[l])
			jg loop_i_again
			add ebx ,-1			;		j--
			jmp loop_j_again;	
		loop_i_again:
			cmp esi,ebx; 			while (i<j)
			jge over_loop
			cmp eax,dat[esi*4]; 	while (a[l]>=a[i])
			jl compare;
			add esi,1;					i++
			jmp loop_i_again;
		compare:
			cmp esi,ebx;			if (i>=j)
			jge over_loop;				break
			call swap;				swap(i,j)
	jmp sort_again
	over_loop:
		mov ebx,l;
		call swap;				swap(i,l)
		push esi; push i
		push r  ;push r
		mov r,esi
		add r ,-1
		call quicksor;			quicksort(l,i-1);
		pop r
		pop ebx
		mov l,ebx;
		inc l
		call quicksor;			quicksort(i+1,r);
	over:
		ret
quicksor endp

;--------------------------------------------INSERTION SORT-----------------------------------
Insertion_sort proc
	;local ii: dword , key1: dword,jj:dword , nn:dword

	mov edx, offset file1
	call OpenInputFile  
	mov  filehandle, eax   
	mov  edx, offset buffer 
	mov  ecx, 1000   
	call Crlf
	call ReadFromFile   
	mov  edx, offset buffer  
	call WriteString
	mov eax,filehandle
	call CloseFile
	Call Crlf
	call crlf
	call crlf

	mov edx,offset string1
	call writestring
	mov ecx,10
	mov esi,offset ssort1
	call crlf
	li:
	call readint
	mov [esi],eax
	add esi,4
	loop li
	call loadi
	call crlf
	mov esi, 0
	mov i, 0

	mov eax,0
	mov gap,0
	mov n, lengthof ssort1


	mov eax,1

	mov i,eax
	Forins:
		mov esi,offset ssort1
		imul ebx,i,type ssort1
		add esi,ebx
		mov eax,[esi]
		mov key,eax
		push i
		dec i
		mov eax,i
		mov j,eax
		pop i
		inwhile:
		mov eax,j
		cmp eax,0
		jb L1
		mov edi,offset ssort1 
		imul ebx,j,type ssort1
		add edi,ebx
		mov eax,[edi]
		cmp eax,key
		jbe L1
		push j
		inc j

		mov esi,offset ssort1
		imul ebx,j,type ssort1
		add esi,ebx
		pop j

		mov edi,offset ssort1
		imul ebx,j,type ssort1
		add edi,ebx
		mov eax,[edi]
		mov [esi],eax
		dec j
		jmp inwhile
		L1:
		push j
		inc j
		mov esi,offset ssort1
		imul ebx,j,type ssort1
		add esi,ebx
		mov eax,key
		mov [esi],eax
		inc i
		mov eax,n
		;call writedec
		cmp i,eax
	jb Forins
		
		mov edx, offset insertionsort
		call writestring
		call crlf
		mov esi, offset ssort1
		mov ecx, lengthof ssort1
			print_array:
			mov eax, [esi]
			call writedec
			mov eax, 32
			call writechar
			add esi, 4
			loop print_array
			call crlf


		mov edx,offset go
		call WriteString
		call ReadDec

	    cmp eax,1
		jne mainmenu
		call Clrscr
		call main

mainmenu: 
ret
Insertion_sort endp


;-------------------------------------------COMB SORT-----------------------------------
gaap proc
	mov eax, gap
	mov ebx, 10
	mul ebx
	mov ecx, 13
	div ecx
	cmp eax,1
	jl IFF
	JMP ELSEE
	IFF:
		mov gap, 1
		JMP ENDD
	
	ELSEE:
		mov gap, eax
	
	ENDD:
		ret
		
gaap endp


combsort PROC
	;LOCAL i:dword, j:dword, n:DWORD 
	mov edx, offset file
	call OpenInputFile  
	mov  filehandle, eax   
	mov  edx, offset buffer 
	mov  ecx, 1000   
	call ReadFromFile   
	mov  edx, offset buffer  
	call WriteString 
	mov eax,filehandle
	call CloseFile
	Call Crlf
	call crlf

	mov edx,offset string1
	call writestring
	mov ecx,10
	mov esi,offset ssort
	call crlf
	li:
	call readint
	mov [esi],eax
	add esi,4
	loop li
	call loadi
	call crlf
	mov esi, 0
	mov i, 0

	mov eax,0
	mov gap,0
	mov n, lengthof ssort
	mov gap, lengthof ssort					;int gap = n; 

	
	mov swp,1					;make a variable swap
	WHILEE:						;while (gap != 1 || swapped == true) 
		mov eax,gap
		cmp eax, 1
		je C2
		jmp P_A
		C2:
			mov eax, 0
			mov eax,swp
			cmp eax,1
			je P_A
			jmp ENDWHILE

		P_A:
									;Inside While
			call gaap					;gap = getNextGap(gap); 

			mov swp,0					;swapped = false; 

			mov i,0
			
			FORL:
				mov eax, 0	
				mov eax, n	
				mov ebx, 0	
				mov ebx, gap
				sub eax,ebx	
				mov ebx, i
				cmp ebx, eax
				jge ENDFOR				 ;for (int i=0; i<n-gap; i++) 

				mov esi, i
				mov eax, ssort[esi*4]
				add esi,gap
				mov ebx, ssort[esi*4]
				cmp eax, ebx 
										 ;if (a[i] > a[i+gap]) 
				JLE IFEND					
				xchg eax,ebx
				mov esi, i
				mov ssort[esi*4],eax
				add esi, gap
				mov ssort[esi*4],ebx
				mov swp, 1

				IFEND:
					inc i
					jmp FORL

				ENDFOR:
						JMP WHILEE
				
				ENDWHILE:
				
					mov edx, offset combstring
					call writestring
					call crlf
					mov esi, offset ssort
					mov ecx, lengthof ssort
					print_array:
						mov eax, [esi]
						call writedec
						mov eax, 32
						call writechar
						add esi, 4
					loop print_array
					call crlf

					mov edx,offset go
                    call WriteString
					call ReadDec

					cmp eax,1
					jne mainmenu
					call Clrscr
					call main

mainmenu:
ret
 					
combsort ENDP





;----------------------------------------BUBBLE SORT--------------------------------------
bubblesort proc
	mov dh,1
	mov dl,50
	call Gotoxy

	mov edx,offset str1
	call WriteString
	call Crlf

	mov  edx,offset fileb  
	call OpenInputFile  
	mov  filehandleb,eax   
	mov  edx,offset bufferb 
	mov  ecx,1000   
	call Crlf
	call ReadFromFile   
	mov  edx,offset bufferb  
	call WriteString
	mov eax,filehandleb
	call CloseFile
	Call Crlf 

	call Elementsb

	push offset arrayb
	push count

	call Bubble1
 
ret
bubblesort endp


Elementsb PROC

	mov dh, 15
	mov dl, 20
	call Gotoxy
	mov edx, offset str2
	call WriteString
 
	mov eax, 0
	mov esi, offset arrayb
	mov ecx, count

	L1:
		call ReadDec
		mov [esi],eax
		add esi,type arrayb
		loop L1

ret

Elementsb ENDP

Bubble1 PROC
	push ebp
	mov ebp,esp
	pushad
	mov ecx,[ebp + 8]
	dec ecx

	L2b:
		 push ecx
		 mov esi,[ebp + 12]

	   L3b:
			mov eax,[esi]
			cmp eax,[esi+4]
			jl L4b
			xchg eax,[esi+4]
			mov [esi],eax

			L4b:
			   add esi,type arrayb
			   loop L3b

		pop ecx
		loop L2b

		popad
		pop ebp


	mov dh,25
	mov dl,20
	call Gotoxy    
	mov edx,offset str3
	call WriteString
	call Crlf
	call Crlf
	mov eax,2000
	call Delay

	mov dh,27
	mov dl,20
	call Gotoxy
	mov edx,offset str4
	call WriteString
	call Crlf

	mov esi,offset arrayb
	mov ecx,count
	mov dh,29
	mov dl,20
	call Gotoxy
	L5b:
		mov eax,[esi]
		call WriteDec
		mov eax,32
		call WriteChar
		add esi,type arrayb
		loop L5b

		call Crlf
		call Crlf

	mov edx,offset go
    call WriteString
	call ReadDec

	cmp eax,1
    jne mainmenu
    call Clrscr
    call main

mainmenu:
ret 8

Bubble1 ENDP

;-------------------------------------------SHELL SORT----------------------------------

shell_sort proc
	mov dh, 1
	mov dl, 50
	call Gotoxy

	mov edx, offset str9
	call WriteString
	call Crlf

	mov  edx, offset filesh  
	call OpenInputFile  
	mov  filehandlesh, eax   
	mov  edx, offset buffersh 
	mov  ecx, 1000   
	call Crlf
	call ReadFromFile   
	mov  edx, offset buffersh  
	call WriteString  
	mov eax,filehandlesh
	call CloseFile
	Call Crlf 

	call Elementssh

	mov dh, 25
	mov dl, 20
	call Gotoxy
	mov edx, offset str11
	call WriteString
	call Crlf
	mov eax, 2000
	call Delay

	call Shell

	call Printsh
	ret
shell_sort endp


Elementssh PROC

mov dh, 15
mov dl, 20
call Gotoxy
mov edx, offset str10
call WriteString
 
mov eax, 0
mov esi, offset arraysh
mov ecx, count2

L1sh:
    call ReadDec
	mov [esi],eax
    add esi,type arraysh
	loop L1sh

ret

Elementssh ENDP


Shell PROC

	;LOCAL i : DWORD, d : DWORD, l : DWORD

	mov esi, 0
	mov i, 0

	mov eax,0
	mov l, lengthof arraysh
	mov d, lengthof arraysh
	
	DOsh:
		cmp d, 1
		jbe L1sh

		mov eax, d
		add eax, 1
		mov ebx, 2
		cdq 
		div ebx
		mov d, eax
		mov i, 0

		L3sh:
			mov eax, l
			mov ebx, d
			sub eax, ebx
			cmp i, eax
			jae L4sh
		
			mov esi, d
			mov edi, i
			add esi, edi
			imul esi, esi, TYPE arraysh
			imul edi, edi, TYPE arraysh
			mov edx, arraysh[esi]
			mov ecx, arraysh[edi]
			cmp edx, ecx
			jae L5sh
			xchg ecx, edx
			mov arraysh[esi], edx
			mov arraysh[edi], ecx

			L5sh:
				inc i
				jmp L3sh

	L4sh:
		jmp DOsh

	L1sh:
				
	ret

Shell endp


Printsh PROC

	mov esi, offset arraysh
	mov edi, offset resultsh
	mov ecx, lengthof arraysh
	rep movsd

	mov dh, 27
	mov dl, 20
	call Gotoxy
	mov edx, offset str12
	call WriteString 
	call Crlf

	mov dh, 29
	mov dl, 20
	call Gotoxy

	mov esi, offset resultsh
	mov ecx, count2

	L2sh:
		mov eax, [esi]
		call WriteDec
		mov eax, 32
		call WriteChar
		add esi, TYPE arraysh
		loop L2sh

		call Crlf
		call Crlf

		mov edx,offset go
        call WriteString
	    call ReadDec

	    cmp eax,1
        jne mainmenu
        call Clrscr
        call main

mainmenu:
ret

Printsh ENDP


;----------------------------------------HEAP SORT---------------------------------------



Input PROC

	mov dh, 1
	mov dl, 50
	call Gotoxy

	mov edx, OFFSET str5
	call WriteString
	call Crlf

	mov  edx,OFFSET fileh  
	call OpenInputFile  
	mov  filehandleh, eax   
	mov  edx, OFFSET bufferh 
	mov  ecx, 1000   
	call Crlf
	call ReadFromFile   
	mov  edx, OFFSET bufferh  
	call WriteString  
	mov eax,filehandleh
	call CloseFile
	Call Crlf 

	call Elementsh

	mov dh, 26
	mov dl, 20
	call Gotoxy
	mov edx, OFFSET str7
	call WriteString
	call Crlf

	mov eax, 2000
	call Delay

	mov esi, OFFSET arrayh
	mov ecx, lengthof arrayh

	mov dh, 28
	mov dl, 20
	call Gotoxy

	mov edx, OFFSET str8
	call WriteString
	mov dh, 30
	mov dl, 20
	call Gotoxy

	ret

Input ENDP

Elementsh PROC

	mov dh, 15
	mov dl, 20
	call Gotoxy
	mov edx, OFFSET str6
	call WriteString

	mov eax,  0
	mov esi, OFFSET arrayh
	mov ecx, count1

	L1h:
		call ReadDec
		mov [esi], eax
		add esi,TYPE arrayh
		loop L1h

		ret

Elementsh ENDP


Swaph PROC, arr1 : PTR DWORD, arr2 : PTR DWORD

	mov eax, 0

	mov esi, arr1
	mov edi, arr2

	mov eax, [esi]
	xchg eax, [edi]
	mov [esi], eax

	ret

Swaph ENDP


Heapify PROC, arrh : PTR DWORD, nh : DWORD, i9 : DWORD

	LOCAL largest : DWORD, left : DWORD, right : DWORD

	mov eax, i9
	mov largest, eax

	push i9
	imul ebx, i9, 2
	inc ebx
	mov left, ebx
	mov eax, left
	pop i9

	push i9
	imul ebx, i9, 2
	add ebx, 2
	mov right, ebx
	mov eax, right
	pop i9

	mov eax, left
	cmp eax, nh
	jae L2h

	mov esi, arrh
	imul ebx, left, TYPE arrh
	add esi, ebx
	mov edi, arrh
	imul ebx, largest, TYPE arrh
	add edi, ebx
	mov eax, [esi]
	cmp eax, [edi]
	jbe L2h

	mov eax, left
	mov largest, eax
	L2h:
    mov eax,right
    cmp eax,nh
    jae L3h

	mov esi, arrh
	imul ebx, right, TYPE arrh
	add esi, ebx
	mov edi, arrh
	imul ebx, largest, TYPE arrh
	add edi, ebx
	mov eax, [esi]
	cmp eax, [edi]
	jbe L3h

	mov eax, right
	mov largest, eax

	L3h:
		mov eax, largest
		cmp eax, i9
		je L4h

	mov esi, arrh
	imul ebx, i9, TYPE arrh
	add esi, ebx
	mov edi, arrh
	imul ebx, largest, TYPE arrh
	add edi, ebx

	INVOKE Swaph, esi, edi
	INVOKE Heapify, arrh, nh, largest

	L4h:
		ret

    Heapify endp
	
Heap PROC, arrh1 : DWORD, nt : DWORD

	LOCAL i10: DWORD, j10 : DWORD

	mov eax, nt
	mov ebx, 2
	cdq
	idiv ebx
	dec eax
	mov i10, eax
	push ecx
	mov ecx, i10
	inc ecx

	L5h:
		INVOKE Heapify, arrh1, nt, i10
		dec i10
		mov eax, i10
		loop L5h

	pop ecx

	mov eax, nt
	dec eax
	mov j10, eax
	push ecx
	mov ecx, j10
	inc ecx

	L6h:
		mov esi, arrh1
		mov edi, arrh1
		imul ebx, j10, TYPE arrh1
		add edi, ebx

		INVOKE Swaph, esi, edi
		INVOKE Heapify, arrh1, j10, 0
		dec j10
		mov eax, j10
		loop L6h

	pop ecx

	ret
Heap ENDP

Printh PROC, arr1 : DWORD, arr2 : DWORD

	mov esi, arr1
	mov ecx, arr2

	L7h:
		mov eax, [esi]
		call WriteDec
		mov eax,32
		call WriteChar
		add esi, TYPE arr1
		loop L7h

		call Crlf
		call Crlf

		mov edx,offset go
        call WriteString
	    call ReadDec

	    cmp eax,1
        jne mainmenu
        call Clrscr
        call main

mainmenu:
ret

Printh ENDP

heap_sort proc
	call Input
	INVOKE Heap, ADDR arrayh, lengthof arrayh
	Invoke Printh, ADDR arrayh, lengthof arrayh


ret
heap_sort endp

;---------------------MEREGE SORT----------------------
Mergeproc PROC

			mov edx, offset file3
			call OpenInputFile  
			mov  filehandle, eax   
			mov  edx, offset buffer 
			mov  ecx, 1000   
			call Crlf
			call ReadFromFile   
			mov  edx, offset buffer  
			call WriteString
			mov eax,filehandle
			call CloseFile
			Call Crlf
			call crlf
			call crlf
		
    
        mov edx,offset string1
	    call writestring
	    mov ecx, 10
	    mov esi,offset arr
	    li:
	    call readint
	    mov [esi],eax
	    add esi,4
	    loop li

	    call loadi
	    call crlf    

        mov eax, lens
        shr eax, 2
        dec eax
        push eax
        push 0
        push OFFSET arr
        call mergeSort


        mov esi, offset arr
	    mov ecx, lengthof arr
	    print_array:
		    mov eax, [esi]
		    call writedec
		    mov eax, 32
		    call writechar
		    add esi, 4
		    loop print_array
		    call crlf

        	mov edx,offset go
			call WriteString
			call ReadDec

		cmp eax,1
		jne mainmenu
		call Clrscr
		call main

			mainmenu:
			ret
       
Mergeproc ENDP



merge PROC USES eax ebx ecx edx esi edi ebp


        mov array, offset arr
        mov im, eax
        mov mm, edx
        mov jm, ebx

        
        mov lm, im
        mov km, im
        mov rm, mm
        inc rm

        
        While1:
        cmp lm, mm
        jg afterWhile1
        cmp rm, jm
        jg afterWhile1

        
        push ebx
        push eax
        mov eax, [array+TYPE arr * lm]
        mov ebx, [array + TYPE arr * rm]
        cmp eax, ebx
        jge While1_else


      
        mov eax, [array + TYPE arr * lm]
        xchg [ssort5 +  TYPE arr * km], eax
        inc lm
        inc km


        pop eax
        pop ebx

        jmp While1

        While1_else:
        
        mov eax, [array +  TYPE arr * rm]
        mov [ssort5 + TYPE arr * km], eax
        inc rm
        inc km

        
        pop eax
        pop ebx

        jmp While1

        afterWhile1:
        push eax

        
        While2:

        
        cmp lm, mm
        jg While3

        mov eax, [array + TYPE arr * lm]
        mov [ssort5 + TYPE arr * km], eax
        inc lm
        inc km
        jmp While2

        ;final While loop
        While3:

        ;terminating condition
        cmp rm, jm
        jg afterWhileLoops

        mov eax, [array + TYPE arr * rm]
        mov [ssort5 + TYPE arr * km], eax
        inc rm
        inc km
        jmp While3

        afterWhileLoops:
        pop eax

         mov km, im

        forLoop1:
        cmp km, jm
        jg endMergeProc

        mov mm, [ssort5 + TYPE arr * km]
        mov [array + TYPE arr * km], mm

        inc km
        jmp forLoop1

        endMergeProc:
        ret 16


merge ENDP








mergeSort PROC USES eax ebx edx esi
 
    mov array, offset arr 
    mov im, [esp + 24] 
    mov jm, [esp + 28] 

    cmp im, jm
    je ending

   
    mov mm, im
    add mm, jm
    shr mm, 1

   
    push mm
    push im
    push array
    call mergeSort


    inc mm
    push jm
    push mm
    push array
    call mergeSort

   
    dec mm
    push jm
    push mm
    push im
    push array
    call merge

    ending:
    ret 12

mergeSort ENDP




;-----------------------------------LOADING SORT------------------------------
loadi proc
	mov edx,offset loading
	call writestring
	mov ecx,10
	l1:
	mov al,'.'
	call writechar
	mov eax,123
	call delay
	loop l1
	ret
loadi endp



;------------------------------------------PRINT--------------------------------------

print proc
	mov ecx,cnt
	xor esi,esi
	mov edx, offset quickstring
	call writestring
	call crlf
	mov esi, offset dat
	mov ecx, lengthof dat
	print_array:
					mov eax, [esi]
					call writedec
					mov eax, 32
					call writechar
					add esi, 4
	loop print_array
					call crlf
	
	mov edx,offset go
    call WriteString
	call ReadDec

	cmp eax,1
    jne mainmenu
    call Clrscr
    call main

mainmenu:
ret
print endp

scan proc
	mov ecx,cnt
	xor esi,esi
scanf_again:	
			call readdec
			mov dat[esi*4],eax
			inc esi;
			loop scanf_again
	ret
scan endp




end main