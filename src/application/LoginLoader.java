package application;
	
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.stage.Stage;
import javafx.scene.Parent;
import javafx.scene.Scene;

public class LoginLoader extends Application {
	
	@Override
	public void start(Stage primaryStage) throws Exception {		
		Parent root = FXMLLoader.load(getClass().getResource("Login.fxml"));
		Scene loginScene = new Scene(root);
		loginScene.getStylesheets().add(getClass().getResource("application.css").toExternalForm());
		
		primaryStage.setTitle("Login page");
		
		primaryStage.setScene(loginScene);
		primaryStage.show();
	}
	
	public static void main(String[] args) {
		launch(args);
	}
}
