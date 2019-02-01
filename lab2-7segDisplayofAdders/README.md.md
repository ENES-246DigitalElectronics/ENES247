# Lab 2 7segment Display and Adders

Going to build a 7 seg display several different ways, then an adder, then a fast adder with fast carry logic and really use more of a CLB block than a LUT.

## Lab 2_0Constants

Constants are typically easy in other languages. In circuit design, constants are used too often. A constant can have four values:

​	0
​	1
​	x unknown
​	z high impedance (tri-state)

### Syntax

Verilog is case insensitive when specifying constants. In general, Verilog is case sensitive. 

Vivado tries to get rid of constants and change z into x at some point in the workflow. 

Integers can be written like constants in other programs such as  +3 -21, but you have no control over the bit width.  Negative numbers are represented by a 1 in the most significant bit  (MSB). 

Constants can be specified at the bit level in this format:

​			**[size] 'base value** 

**size** specifies the number of bits,   
**base** is one of o or O (octal), b or B (binary), d or D (decimal), h or H (hexadecimal),   
**value** is a sequence of digits which are valid for the specified base. 

For example,
wire [4:0] 5'O37 			11111
reg [3:0] 4'B1x_01 		1x01   the underscore _ is considered white space here
wire [11:0] 7'Hx 		 	 xxxxxxx 

Vivado does support the signed (MSB bit used as positive or negative) Verilog math golden rule:  [All operands must be signed](http://billauer.co.il/blog/2012/10/signed-arithmetics-verilog/). 

Vivado does not support signed constants that are defined in Verilog (using the MSB to keep track of positive and negative). 

If the size specified is larger than the value for the specified constant, the number is padded to the left
with 0’s except for the case where the left most bit is x or z then the padding is done with x or z. 

If the size specified is smaller than the extra leftmost bits are ignored. 

If the size is not specified then it will use 32-bit data.

### Lab2_0Constants

Your goal is to develop a circuit with four BCD bits coming in and 7 bits leaving to support a 7 segment display.

![1549030304451](1549030304451.png)

CA, CB, CC, CD, CE, CF, CG and DP (decimal place), are all wired in parallel to each of the 8 displays. There are only 8 wires going from any circuit to all 8 displays. The AN (anodes) turn the 8 displays off and on. there is one AN wire going to each of the 8 displays. AN wires are active low, meaning a 0 turns them on and a 1 turns them off. 

#### Port Interface

![BCDto7segDisplay](BCDto7segDisplay.svg)

#### Verilog Code

This circuit has nothing to do with choosing which of the 8 segments are being used. Another circuit is going to have to do that. But we need to turn them off in order to test this circuit. 

<u>Obvious Solution</u>

The obvious solution in verilog:

![1549031314789](1549031314789.png)

There is some logic behind this code. Look at the equation for seg(6) or g. Only two numbers turn off  segment g: **1 or 7**,  **0001 or 0111**, (**~x[3] & ~x[2] & ~x[2]** ) |(**x[2] & x[1] & x[0]** ). 

Is this obvious to a electrical or computer engineer working in the field?  **Yes.** Are their other solutions? **Yes.**  Is this where the artistic creativity of an engineer creeps in? **Yes.** Might they be less obvious to a electrical or computer engineer? **Yes.** 

<u>Spreadsheet Solution</u>



**Prompts**

Was the <u>obvious solution</u> obvious to you? Did you see this before reading the logic behind the code?
Did you try to dream up your own solution just looking at the port interface first?

Do these solutions blind you .. prevent you from seeing other solutions than the two described above?

In what way does the spreadsheet represent [scope creep](https://en.wikipedia.org/wiki/Scope_creep)?

What are the project requirement scopes that the spreadsheet solution expanded? 

What is normal? For an engineer to create a complicated solution, and revisit the project requirements to see if the project is out of scope? Or design a minimal, elegant solution that perfectly matches the design requirements the first time? 





