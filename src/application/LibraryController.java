package application;

import java.net.URL;
import java.sql.*;
import java.util.ResourceBundle;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;

public class LibraryController implements Initializable {
	@FXML
	private TableView<LibTable> table;
	
	@FXML
	private TableColumn<LibTable, String> col_id;
	
	@FXML
	private TableColumn<LibTable, String> col_addDate;
	
	@FXML
	private TableColumn<LibTable, String> col_libLoc;
	
	@FXML
	private TableColumn<LibTable, String> col_isbn;
	
	@FXML
	private TableColumn<LibTable, String> col_title;
	
	@FXML
	private TableColumn<LibTable, String> col_edition;
	
	@FXML
	private TableColumn<LibTable, String> col_author;
	
	@FXML
	private TableColumn<LibTable, String> col_genre;
	
	@FXML
	private TableColumn<LibTable, String> col_loanStatus;
	
	ObservableList<LibTable> oblist = FXCollections.observableArrayList();

	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		String url = "jdbc:mysql://localhost:3306/full_lib";
		String username = "myuser";
		String password = "example";
		
		try {
			Connection con = DriverManager.getConnection(url, username, password);
			ResultSet rs = con.createStatement().executeQuery("SELECT * FROM books;");
			
			while(rs.next()) {
				oblist.add(new LibTable(rs.getString("id"), rs.getString("addDate"), rs.getString("lib_loc"), rs.getString("isbn"), 
										rs.getString("title"), rs.getString("edition"), rs.getString("author"), rs.getString("genre"), rs.getString("loanStatus")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		col_id.setCellValueFactory(new PropertyValueFactory<>("id"));
		col_addDate.setCellValueFactory(new PropertyValueFactory<>("addDate"));
		col_libLoc.setCellValueFactory(new PropertyValueFactory<>("lib_loc"));
		col_isbn.setCellValueFactory(new PropertyValueFactory<>("isbn"));
		col_title.setCellValueFactory(new PropertyValueFactory<>("title"));
		col_edition.setCellValueFactory(new PropertyValueFactory<>("edition"));
		col_author.setCellValueFactory(new PropertyValueFactory<>("author"));
		col_genre.setCellValueFactory(new PropertyValueFactory<>("genre"));
		col_loanStatus.setCellValueFactory(new PropertyValueFactory<>("loanStatus"));
		
		table.setItems(oblist);
	}
}
