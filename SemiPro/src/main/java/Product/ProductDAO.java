package Product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

public class ProductDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	
	
	private static  String dbURL = "";
	private static  String dbID = "";
	private static  String dbPassword = "";
	private static  String driver = "";
	
	
	public ProductDAO() {
		
		driver = "com.mysql.jdbc.Driver";
		dbURL = "jdbc:mysql://localhost:3306/shop?serverTimezone=UTC&useSSL=false";
		dbID = "root";
		dbPassword = "campus";
	}
	
	public List<ProductVO> listProducts(String id) {

		List<ProductVO>  productsList = new ArrayList();
		
		try {
				try {
						connDB();	
				} catch (Exception e) {
					e.printStackTrace();
				}
			String query = "select * from product where productor_id = '" + id + "'";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				String name = rs.getString("name");
				String Kind = rs.getString("kind");
				String Many = rs.getString("many");
				String date = rs.getString("date");
				
				ProductVO productVO = new ProductVO(name, Kind, Many, id, date);
				
				productsList.add(productVO);
				
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return productsList;
	}

	public void addProduct(ProductVO p) {
		try {
			
			try {
					connDB();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			String name = p.getName();
			String kind = p.getKind();
			String many = p.getMany();
			String id = p.getId();
			String img = p.getImg();
			String date = p.getDate();
			//Date date = p.getDate();
			String sql = 
					"INSERT INTO product(name, kind, many, productor_id, img, date)" 
					+ "VALUES(?,?,?,?,?,?)";
						
			PreparedStatement pstmt = conn.prepareStatement(sql);
						
			pstmt.setString(1, name);
			pstmt.setString(2, kind);
			pstmt.setString(3, many);
			pstmt.setString(4, id);
			pstmt.setString(5, img);
			pstmt.setString(6, date);
			//pstmt.setDate(6, date);
						
					
			pstmt.executeUpdate();	
					
			pstmt.close();
						
			conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<ProductVO> showProducts(String str) { //Result.jsp에 상품 종류별로 나누기 위함
		List<ProductVO> productList = new ArrayList<ProductVO>();
		try {
			try {
				connDB();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			String kind = str;
			String sql = "select product.name,many,img,productor_id,company,date from product,productor where product.productor_id=productor.id and kind='"+str+"'";
			//종류별 상품정보를 가져오는 쿼리문
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String name = rs.getString("name");
				String many= rs.getString("many");
				String company= rs.getString("company");
				String img = rs.getString("img");
				String date = rs.getString("date");
				String id = rs.getString("productor_id");
					
				ProductVO productVO = new ProductVO(img,name,kind,many,id,company,date);
				//ProductVO 생성자를 호출하여 각 상품별로 상품정보가 담긴 productVO 객체 생성
				productList.add(productVO);
				//리턴할 결과값인 productList에 productVO의 정보들을 add 
					
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return productList;
	}
	
	public List<ProductVO> showAll(){ //Main.jsp를 위한 함수
		List<ProductVO> allList = new ArrayList<ProductVO>();
		try {
			try {
				connDB();
			}catch(Exception e) {
				e.printStackTrace();
			}

			String sql = "select img, name from product order by many";
			//모든 제품의 이미지, 제품명 정보를 수량에 맞게 오름차순으로 정렬하여 값을 가져오는 쿼리문
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String name = rs.getString("name");
				String img = rs.getString("img");
					
				ProductVO productVO = new ProductVO(img,name);
				//ProductVO 생성자를 호출하여 각 상품별로 상품정보가 담긴 productVO 객체 생성
				allList.add(productVO);
				//리턴할 결과값인 allList에 productVO의 정보들을 add 
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return allList;
	}
	

	private void connDB() {

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
			System.out.println("Connection 생성 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}



}