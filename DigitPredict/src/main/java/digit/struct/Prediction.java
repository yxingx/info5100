package digit.struct;

//class for saving prediction result
public class Prediction implements PredictionInterface{
	//member for all prediction classes
    protected float[] classes;
    
    //prediction result digit
    protected int digit;

    //constructor
    public Prediction(float[] classes, int digit) {
        this.classes = classes;
        this.digit = digit;
    }
    //get classes
    public float[] getClasses() {
        return classes;
    }
    //get predict digit
    public int getDigit() {
        return digit;
    }
}
