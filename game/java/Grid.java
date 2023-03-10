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
				int rand = random(100);
				if (rand <= 94) {
					board[j][i] = new Cell(Type.EMPTY);
					continue;
				}else{
					Type type;
					if (rand <= 96){
						type = Type.CONSTANT;
					}else if (rand <= 98){
						type = Type.ONETIME;
					}else{
						type = Type.FLOAT;
					}
					int len = random(2) + 4;
					for(int k = 0; k < len && i + k < 40; k++){
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
		pivt = y - 40;
		curstep = 0;
		maxstep = 8;
		dir = direction.up;
	}

	private int random(int i){
		return (int) (Math.random() * i);
	}
}