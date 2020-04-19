SYS_EXIT = 1
SYS_READ = 3
SYS_WRITE = 4

STDIN = 0
STDOUT = 1

EXIT_SUCCESS = 0

SYS_CALL = 0x80

.data
# Przypisanie etykiecie space kodu ASCII spacji.
space: .byte ' '
# Rezerwacja 100 bajtow w pamieci dla etykiety input
# zawierajacej wprowadzone bajty.
input: .space 100
# Rezerwacja bajtow w pamieci dla etykiety output zawierajacej
# bajty do wyprowadzenia, ktorych liczba jest 3x wieksza od wprowadzonych.
inputLength = . - input
output: .space 3 * inputLength
# Rezerwacja 4 bajtow w pamieci dla etykiety zawierajacej
# ilosc wprowadzonych bajtow.
inputBytesNumber: .space 4

.text
.globl _start
_start:
# Wywolanie funkcji systemowej READ.
movl $SYS_READ, %eax # Przypisanie numeru wywolania systemowego do akumulatora.
movl $STDIN, %ebx # Status.
movl $input, %ecx # Adres odczytanego ciagu bajtow.
movl $inputLength, %edx # Rozmiar odczytanego ciagu bajtow.
int $SYS_CALL # Wywolanie systemu operacyjnego.

# Przepisanie ilosci wczytanych znakow z akumulatora do inputBytesNumber.
movl %eax, inputBytesNumber
# Zerowanie rejestrow.
movl $0 , %ecx
movl $0 , %esi

beginning:
movl $0 , %eax
movl $16 , %ebx # Dzielnik do przeskalowania bajtow.
movb input(%ecx), %al # Uzycie %ecx jako rejstru indeksujacego bajtow wejscia
# oraz wydobycie najmlodszego bajtu %eax.
addl $1, %ecx # Inkrementacja.
cdq # Konwersja slowa podwojnego na poczworne.
divl %ebx # Przeskalowanie wartosci rejestru %eax.
cmpb $10 , %al #  Sprawdzenie czy  zawartosc %al jest wieksza badz rowna 10.
jge charNotNumber # Jezeli tak wykokuje skok do etykiety charNotNumber.
movb %al, output(%esi) # Przepisanie bajtu z nizszej czesci rejestru %eax (%al)
# do etykiety output uzywajac %esi jako rejstru indeksujacego bitow wyjscia.
addb $48, output(%esi)  # Utworzenie kodu ASCII.
jmp ending # Skok bezwarunkowy do etykiety ending.

charNotNumber:
movb %al, output(%esi)
addb $55, output(%esi) # Utworzenie kodu ASCII.

ending:
addl $1, %esi # Inkrementacja.
cmpb $10, %dl
jge secondEnding # Skok pod warunkiem, ze wynik porownania jest
# wiekszy badz rowny 0.
movb %dl, output(%esi)
addb $48, output(%esi) # Utworzenie kodu ASCII.
jmp addingSpaceByte # Skok bezwarunkowy do etykiety addingSpaceByte.

secondEnding:
movb %dl, output(%esi)
addb $55, output(%esi) # Utworzenie kodu ASCII.

addingSpaceByte:
addl $1, %esi # Inkrementacja.
movb space, %al
movb %al, output(%esi) # Dodanie bajtu spacji.
addl $1, %esi # Inkrementacja.

cmpl inputBytesNumber, %ecx
jl beginning # Skok do etykiety beginning, jezeli porownanie zwrocilo
# wartosc mniejsza od zera.

movl $3, %edx
# Wywolanie funkcji systemowej WRITE.
movl $SYS_WRITE, %eax # Przypisanie numeru wywolania systemowego do akumulatora.
movl $STDOUT, %ebx # Status.
movl $output, %ecx # Adres ciagu bajtow do wypisania.
imull inputBytesNumber, %edx # Dlugosc ciagu bajtow do wypisania.
int $SYS_CALL #  Wywolanie systemu operacyjnego.

cmpl $0, inputBytesNumber # Sprawdzenie czy przetworzono wszystkie bity
# porownujac zero z iloscia bajtow do przetworzenia.
jne _start # Skok do _start pod warunkiem, ze cmpl nie zwrocilo zera.

# Wywolanie funkcji systemowej EXIT.
movl $SYS_EXIT, %eax # Przypisanie numeru wywolania systemowego do akumulatora.
movl $EXIT_SUCCESS, %ebx # Kod powrotu.
int $SYS_CALL #  Wywolanie systemu operacyjnego.
