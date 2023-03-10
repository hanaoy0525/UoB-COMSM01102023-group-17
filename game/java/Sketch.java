import processing.core.PApplet;

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

			//println(testGrid.doddleY);

			if (testGrid.doddleY + 1 < 160 && testGrid.board[testGrid.doddleY + 1][testGrid.doddleX].isSolid){
				testGrid.dir = direction.up;
				if (testGrid.curstep > 0){
					testGrid.pivt -= testGrid.curstep;
				}

				testGrid.curstep = 0;

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
					if (testGrid.board[j][i].isSolid){
						stroke(0);
						fill(124,252,0, optic);
					}else{
						noStroke();
						fill(255,255,255, optic);
					}


				}
				rect(i * 10, (j - mark) * 10, 10, 10);
			}
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
