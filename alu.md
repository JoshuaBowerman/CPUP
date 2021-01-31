#Arithmatic and Logic Unit

The alu performs all mathematic operations. It is able to perform addition, subtraction, multiplication, division, and modulus. It contains the 17bit register R, and the 16bit register ER. The register R is the result register, it is also commonly used to temporaraly store a value by microcode. it is not accessible to the user. The register ER is the error register, it is seperated by bit, For the purpoose of each bit see the attached table.

##ALU Control Bus
Index | Name | Function
----- | ---- | --------
0 | Rin | R <= bus
1 | Rout | bus <= R
2 | Add | R <= R + bus \(This also sets ER\[0\] to R\[16\]\)
3 | Sub | R <= R - bus \(This also sets ER\[0\] to R\[16\]\)
4 | Mul | R <= R \* bus \(This also sets ER\[0\] to R\[16\]\)
5 | Div | R <= R \\ bus \(This uses the attached division module. It also sets ER\)
6 | EROut | bus <= ER
7 | ERIn | ER <= bus \(This is useful for errors from each module\)
8 | Mod | R <= R % bus \(This uses the attached division module. It also sets ER\)

##ER bit functions

Index | Meaning
----- | -------
0 | Whether or not an operation caused an overflow.
1 | Whether or not result is 0(the two operands where equal when subracting)
2..15 | Unused