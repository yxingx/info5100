package digit.struct;

import org.tensorflow.SavedModelBundle;
import org.tensorflow.Tensor;
import org.tensorflow.Tensors;
import digit.utils.ImageUtils;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

//abstract class for predict classes
public abstract class Predict {
	
	//trained model
    protected SavedModelBundle model;

    //construct with model path
    public Predict(String pathToModel) {
        this.model = SavedModelBundle.load(pathToModel, "serve");
    }

    //convert image to Mnist tensor's array
    protected Tensor<Float> convertToMnistArray(File image){
    	
    	//buffer image for image file
        BufferedImage bufferedImage = null;
        try {
        	//read image
            bufferedImage = ImageIO.read(image);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //convert buffered image to Mnist array
        float[] matrix = ImageUtils.toMnistArray(bufferedImage);
        float[][] inputs = new float[1][784];
        inputs[0] = matrix;
        return Tensors.create(inputs);
    }

    //fetch function from tensor reuslt
    protected float[] fetchResult(Tensor result){
        float[][] res = new float[1][10];
        result.copyTo(res);
        return res[0];
    }
    //predict function , abstract function
    public abstract Prediction predict(File image);

    //function for getting predicted digit
    public int getDigit(float[] prediction){
        int maxi = 0;
        for ( int i=0; i<10; i++) {
            if(prediction[i]>prediction[maxi])
                maxi = i;
        }
        return maxi;
    }
}
