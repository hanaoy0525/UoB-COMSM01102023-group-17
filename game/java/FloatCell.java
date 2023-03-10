public class FloatCell extends Cell{

    public direction dir;

    public FloatCell() {
        super(Type.FLOAT);
        if (Math.random() * 10 < 5){
            dir = direction.LEFT;
            dir = direction.RIGHT;
        }
    }

    public FloatCell(direction dir) {
        super(Type.FLOAT);
        this.dir = dir;
    }

    public void changeDirection(){
        if (this.dir == direction.LEFT){
            this.dir = direction.RIGHT;
        }else{
            this.dir = direction.LEFT;
        }
    }

    public direction getDirection(){
        return dir;
    }
}
