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
				int rand = random(300);
				if (rand <= 296) {
					board[j][i] = new Cell(Type.EMPTY);
					continue;
				}else{
					Type type;
					if (rand <= 298){
						type = Type.CONSTANT;
					}else if (rand <= 299){
						type = Type.ONETIME;
					}else{
						type = Type.FLOAT;
					}
					int len = 8;


					for(int k = 0; k < len && i + k < x; k++){
						if (type != Type.FLOAT){
							board[j][i + k] = new Cell(type);
						}else{
							board[j][i + k] = new FloatCell();
						}
					}
					i += len - 1;
					while (i < x){
						board[j][i++] = new Cell(Type.EMPTY);
					}
				}
			}
		}
		doddleX = x / 2;
		doddleY = y - 10;
		pivt = y - Sketch.windowHeight;
		curstep = 0;
		maxstep = (int) (Sketch.windowHeight / 2 * 0.75);
		dir = direction.UP;
	}

	private int random(int i){
		return (int) (Math.random() * i);
	}

	public void changeDir(){
		for (int j = 0; j < board.length; j++){
			for (int i = 0; i < board[0].length; i++){
				if (board[j][i] instanceof FloatCell){
					((FloatCell) board[j][i]).changeDirection();
				}
			}
		}
	}
}