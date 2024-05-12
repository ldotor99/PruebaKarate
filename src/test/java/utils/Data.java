package utils;

public class Data {

    public int numberRandom = (int) (Math.random()*10 + 1);

    public int getNumberRandom() {
        return numberRandom;
    }

    public void setNumberRandom(int numberRandom) {
        this.numberRandom = numberRandom;
    }
}
