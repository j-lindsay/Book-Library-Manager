package application;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;

public class RegistrationController {
	@FXML
	private TextField usernameTxt;
	
	@FXML
	private TextField passwordTxt;
	
	@FXML
	private TextField passwordTxtConf;
		
	@FXML
	private Button registrationButton;
	
	@FXML
	private Label registrationStatus;
	
	public void register(ActionEvent event) {
		String url = "jdbc:mysql://localhost:3306/full_lib";
		String username = "myuser";
		String password = "Cowtipper_21_42";
		String sql = "CALL addUser(\"" + usernameTxt.getText() + "\", \"" + passwordTxt.getText() + "\");";
		
		
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try {
			//Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
			pst = con.prepareCall(sql);
			rs = pst.executeQuery();
			
			if (rs.next()) {
				registrationStatus.setText("Login Successful");
			} else {
				registrationStatus.setText("Login Failed");
			}	
		} catch (Exception e) {
			e.printStackTrace();
		
		}
	}
}