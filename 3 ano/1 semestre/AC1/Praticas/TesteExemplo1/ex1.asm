#int main(void)
#{
#	int val, n=0, min =0x7FFFFFFF, max=0x80000000;
#	print_string("\nDigite ate 20 inteiros(zero para terminar): ");

#	do {
#		val = read_int()

#		if(val != 0) {
#			if(val>max)
#				max=val;
#			if(val<min)
#				min=val;
#		}

#		n++;

#	while( (n<20) && (val != 0) );

#	print_string("Maximo/Minimo sao: ")
#	print_int10(max);
#	print_char(':');
#	print_int10(min);


#	Mapa de registos
#	val: $t0
#	n: $t1
#	min: $t2
# 	max: $t3

	.data
	.eqv print_string,4
	.eqv print_int10,1
	.eqv print_char,11
	.eqv read_int,5
	
string1:.asciiz "\nDigite ate 20 inteiros(zero para terminar): "
string2:.asciiz "Maximo/Minimo sao: "
	.text
	.globl main
	
main:	li	$t1,0
	li	$t2,0x7FFFFFFF
	li	$t3,0x80000000
	
	la	$a0,string1
	li	$v0,print_string
	syscall
	
do:	li	$v0,read_int
	syscall
	or	$t0,$0,$v0
	
if:	beq	$t0,0,endif

if2:	ble	$t0,$t3,next_if
	or	$t3,$0,$t0
	
next_if:bge	$t0,$t2,endif
	or	$t2,$t0,$0
	
endif:	addiu	$t1,$t1,1

while:	bge	$t1,20,endw
	bne	$t0,0,do
	
endw:	la	$a0,string2
	li	$v0,print_string
	syscall
	
	move	$a0,$t3
	li	$v0,print_int10
	syscall
	
	li	$a0,':'
	li	$v0,print_char
	syscall
		
	move	$a0,$t2
	li	$v0,print_int10
	syscall
	
	jr	$ra