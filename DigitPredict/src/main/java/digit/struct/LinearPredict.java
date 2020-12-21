package digit.struct;

import org.tensorflow.Session;
import org.tensorflow.Tensor;

import java.io.File;

//Linear based Predict class
public class LinearPredict extends Predict {

	//constructor
    public LinearPredict(String pathToModel) {
        super(pathToModel);
    }

    //predict function with image
    public Prediction predict(File image) {
    	//convert to Mnist array
        Tensor input = convertToMnistArray(image);
        
        //get sesion of trained model
        Session s = model.session();
        
        //run with model
        Tensor result = s.runner()
                .feed("x", input)
                .fetch("y")
                .run().get(0);
        //fetch result
        float[] fetched = fetchResult(result);
        
        //get prediction from fetched result
        Prediction prediction = new Prediction(fetched, getDigit(fetched));
        return prediction;
    }
}
