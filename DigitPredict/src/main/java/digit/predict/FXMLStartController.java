package digit.predict;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import javax.imageio.ImageIO;
import javafx.embed.swing.SwingFXUtils;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.image.ImageView;
import javafx.scene.image.WritableImage;
import javafx.scene.input.KeyCode;
import javafx.scene.input.MouseButton;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.shape.StrokeLineCap;
import javafx.scene.shape.StrokeLineJoin;
import javafx.stage.Stage;
import digit.struct.Predict;
import digit.struct.PredictFactory;
import digit.struct.Prediction;

public class FXMLStartController implements Initializable {

	//path of linear model
	static String PATH_TO_LINEAR_MODEL = "C:\\Users\\13605\\Desktop\\work\\work\\DigitPredict\\python\\linear-model\\saved-models\\linear";
	
	//path of convolutional model
    static String PATH_TO_CONVOLUTIONAL_MODEL = "C:\\Users\\13605\\Desktop\\work\\work\\DigitPredict\\python\\convolutional-model\\saved-models\\convolutional";

    //linear predict object
    Predict linearPredict;
    
    //convolutional predict object
    Predict convolutionalPredict;
    
    @FXML
    private Button bBegin;//start button of fxml
    
    //width of drawing area
    private final int CANVAS_WIDTH = 280;
    
    //height of drawing area
	private final int CANVAS_HEIGHT = 280;
	
	//label for showing result
	private Label lblResult;
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {

    }    

    //main function for constructing recognition interface
    @FXML
    private void loadProject(ActionEvent event) {
        try{
        	//get predict objects from factory pattern class
        	convolutionalPredict = PredictFactory.getPredict("Convolutional", PATH_TO_CONVOLUTIONAL_MODEL);
            linearPredict = PredictFactory.getPredict("Linear", PATH_TO_LINEAR_MODEL);
            
            //drawing canvas
	        Canvas canvas = new Canvas(CANVAS_WIDTH, CANVAS_HEIGHT);
	        
	        //scaled image view
			ImageView imgView = new ImageView();
			
			//context for drawing to canvas
			GraphicsContext ctx = canvas.getGraphicsContext2D();
			
			//set size of scaled image view
			imgView.setFitHeight(150);
			imgView.setFitWidth(150);
			
			//set line width, round and miter
			ctx.setLineWidth(25);
			ctx.setLineCap(StrokeLineCap.ROUND);
			ctx.setLineJoin(StrokeLineJoin.MITER);
			
			//for showing result
			lblResult = new Label();
			
			//horizontal layout
			HBox hbBottom = new HBox(10,canvas, imgView);
			
			//vertical layout
			VBox root = new VBox(5, hbBottom, lblResult);
			hbBottom.setAlignment(Pos.CENTER);
			root.setAlignment(Pos.CENTER);
			
			//create scene and stage for recognition
			Scene scene = new Scene(root, 700, 500);
	        Stage stage=new Stage();
	        
	        //set scene to stage
			stage.setScene(scene);
			
			//close prev stage and set new stage
            MainApp.window.close();
            MainApp.window=stage;
            
            //show and set title of stage
            stage.show();
			stage.setTitle("Digit Recognition");
			
			//mouse press event
	        canvas.setOnMousePressed(e -> {
				ctx.setStroke(Color.BLACK);
	            ctx.beginPath();
	            ctx.moveTo(e.getX(), e.getY());
	            ctx.stroke();
			});
	        
	        //mouse drag event
			canvas.setOnMouseDragged(e -> {
				ctx.setStroke(Color.BLACK);
				ctx.lineTo(e.getX(), e.getY());
				ctx.stroke();
			});
			
			//mouse click event
			canvas.setOnMouseClicked(e -> {
				if (e.getButton() == MouseButton.SECONDARY) {
					clear(ctx);
				}
			});
			
			//enter key event
			canvas.setOnKeyReleased(e -> {
				if(e.getCode() == KeyCode.ENTER) {
					
					//get image from canvas
	                BufferedImage scaledImg = getScaledImage(canvas);
	                
	                //set the image to scaled image view
	                imgView.setImage(SwingFXUtils.toFXImage(scaledImg, null));
	                
	                try {
	                	
	                	//predict with the image
	                	predictImage(scaledImg);
					} catch (Exception e1) {
						
						//exception handler
						e1.printStackTrace();
					}
	                    }
			});
			
			//clear drawing context
			clear(ctx);
			
			//set focus on canvas
			canvas.requestFocus();
			lblResult.setText("rightlick for clean and enter for guess");
        }catch(Exception ex){
            System.out.println(ex);
        }
    }
    
    //function for getting image from canvas
    private BufferedImage getScaledImage(Canvas canvas) {
		// for a better recognition we should improve this part of how we retrieve the image from the canvas
		WritableImage writableImage = new WritableImage(CANVAS_WIDTH, CANVAS_HEIGHT);
		canvas.snapshot(null, writableImage);
		Image tmp =  SwingFXUtils.fromFXImage(writableImage, null).getScaledInstance(CANVAS_WIDTH, CANVAS_HEIGHT, Image.SCALE_SMOOTH);
		BufferedImage scaledImg = new BufferedImage(CANVAS_WIDTH, CANVAS_HEIGHT, BufferedImage.TYPE_INT_RGB);
		Graphics graphics = scaledImg.getGraphics();
		graphics.drawImage(tmp, 0, 0, null);
		graphics.dispose();
		return scaledImg;
	}

    //clear function
	private void clear(GraphicsContext ctx) {
		ctx.setFill(Color.WHITE);
		ctx.fillRect(0, 0, 280, 280);
	}
	
	//predict function with image
	private void predictImage(BufferedImage img ) throws IOException {
		//temporary file
		File image = new File("tmp.jpg");
        try {
            ImageIO.write(img, "jpg", image);
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        
        //make string for displaying result
        StringBuffer s = new StringBuffer();
        
        //convolutional result
        Predict predict = convolutionalPredict;
        Prediction prediction = predict.predict(image);
        s.append("ConvolutionalPredict :");
        s.append("Digit predicted " + prediction.getDigit() + ",");
        s.append("With a percentage of :" + String.format("%.2f", prediction.getClasses()[prediction.getDigit()] * 100) + "%\n");
        
        //linear result
        predict = linearPredict;
        prediction = predict.predict(image);
        
        s.append("LinearPredict : ");
        s.append("Digit predicted" + prediction.getDigit() + ",");
        s.append("With a percentage of :" + String.format("%.2f", prediction.getClasses()[prediction.getDigit()] * 100) + "%\n");
        for (int i = 0; i < 10; i++) {
            s.append("		Digit:" + i + ",");
            s.append("Percentage:" + String.format("%.2f",prediction.getClasses()[i] * 100) + "%\n");
        }
        
        //display function with result
        lblResult.setText(s.toString());
	}


}
