package digit.struct;

//factory class for generating predict objects
public class PredictFactory {
	public static Predict getPredict(String type,String path)
	{
		//type == Linear
		if("Linear".equalsIgnoreCase(type))
		{
			//get LinearPredict object
			return new LinearPredict(path);
		}
		else if("Convolutional".equalsIgnoreCase(type)) //type == Convolutional
		{
			//get ConvolutinalPredict object
			return new ConvolutionalPredict(path);
		}
		//if no type, return null
		return null;
	}
}
