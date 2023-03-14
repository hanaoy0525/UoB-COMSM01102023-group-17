
public class Doddle {
    private int doddleX;
    private int doddleY;

    private int step;
    private Direction dir;

    public Doddle(int doddleX, int doddleY, Direction dir){
        this.doddleX=doddleX;
        this.doddleY=doddleY;
        this.dir=dir;
        this.step=0;
    }
    public int getDoddleX(){
        return this.doddleX;
    }

    public int getDoddleY(){
        return this.doddleY;
    }

    public  void setDoddleX(int objVal){
        this.doddleX=objVal;
    }

    public  void setDoddleY(int objVal){
        this.doddleY=objVal;
    }

    public int getStep(){
        return this.step;
    }

    public void setStep(int objVal){
        this.step=objVal;
    }

    public Direction getDir(){
        return this.dir;
    }

    public void setDir(Direction dir){
        this.dir=dir;
    }
}
