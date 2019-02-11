[The Manual with Examples](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2018_3/ug901-vivado-synthesis.pdf)

[The starting point or hub of all Xilinx Manuals](https://www.xilinx.com/support/documentation-navigation/design-hubs/dh0018-vivado-synthesis-hub.html)

## 1Lut_Mux

One goal might be to use the primitives within the FPGA CLB. Chapter 3 of the Vivado 7 Series Libraries  lists off the primitives. Chapter 4 describes how to implement them using VHDL and Verilog. Explore the LUT and MUX in this project. 

#### Port Diagram

#### Verilog Code

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

Look at the truth table in the Verilog code and be able to describe the switches needed to access a row in it and predict the output. 

#### Prompts

*Does it look like the primitives can be accessed in Verilog?* 

*Can you see a direct relationship between the primitive used and the primitive referenced in the Verilog code?*

*The Mux implementation leaf cell seems to highlight a vertical path within the CLB. Why?*

*How is the LUT instantiation different from the normal instantiation of calling a pre-existing module ?*

*What Line of the Code puts a truth table in the LUT?*

*How many rows are there to the truth table?*

*How is the LUT instantiation different from the normal instantiation of calling a pre-existing module?*

*Look through chapters 3 and 4 of the Vivado 7 Series Libraries.  Focus on the Design Entry Method box.  Then answer these questions.*

*What does instantiation mean?*

*What does inference mean?*

*Have we inferred buffers (BUFG) in projects before?*

*What does instantiation mean?*

*What does inference mean?*

*Verilog has tristate [buffer primitives](http://verilog.renerta.com/mobile/source/vrg00003.htm)  named bufif0 and bufif1. These names don't appear in the Vivado 7 series libraries. Why? What are the risks of using the buffers Xilinx has named in this document?*

*Look up LUT6 in the Vivado 7 series library document. We instantiated it in this project. Is Instantiation possible according to the document?* 

*What is the preferred design entry method?* 

*Is MUXCY in the Vivado 7 series library document like LUT6?* 

*We instantiated MUXCY in this project's verilog code. And it looks like it was successfully implemented. We can test it. Read this [article](https://forums.xilinx.com/t5/Welcome-Join/where-are-the-muxcy-and-xorcy/td-p/311931) from from Jan 2013 about MUXCY and XORCY. Do you think it is wise to use this piece of a CLB in a circuit design project?*

*What would you guess is the preferred entry method for a MUXCY .. if it existed in the Vivado 7 series library?*

*Why do you think Xlinix still supports MUXCY (because we used it!), yet don't document it?*

*Xilinix was the [first FPGA vendor](http://hardwarebee.com/list-fpga-companies/) to start shipping LUT6 FPGAs. Intel FPGAs come from purchasing Xilinx's major competitor for years .. and ships a LUT6. How does [Flex-Logix](http://www.flex-logix.com/6lut-faster-denser/) fit into this competition?*

*Why is this question important to you, the college, the market place?* 

*What does [Flex-Logix name it's equivalent](http://www.flex-logix.com/dsp-applications/) of LUT6?*  

*Is the code on this [web site](http://www.flex-logix.com/dsp-applications/) verilog or it's competitor VHDL?*

*What class at HCC teaches you what a [FIR](http://www.flex-logix.com/dsp-applications/) is?* 

## 2Decoder

#### Port Diagram

#### Verilog Code

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

#### Prompts 

*How many of the outputs of the Decoder are positive at any given instant in time?*

*When the Decoder changes it's output, what happens among these choices:*

1. *Do all outputs go to 0 before the next set of outputs are displayed?* 
2. *Do the new 1(s) appear along with the previous 1(s) simultaneously?*
3. *Does/Do the output(s) flicker in some unknown way based on impurities or differences in the fabric of the FPGA?*
4. *Do we have the tools to figure out what the answer is?*	

*Given the concept of an [infinitesimal](https://en.wikipedia.org/wiki/Infinitesimal), is it ever possible for two outputs, from any circuit to change simultaneously?*



## 3PriorityEncoder

A encoder is different than a mux in that there are no select lines. Only one input out of all the inputs coming in is expected to be a 1.  So what happens if more than one input is a 1? Priority is assigned. For example, which child of all your children get's your attention if all are yelling at you at the same time? You have to choose. 

In hardware, it is the outputs of other circuits that need attention. One circuit finished multiplying and the output needs to be transferred somewhere else so it can begin the next multiply. Meanwhile the keyboard circuit has taken the x and y coordinates, has detected the key is stuck, has stopped repeating the key, is beeping the user and needs to trigger software that displays a message on the screen "key stuck." Which takes priority if both are one at the same time?  

To deal with more than one input, the designer has to deal with two issues:   
What is the priority order?

What is the difference between the 0 net of the bus having a 1 on it asking for priority and silence .. nobody asking for priority? 

It is a tricky, logic problem. Look at the first two rows of the truth table below. The first row is where none of the inputs are asking for attention. V=0 because Y1 and Y0 could be anything. 

![img](table4.JPG)

There four vivado projects. There are three different verilog expressions introduced. The first synthesizeable verilog code has been introduced. Do one port interface diagram. Do four Verilog code screen shots and four screen shots of everything else. The goal is to compare them.  Just describe how the three test below.

#### Port Diagram

#### Verilog Code

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

#### Prompts

How is the gate verilog code different between AllThree and Gate?

The first synthesizable System Verilog commands have been introduced. How can you tell by the source verilog file extension?  

Where in the verilog "new project sequence of steps" are you given the option of creating system verilog or just plane verilog?

In what way does the DataFlow implementation use the if command?

In AllThree, why would always @* work ... in addition to always_combo?

In System Verilog, what are the other two always commands?

From a design point of view, which implementation of a priority encoder do you think Vivado expects engineers to ask it to implement? 

Which implementation of a priority encoder looks like the easiest to spot and see within a much much larger chunk of verilog code? 

Which is probably the most sustainable (will be supported by vendors in the future, future engineers looking at the code will understand it)?  

Which will be the easiest to change/modify?

We have been told that implementation within the FGPA doesn't matter from a net and leaf cell count point of view. We don't see obvious controls that specify where within the chip everything is implemented. (It looks like resources next to the switch and LED pads are being used constantly.) But real quick in the future, speed is going to matter. Which of these priority encoder looks like it will be the fastest?

Why is speed not important to us right now?

## 4ROMpattern

#### Port Diagram

#### Verilog Code

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing



#### Prompts

## 5ROMmultiply

#### Port Diagram

#### Verilog Code

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

Look at the truth table in the Verilog code and be able to describe the switches needed to access a row in it and predict the output. 

#### Prompts