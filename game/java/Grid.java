public class Grid{
	Cell[][] board;
	int doddleY;
	int doddleX;
	int pivt;
	int curstep;
	int maxstep;
	direction dir;
	public Grid(int y, int x){
		board = new Cell[y][x];

		for (int j = 0; j < y; j++){
			for (int i = 0; i < x; i++){
				if (random(100) > 97){

					int len =(int) random(2)+4;
					for(int k = 0;k < len && i+k < 40;k++){
						board[j][i + k] = new Cell(true);
					}
					i=i+len - 1;

					while (i < x){
						board[j][i++] = new Cell(false);
					}

				}else {
					board[j][i] = new Cell(false);
				}
			}
		}
		doddleX = x / 2;
		doddleY = y - 10;
		pivt = y - 40;
		curstep = 0;
		maxstep = 8;
		dir = direction.up;
	}

	private int random(int i) {
		return (int) (Math.random() * i);
	}
}