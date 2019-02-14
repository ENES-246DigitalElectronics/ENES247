

# Reusable BCD hex 7seg Display Code

The  HexToBCD algorithm in the last lab worked for one hex group. The problem is that it needs to be extended from 4 bits to 32 bits. Decoders, clocks and counters need to be added. The goal is to get that done here.

## Figure out what a decoder does. Explain in the testing.

## 2Decoder

#### Port Diagram

#### Verilog Code

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

___

## 1_32bitHexTo16LEDs

This code tests the ability to count clock pulses and display 32 bits split into two groups of 16. SW[0] switches between the two groups. 

#### Port Diagram

#### Verilog Code

#### ![1550065113070](1550065113070.png)

#### RTL Schematic Screen shot![1550065060021](1550065060021.png)

#### 

#### Synthesis Schematic Screen shot

![1550065504121](1550065504121.png)

#### Implementation Device screen shot zoomed in on something interesting

First Flip Flops Being Used, 

![1550065753110](1550065753110.png)

Carry Logic Being used

![1550065640417](1550065640417.png)

#### Testing

___

#### Prompts

## 2_32bitBCDto16LEDs

Modify the above code using this [algorithm](https://pubweb.eng.utah.edu/~nmcdonal/Tutorials/BCDTutorial/BCDConversion.html) to work with 32 bits rather than 16. Which of these three is the starting point?  

![1550060430510](1550060430510.png)

![1550060478999](1550060478999.png)

![1550060559247](1550060559247.png)

In addition, modify the number of bits counted, and add an overflow if needed or a reset to the counter so it doesn't appear to count to a large number and then hang or do something strange. 

#### Port Diagram

#### Verilog Code

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

## 3_bitSlicing

The goal  is to find a way to grab 4 bits out a group of 32 in a single line of code.  This technique is called bit slicing.  This is similar to slicing up a string or an array in other languages. 

#### Port Diagram

![bitSlicing](bitSlicing.svg)

#### Verilog Code 

![1550142135894](1550142135894.png)

#### RTL Schematic Screen shot

![1550141244347](1550141244347.png)

#### Synthesis Schematic Screen shot

![1550141427806](1550141427806.png)

#### Implementation Device screen shot zoomed in on something interesting

Four Luts are used to handle the multiplying asked for in the bit slicing.

![1550142512899](1550142512899.png)

#### Testing

3 Select bits select 1 of 8, 4 bit groups from a 32 bit constant and display on LEDs.  

------

#### Prompts

Slicing is part of a number of languages including  [python](https://www.programiz.com/python-programming/methods/built-in/slice) , [matlab](https://stackoverflow.com/questions/11318724/matlabs-slice-function-not-working-as-desired) and is a common search term to find something in other languages [C](https://stackoverflow.com/questions/14618342/copying-a-subset-of-an-array-into-another-array-array-slicing-in-c), [regular expressions](https://stackoverflow.com/questions/35578470/how-to-slice-characters-from-string-using-regex). *Is slice a concept or syntax in verilog*?

## 4_32bitsHexTo7segAnd16LEDs

This project is not yet finished. Please finish the documentation of it. It has  the switch between the two banks of 16 LEDs. Don't bother adding this to the port diagram. 

#### Port Diagram![Port7Seg](Port7Seg.svg)



#### Verilog Code

#### RTL Schematic Screen shot 

![1550152150693](1550152150693.png)

#### Synthesis Schematic Screen shot

![1550076024235](1550076024235.png)

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

 

------

#### Prompts

## 5_32bitsHexToBCDto7segAnd16LEDs

Add your 32bitHextoBCD code to the above project. Replace any of the modules that you see with more attractive code. Add comments that make it easier to understand. 

#### Port Diagram

The SVG file called Port7Seg.svg can be uploaded to draw.io to edit. 

#### Verilog Code

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

 

------

#### Prompts