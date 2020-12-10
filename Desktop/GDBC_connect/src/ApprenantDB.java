import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;

public class ApprenantDB {
	
	private String url;
	private String user;
	private String pwd;
	Connection con;
	List<Apprenant> apprenant; 
	
	public ApprenantDB() {
		
		this.url = "jdbc:mysql://localhost:3306/apprenant";
		this.user = "root";
		this.pwd = "";
		apprenant = new ArrayList<>();
		
		
	}
	public void getApprenant(){
		
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			con = DriverManager.getConnection(url,user,pwd);  
			java.sql.Statement statement = con.createStatement();
		    ResultSet rs = statement.executeQuery("select * from apprenant_youcode");
	        while (rs.next()) {
	            String name = rs.getString("name");
	            String description = rs.getString("description");
	            String CNI = rs.getString("CNI");
	            int id  = rs.getInt("id");
	            apprenant.add(new Apprenant(name, description, CNI,id));
	        }
	        con.close();
			//here sonoo is database name, root is username and password      
			}catch(Exception e){ 
				
				System.out.println(e);
				
			} 	
		
	}
	
	
	public void AddApprenant(String name,String desc,String cni){
		
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			con = DriverManager.getConnection(url,user,pwd);  
			java.sql.Statement statement = con.createStatement();
			String query="INSERT INTO apprenant_youcode(name,Description,CNI)";
			query += "VALUES (?,?,?)";
			java.sql.PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1,name);
			ps.setString(2, desc);
			ps.setString(3,cni);
			int row = ps.executeUpdate();
		    apprenant.clear();
		    getApprenant();
	        con.close();      
			}catch(Exception e){ 
				
				System.out.println(e);
				
			} 	
		
	}
	
	
	public void UpdateApprenant(String name,String Desc,String cni,int id){
		
		try{  
			
			//update 
					Class.forName("com.mysql.jdbc.Driver");  
					con = DriverManager.getConnection(url,user,pwd);  
					java.sql.Statement statement = con.createStatement();
					String chaine = "UPDATE apprenant_youcode SET name =  '" + name + "', Description = '" + Desc + "',CNI = '" + cni +  "' WHERE id = " + id;
					System.out.println(chaine);
				    int  rs = statement.executeUpdate(chaine);
				    apprenant.clear();
				    getApprenant();
				    con.close();
			        System.out.println("Update bien effectuer");
			           
		}catch(Exception e){ 
		
				System.out.println(e);
				
		} 	
		
	}
	
	public void Delete(int id){
		
		String deletequery = "DELETE FROM apprenant_youcode where id = " + id ;  
		try {
			Class.forName("com.mysql.jdbc.Driver");  
			con = DriverManager.getConnection(url,user,pwd);  
			java.sql.Statement statement = con.createStatement();
		    int  rs = statement.executeUpdate(deletequery);  
		    apprenant.clear();
		    getApprenant();
		    System.out.println("Row Deleted Successfully");
		}catch(Exception e) {
			
			System.out.println(e.getMessage());
			
		}
		
		
		
		
	}
	
	

	public void Affichage(){
		// TODO Auto-generated method stub
		apprenant.clear();
	    getApprenant();
		for(int i=0;i<apprenant.size();i++) {
			
			
			System.out.println(" name : " + apprenant.get(i).name + " Description : " + apprenant.get(i).Description + " cni :  " + apprenant.get(i).CIN + " id :  " + apprenant.get(i).id);
			
		}
	}
	

	
	
	
	

}
