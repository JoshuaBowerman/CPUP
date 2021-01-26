
define .next
	POUT RIN
	INC_AM ADD
	ROUT ADDR_IN PIN
	NOP
	INST_READ DONE
end 
define .jmp_amem
	POUT RIN
	OUT1 ADD
	ROUT ADDR_IN
	NOP
	READ ADDR_IN PIN
	NOP
	INST_READ
end
define .jmp_reg
	AOUT PIN ADDR_IN
	NOP
	INST_READ DONE
end
define .jmp_mem
	AOUT ADDR_IN PIN
	NOP
	INST_READ DONE
end

define $NOP
	NOP
	.next
end

define $MOV REG REG
	AOUT BIN
	.next
end

define $MOV REG MEM
	BOUT ADDR_IN
	AOUT WRITE
	.next
end

define $MOV AINT REG
	POUT RIN
	OUT1 ADD
	ROUT ADDR_IN
	NOP
	READ BIN
	.next
end
define $MOV MEM REG
	AOUT ADDR_IN
	NOP
	READ BIN
	.next

end
define $MOV AMEM REG
	POUT RIN
	OUT1 ADD
	ROUT ADDR_IN
	NOP
	READ ADDR_IN
	NOP
	READ BIN
end
define $JMP REG
	.jmp_reg
end

define $JMP MEM
	.jmp_mem
end

define $JMP AMEM
	.jmp_amem
end




