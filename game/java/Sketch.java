import processing.core.PApplet;

import java.awt.geom.Arc2D;

public class Sketch extends PApplet {


	void doddleDraw(){
		printBoard();
		if (testGrid.dir == direction.up){
			testGrid.doddleY--;
			testGrid.curstep++;
			if (testGrid.curstep == testGrid.maxstep){
				testGrid.dir = direction.down;
			}
		}else if (testGrid.dir == direction.down){
			if (testGrid.doddleY - testGrid.pivt >= 39 || testGrid.doddleY >= 159){
				exit();
			}
			if (testGrid.doddleY + 1 < 160 && testGrid.board[testGrid.doddleY + 1][testGrid.doddleX].type != Type.EMPTY){
				testGrid.dir = direction.up;
				if (testGrid.curstep > 0) {
					testGrid.pivt -= testGrid.curstep;
				}
				testGrid.curstep = 0;
				if (testGrid.board[testGrid.doddleY + 1][testGrid.doddleX].type == Type.ONETIME){
					int left = testGrid.doddleX;
					int right = testGrid.doddleX + 1;
					while (testGrid.board[testGrid.doddleY + 1][left].type == Type.ONETIME) {
						testGrid.board[testGrid.doddleY + 1][left--].type = Type.EMPTY;
					}
					while (testGrid.board[testGrid.doddleY + 1][right].type == Type.ONETIME) {
						testGrid.board[testGrid.doddleY + 1][right++].type = Type.EMPTY;
					}
				}
				return;
			}
			testGrid.doddleY++;
			testGrid.curstep--;
			}
		delay(60 + testGrid.curstep * testGrid.curstep);
	}



	void printBoard(){
		for (int j = testGrid.pivt; j < testGrid.pivt + 40; j++){
			int mark = testGrid.pivt;
			for (int i = 0; i < 40; i++){
				int optic = 150;
				if (j == testGrid.doddleY && i == testGrid.doddleX){
					fill(0, 0, 0);
				}else{
					println(j + " " + i);
					if (testGrid.board[j][i].type == Type.EMPTY) {
						noStroke();
						fill(255,255,255, optic);
					}else{
						println("not empty");
						stroke(0);
						if (testGrid.board[j][i].type == Type.CONSTANT){
							fill(124,252,0, optic);
						}else if (testGrid.board[j][i].type == Type.ONETIME){
							fill(218,165,32, optic);
						}else if (testGrid.board[j][i].type == Type.FLOAT){
							fill(127,255,212, optic);
						}
					}
				}
				rect(i * 10, (j - mark) * 10, 10, 10);
			}
		}
		floatCellMove();
	}
	static int floatcnt = 0;

	private void floatCellMove() {

		for (int j = 0; j < testGrid.board.length; j++){
			for (int i = 0; i < testGrid.board[0].length; i++){
				if (testGrid.board[j][i].type == Type.FLOAT){
					if (i + 1 < 40){
						((FloatCell) testGrid.board[j][i + 1]).dir = ((FloatCell) testGrid.board[j][i]).dir;
						if (floatcnt == 5){
							((FloatCell) testGrid.board[j][i + 1]).changeDirection();
						}
						int last = i + 1;
						while (last < 39 && testGrid.board[j][last] instanceof FloatCell){
							last++;
						}
						testGrid.board[j][last] = new FloatCell();
						testGrid.board[j][i] = new Cell(Type.EMPTY);
					}
					/*
					else{
						if (i - 1 < 40){
							((FloatCell) testGrid.board[j][i - 1]).dir = ((FloatCell) testGrid.board[j][i]).dir;
							if (floatcnt == 5){
								((FloatCell) testGrid.board[j][i + 1]).changeDirection();
							}
							int last = i - 1;
							while (testGrid.board[j][last] instanceof FloatCell){
								last--;
							}
							testGrid.board[j][last] = new FloatCell();
						}
					}
					*/
				}
			}
		}
		floatcnt++;
		if (floatcnt >= 6){
			floatcnt = 0;
		}
	}

	@Override
	public void keyPressed(){
		if (keyCode == LEFT){

			testGrid.doddleX--;
			if (testGrid.doddleX == 0){
				testGrid.doddleX = 39;
			}

		}else if (keyCode == RIGHT){
			testGrid.doddleX++;
			if (testGrid.doddleX == 40){
				testGrid.doddleX = 0;
			}

		}
	}


	Grid testGrid = new Grid(160, 40);
	public void settings() {
		size(400, 400); // Set the size of the sketch window
	}

	public void setup(){
		size(400, 400);
		frameRate(60);
		noStroke();
	}

	public void draw() {
		background(255);
		doddleDraw();
	}

	public static void main(String[] args) {
		PApplet.main("Sketch"); // Replace with the name of your sketch class
	}
}
