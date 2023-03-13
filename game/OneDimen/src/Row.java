public class Row {
    RowType type;

    int platformX; //  0 <= x < 100

    // the length is 80,
    public Row(RowType type, int platformX) {
        this.type = type;
        this.platformX = platformX;
    }

    public RowType getType(){
        return this.type;
    }

    public int getPlatformX(){
        return this.platformX;
    }

}
