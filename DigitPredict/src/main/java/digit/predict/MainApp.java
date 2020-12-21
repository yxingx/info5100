package digit.predict;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class MainApp extends Application {
    
	//top stage
    public static Stage window;
    
    @Override
    public void start(Stage stage) throws Exception {
    	
    	//load root interface fxml file
        Parent root = FXMLLoader.load(getClass().getResource("/fxml/FXMLStart.fxml"));
        
        //set top stage
        window=stage;
        
        //create first scene
        Scene scene = new Scene(root, 700, 500);
        
        //set stylesheet stage
        scene.getStylesheets().add("/styles/Styles.css");
        
        //set tile of stage
        stage.setTitle("Digit Recognition");
        
        //set opacity of stage
        stage.setOpacity(1.0);
        
        //initialize style of stage
        stage.initStyle(StageStyle.TRANSPARENT);
        
        //set scene as first scene
        stage.setScene(scene);
        
        //show first scene
        stage.show();
    }

    public static void main(String[] args){
        launch(args);
    }
        
}
