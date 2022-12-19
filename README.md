CEC330 Project - Description File
/////////////
//Engineers: Conrad Prisby, Shawn Merrick Miller, Kyle Fox
/////////////
//Sources - 
//Marry Had a Little Lamb Source: https://www.true-piano-lessons.com/mary-had-a-little-lamb.html
//GUI Code: Some of the GUI code was developed from code provided by Dr. Brian Butka
/////////////
//Description: This project implements a Dance Dance Revolution game for the Nexys-A7 FPGA chip.
	The DDR game works by playing a song, in our case Mary had a Little Lamb, and moving balls/blocks
	down a screen. Then the player will press the coresponding button for that column and song note, while
	to create the song as the game continues.
	
	This is implemented by 14 verilog files that work together to implement a scoring system, musical element,
	and VGA display.
	
	Project.v - The top module of the program is the "Project.v" file. This file combines all the other modules and uses
	wires to move data between modules and connect the project to each physical component.
	
	GameCtrl - This module controls the points system of the game. Based on when the button is pressed, a score is given
	and that score is then saved in a high score at the end of a game.
	
	Display - This module is a simple 7-Segment multiplexer that the score is displayed on.
	
	BinaryTable - This module is a lookup table to convert the score from binary to BCD to allow for the score to be more readable.
	
	Button_Control - This module changes the frequency that is played when a button is pressed.
	As each button is pressed during the game, a note is played.
	
	s_CLK - This clock is used to create the PWM signal needed for each note.
	
	Mover - This module moves the ball vertically across the screen as the game progresses.
	This module also works with the speed switch to display the balls faster or slower depending on the selected speed.
	
	Ball2 - This module sets the position of each ball that is on the screen. Each ball is precoded to a position.
	
	Vga-640-480 - This module is the given module to display to the VGA output.
	
//This project was implemented in parts by each Engineer seperately and then was combined into one project.
