import processing.core.PApplet;

import java.awt.geom.Arc2D;
import java.util.Random;

public class Sketch extends PApplet {

    public int doddleX;
    public static int maxStep = 100;
    public int step;
    public Direction dir;

    @Override
    public void keyPressed(){
        if (keyCode == LEFT){
            doddleX -= 4;

            if (doddleX < 0){
                doddleX = 399;
            }
        }else if (keyCode == RIGHT){
            doddleX += 4;
            if (doddleX >= 400){
                doddleX = 0;
            }
        }

        if (keyCode == UP){
            slideScreen();
        }
    }

    public void doddleDraw(){
        fill(0, 255, 0);

        if (dir == Direction.UP){
            rect(doddleX, 450 - step, 40, 60);
            step += 2;
            if (step >= maxStep){
                dir = Direction.DOWN;
            }
        }

        if (dir == Direction.DOWN){
            rect(doddleX, 450 - step, 40, 60);
            step -= 2;
            if (step <= 0){
                dir = Direction.UP;
            }
        }

    }



    public void settings() {
        size(400, 600); // Set the size of the sketch window
    }

    public void setup(){
        size(400, 600);
        boardSetUp();
        doddleX = 200;
        dir = Direction.UP;
    }

    Row[] board = new Row[600];

    public void boardSetUp(){

        Random rand = new Random();
        Random randx = new Random();

        for (int i = 0; i < 600; i++){
            if (rand.nextInt(100) < 90){
                board[i] = new Row(RowType.EMPTY, -1);
            }else{
                board[i] = new Row(RowType.CONSTANT, randx.nextInt(319) + 40);
                for (int j = i + 1; j < i + 50 && j < 600; j++){
                    board[j] = new Row(RowType.EMPTY, -1);
                }
                i += 49;
            }
        }

    }

    public void draw() {
        background(255);

        for (int i = 0; i < 600; i++){
            if (board[i].getType() == RowType.EMPTY){
                continue;
            }else{
                fill(255, 144, 66);
                rect(board[i].getPlatformX(), i, 80, 20);
            }
        }

        doddleDraw();
    }

    public void slideScreen(){
        for (int i = 599 - 1; i >= 1; i--){
            board[i] = board[i - 1];
        }

        if ((int) (Math.random() * 100) < 85){
            board[0] = new Row(RowType.EMPTY, -1);
        }else{
            board[0] = new Row(RowType.CONSTANT, (int) (Math.random() * 400));
        }

    }

    public static void main(String[] args) {
        PApplet.main("Sketch"); // Replace with the name of your sketch class
    }
}
