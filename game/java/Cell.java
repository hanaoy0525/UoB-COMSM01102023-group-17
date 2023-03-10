public class Cell{
	boolean isSolid;
	int r;
	int g;
	int b;

	public Cell(){
		isSolid = false;
		this.r = 255;
		this.g = 255;
		this.b = 255;
	}

	public Cell(int r, int g, int b){
		isSolid = true;
		this.r = r;
		this.g = g;
		this.b = b;
	}
}
