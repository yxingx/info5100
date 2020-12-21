package digit.struct;

import org.tensorflow.Session;
import org.tensorflow.Tensor;
import org.tensorflow.Tensors;

import java.io.File;

//Convolutional based Predict class
public class ConvolutionalPredict extends Predict {

	//construct
    public ConvolutionalPredict(String pathToModel) {
        super(pathToModel);
    }

    //predict function with image
    public Prediction predict(File image) {
    	//convert image to Mnist array
        Tensor input = convertToMnistArray(image);
        
        //get trained model session
        Session s = model.session();
        
        //run model
        Tensor result = s.runner()
                .feed("x", input)
                .feed("keep_prob_dropout", Tensors.create(0.75f))
                .fetch("y")
                .run().get(0);
        //fetch from result
        float[] fetched = fetchResult(result);
        
        //get predict result from fetched result
        Prediction prediction = new Prediction(fetched, getDigit(fetched));
        return prediction;
    }
}
