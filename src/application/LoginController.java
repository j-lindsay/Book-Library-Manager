package application;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.*;

public class LoginController {
	@FXML
	private TextField usernameTxt;
	
	@FXML
	private TextField passwordTxt;
	
	@FXML
	private Button loginButton;
	
	@FXML
	private Button registerButton;
	
	@FXML
	private Label loginStatus;
	
	
	@FXML
	private TextField passwordTxtConf;
	
	@FXML
	private Button registerEnrollmentButton;
	
	@FXML
	private Label registrationStatus;
	
	@FXML
	private Button backToLogin;
	
	public void login(ActionEvent event) {
		String url = "jdbc:mysql://localhost:3306/full_lib";
		String username = "myuser";
		String password = "example";
		String sql = "SELECT * FROM authenticated_users WHERE BINARY userText = \"" + usernameTxt.getText() + "\" AND passText = \"" + passwordTxt.getText() + "\";";
		
		
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			//Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
			st = con.createStatement();
			rs = st.executeQuery(sql);
			
			if (rs.next()) {
				loginStatus.setText("Login Successful");
				loginToLibrary(event);
			} else {
				loginStatus.setText("Login Failed");
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
 	}
	
	public void register(ActionEvent event) {
		String url = "jdbc:mysql://localhost:3306/full_lib";
		String username = "myuser";
		String password = "example";
		String sql = "CALL addUser(\"" + usernameTxt.getText() + "\", \"" + passwordTxt.getText() + "\");";
		
		Connection con = null;
		PreparedStatement pst = null;
		boolean hadResults;
		
		try {
			//Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
			pst = con.prepareCall(sql);
			hadResults = pst.execute();
			
			while(hadResults) {
				ResultSet rs = pst.getResultSet();
			}
		} catch (Exception e) {
			e.printStackTrace();
			registrationStatus.setText("Registration Failed");
		}
	}
	
	public void loginToLibrary(ActionEvent event) throws IOException {
		Parent libraryRoot = FXMLLoader.load(getClass().getResource("db.fxml"));
		Scene libraryScene = new Scene(libraryRoot);
		Stage window = (Stage)((Node)event.getSource()).getScene().getWindow();
		libraryScene.getStylesheets().add(getClass().getResource("application.css").toExternalForm());
		
		window.setScene(libraryScene);
		window.show();
	}
	
	public void changeToRegistration(ActionEvent event) throws IOException {
		Parent registerEnrollmentRoot = FXMLLoader.load(getClass().getResource("Registration.fxml"));
		Scene registerEnrollmentScene = new Scene(registerEnrollmentRoot);
		Stage window = (Stage)((Node)event.getSource()).getScene().getWindow();
		registerEnrollmentScene.getStylesheets().add(getClass().getResource("application.css").toExternalForm());
		
		window.setScene(registerEnrollmentScene);
		window.show();
	}
	
	public void back(ActionEvent event) throws IOException {
		Parent loginRoot = FXMLLoader.load(getClass().getResource("Login.fxml"));
		Scene loginScene = new Scene(loginRoot);
		Stage window = (Stage)((Node)event.getSource()).getScene().getWindow();
		loginScene.getStylesheets().add(getClass().getResource("application.css").toExternalForm());
		
		window.setScene(loginScene);
		window.show();
	}
}
