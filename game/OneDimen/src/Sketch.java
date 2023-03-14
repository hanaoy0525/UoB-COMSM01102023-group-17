import processing.core.PApplet;
import processing.core.PFont;

import java.awt.geom.Arc2D;
import java.util.Random;

public class Sketch extends PApplet {

    public boolean isGameOver;
    public Doddle doddle;
    public static int maxStep = 150;

    public int slide;

    public int changeScale;

    public int changeCur;

    @Override
    public void keyPressed(){
        if (keyCode == LEFT){
            doddle.setDoddleX(doddle.getDoddleX()-5);
            //doddleX -= 5;

            if (doddle.getDoddleX() < 0){
                doddle.setDoddleX(399);
            }
        }else if (keyCode == RIGHT){
            doddle.setDoddleX(doddle.getDoddleX()+5);
            //doddleX += 5;
            if (doddle.getDoddleX() >= 400){
                doddle.setDoddleX(0);
            }
        }

        if (keyCode == UP){
            slideScreen();
        }
    }

    public void doddleDraw(){
        fill(0, 255, 0);

        // draw the head
        ellipse(doddle.getDoddleX() + 11, doddle.getDoddleY() - 45, 30, 30);

        // draw the body
        rect(doddle.getDoddleX(), doddle.getDoddleY() - 30, 22, 30);

        // draw the leg
        rect(doddle.getDoddleX(), doddle.getDoddleY(), 8, 15);

        rect(doddle.getDoddleX() + 14, doddle.getDoddleY(), 8, 15);


        if (doddle.getDir() == Direction.UP){
            doddle.setDoddleY(doddle.getDoddleY()-2);
            doddle.setStep(doddle.getStep()+2);
            //doddleY -= 2;
            //step += 2;
            if (doddle.getStep() >= maxStep || doddle.getDoddleY() <= 75){
                doddle.setDir(Direction.DOWN);
                doddle.setStep(0);
//                dir = Direction.DOWN;
//                step = 0;
            }
        }

        if (doddle.getDir() == Direction.DOWN){
            doddle.setDoddleY(doddle.getDoddleY()+2);
            //doddleY += 2;
            newPlatform();
        }
    }

    public void newPlatform(){
        if (board[doddle.getDoddleY() + 15].getType() != RowType.EMPTY){
            if (doddle.getDoddleX() + 22 >= board[doddle.getDoddleY() + 15].getPlatformX()
                    && doddle.getDoddleX() <= board[doddle.getDoddleY() + 15].getPlatformX() + 80){
                doddle.setDir(Direction.UP);
                if (board[doddle.getDoddleY() + 15].getType() == RowType.ONETIME){
                    board[doddle.getDoddleY() + 15].type = RowType.EMPTY;
                }
                slideScreenControl();
            }
        }

        if (board[doddle.getDoddleY() + 16].getType() != RowType.EMPTY){
            if (doddle.getDoddleX() + 22 >= board[doddle.getDoddleY() + 16].getPlatformX()
                    && doddle.getDoddleX() <= board[doddle.getDoddleY() + 16].getPlatformX() + 80){
                doddle.setDir(Direction.UP);
                if (board[doddle.getDoddleY() + 16].getType() == RowType.ONETIME){
                    board[doddle.getDoddleY() + 16].type = RowType.EMPTY;
                }
                slideScreenControl();
            }
        }
    }

    public void slideScreenControl(){

        if (slide > 0){
            return;
        }

        if (doddle.getDoddleY() <= 450){
            slide = 450 - doddle.getDoddleY();
        }else{
            slide = 0;
        }


    }

    public void settings() {
        size(400, 600); // Set the size of the sketch window
    }

    public void setup(){
        size(400, 600);

        //font setting
        PFont fontStyle;
        fontStyle=createFont("Arial", 16, true);
        textFont(fontStyle, 36);
        textAlign(CENTER);

        boardSetUp();
        this.doddle=new Doddle(200, 450, Direction.UP);
//        doddleX = 200;
//        doddleY = 450;
//        dir = Direction.UP;
        slide = 0;
        changeScale = 50;
        changeCur = 0;
    }

    Row[] board = new Row[600];

    public void boardSetUp(){

        Random rand = new Random();
        Random randx = new Random();

        for (int i = 0; i < 600; i++){
            int randomNum = rand.nextInt(100);
            if (randomNum < 95){
                board[i] = new Row(RowType.EMPTY, -1);
            }else{
                if (randomNum < 98){
                    board[i] = new Row(RowType.CONSTANT, randx.nextInt(319) + 40);
                }else if (randomNum < 99){
                    board[i] = new Row(RowType.ONETIME, randx.nextInt(319) + 40);
                }else{
                    board[i] = new Row(RowType.FLOAT, randx.nextInt(319) + 40);
                }

                for (int j = i + 1; j < i + 50 && j < 600; j++){
                    board[j] = new Row(RowType.EMPTY, -1);
                }
                i += 49;
            }
        }

    }

    public void draw() {
        background(255);
        if(isGameOver==true){
            background(0,0,0);
            fill(255, 0, 0);
            text("Game over", 200, 300);
            return;
        }
        if (slide > 0){
            for(int i=0;i<4;i++){
                slideScreen();
            }
            printBoard();
            doddleDraw();
            floatPlatformMove();
            for(int i=0;i<4;i++){
                slide--;
            }
            if (doddle.getDir() == Direction.DOWN){
                slide = 0;
            }
            return;
        }
        if(doddle.getDoddleY() >= 579){
//            exit();
            isGameOver=true;
        }
        printBoard();
        floatPlatformMove();
        doddleDraw();
    }

    private void floatPlatformMove() {
        for (int i = 0; i < 600; i++){
            if (board[i].getType() == RowType.FLOAT){
                board[i].floatMove();
            }
        }
        changeCur++;
        if (changeCur == changeScale){
            changeDirection();
            changeCur = 0;
        }
    }

    public void changeDirection(){
        for (int i = 0; i < 600; i++){
            if (board[i].getType() == RowType.FLOAT){
                board[i].changeDir();
            }
        }
    }

    public void printBoard(){
        for (int i = 0; i < 600; i++){
            if (board[i].getType() == RowType.EMPTY){
                continue;
            }

            if (board[i].getType() == RowType.CONSTANT){
                fill(255, 144, 66);
            }else if (board[i].getType() == RowType.ONETIME){
                fill(255, 255, 0);
            }else if (board[i].getType() == RowType.FLOAT){
                fill(224,255,255);
            }
            rect(board[i].getPlatformX(), i, 80, 20);
        }
    }

    public void slideScreen(){
        for (int i = 599 - 1; i >= 1; i--){
            board[i] = board[i - 1];
        }

        if (firstPlatform() < 60){
            board[0] = new Row(RowType.EMPTY, -1);
        }else{
            int rand = ((int) (Math.random() * 100));
            if (rand < 80){
                board[0] = new Row(RowType.CONSTANT, (int) (Math.random() * 400));
            }else if (rand < 95){
                board[0] = new Row(RowType.ONETIME, (int) (Math.random() * 400));
            }else{
                board[0] = new Row(RowType.FLOAT, (int) (Math.random() * 400));
            }

        }

    }

    public int firstPlatform(){
        int res = 0;
        for (int i = 0; i < 600; i++){
            if (board[i].getType() != RowType.EMPTY){
                res = i;
                break;
            }
        }
        return res;
    }

    public static void main(String[] args) {
        PApplet.main("Sketch"); // Replace with the name of your sketch class
    }
}
