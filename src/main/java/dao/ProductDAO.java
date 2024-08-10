package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.ProductDTO;
import model.JDBCUtil;

public class ProductDAO {
	private final static String INSERT = "INSERT INTO PRODUCT(NUM, NAME, DETAILS, PRICE, CNT, SELLER) VALUES((SELECT NVL(MAX(NUM)+1,0) FROM PRODUCT), ?, ?, ?, ?, ?)";
	private final static String UPDATE_BUY = "UPDATE PRODUCT SET CNT = CNT-? WHERE NUM = ?";
	private final static String DELETE = "DELET FROM PRODUCT WHERE NUM = ?";
	private final static String SELECTONE = "SELECT NUM, NAME, DETAILS, PRICE, CNT, SELLER FROM PRODUCT WHERE NUM = ?";
	private final static String SELECTALL_ALL = "SELECT NUM, NAME, DETAILS, PRICE, CNT, SELLER FROM PRODUCT ORDER BY NUM";
	private final static String SELECTALL_NAME = "SELECT NUM, NAME, DETAILS, PRICE, CNT, SELLER FROM PRODUCT WHERE NAME LIKE '%'|| ? ||'%'";
	private final static String SELECTALL_SELLER = "SELECT NUM, NAME, DETAILS, PRICE, CNT, SELLER FROM PRODUCT WHERE SELLER LIKE '%'|| ? ||'%'";
	
	public boolean insert(ProductDTO productDTO) {
		System.out.println("insert start");
		
		Connection conn = JDBCUtil.connect();
		PreparedStatement pstmt = null;
		boolean flag = false;
		
		try {
			pstmt = conn.prepareStatement(INSERT);
			pstmt.setString(1, productDTO.getName());
			pstmt.setString(2, productDTO.getDetails());
			pstmt.setInt(3, productDTO.getPrice());
			pstmt.setInt(4, productDTO.getCnt());
			pstmt.setString(5, productDTO.getSeller());
			int num = pstmt.executeUpdate();
			if(num >= 0) {				
				flag = true;
				System.out.println("insert success :"+num);
			}
		} catch (SQLException e) {
			System.err.println("insert SQL fail");
		} catch (Exception e) {
			System.err.println("insert exception fail");
		} finally {
			flag = JDBCUtil.disconnect(conn, pstmt);
			System.out.println("insert disconnect : "+flag);
		}
		System.out.println("insert end");
		return flag;
	}
	
	
	public boolean update(ProductDTO productDTO) {
		System.out.println("update start");
		
		Connection conn = JDBCUtil.connect();
		PreparedStatement pstmt = null;
		boolean flag = false;
		
		try {
			pstmt = conn.prepareStatement(UPDATE_BUY);
			pstmt.setInt(1, productDTO.getNum());
			int num = pstmt.executeUpdate();
			if(num >= 0) {				
				flag = true;
				System.out.println("update success :"+num);
			}
		} catch (SQLException e) {
			System.err.println("update SQL fail");
		} catch (Exception e) {
			System.err.println("update exception fail");
		} finally {
			flag = JDBCUtil.disconnect(conn, pstmt);
			System.out.println("update disconnect : "+flag);
		}
		System.out.println("update end");
		return flag;
	}
	
	
	public boolean delete(ProductDTO productDTO) {
		System.out.println("delete start");
		
		Connection conn = JDBCUtil.connect();
		PreparedStatement pstmt = null;
		boolean flag = false;
		
		try {
			pstmt = conn.prepareStatement(DELETE);
			pstmt.setInt(1, productDTO.getNum());
			int num = pstmt.executeUpdate();
			if(num >= 0) {				
				flag = true;
				System.out.println("delete success :"+num);
			}
		} catch (SQLException e) {
			System.err.println("delete SQL fail");
		} catch (Exception e) {
			System.err.println("delete exception fail");
		} finally {
			flag = JDBCUtil.disconnect(conn, pstmt);
			System.out.println("delete disconnect : "+flag);
		}
		System.out.println("delete end");
		return flag;
	}
	
	
	public ArrayList<ProductDTO> selectAll(ProductDTO productDTO){
		System.out.println("selectAll start");
		
		Connection conn = JDBCUtil.connect();
		PreparedStatement pstmt = null;
		ResultSet result;
		ArrayList<ProductDTO> datas = new ArrayList<>();
		ProductDTO data;
		
		try {	
			if(productDTO.getCondition().equals("ALL")) {				
				System.out.println("selectAll ALL start");
				pstmt = conn.prepareStatement(SELECTALL_ALL);
			}
			else if(productDTO.getCondition().equals("SEARCH_NAME")) {
				System.out.println("selectAll SEARCH_NAME start");
				pstmt = conn.prepareStatement(SELECTALL_NAME);
				pstmt.setString(1, productDTO.getName());
			}
			else if(productDTO.getCondition().equals("SEARCH_SELLER")) {
				System.out.println("selectAll SEARCH_SELLER start");
				pstmt = conn.prepareStatement(SELECTALL_SELLER);
				pstmt.setString(1, productDTO.getSeller());
			}
			else {				
				System.err.println("selectAll condition error");
				return datas;
			}
			result = pstmt.executeQuery();
			
			System.out.println("selectAll result");
			while(result.next()){
				data = new ProductDTO();
				data.setNum(result.getInt("NUM"));
				data.setName(result.getString("NAME"));
				data.setDetails(result.getString("DETAILS"));
				data.setPrice(result.getInt("PRICE"));
				data.setCnt(result.getInt("CNT"));
				data.setSeller(result.getString("SELLER"));
				datas.add(data);
				System.out.print("selectAll "+data.getNum()+" ||");
			}
			System.out.println("\nselectAll success");
		} catch (SQLException e) {
			System.err.println("selectAll SQL fail");
			datas.clear();
		} catch (Exception e) {
			System.err.println("selectAll exception fail");
			datas.clear();
		} finally {
			if(!JDBCUtil.disconnect(conn, pstmt)) {
				System.err.println("selectAll disconnect fail");
				datas.clear();
			}
		}
		System.out.println("selectAll end");
		return datas;
	}
	
	
	public ProductDTO selectOne(ProductDTO productDTO){
		System.out.println("selectOne start");
		
		Connection conn = JDBCUtil.connect();
		PreparedStatement pstmt = null;
		ProductDTO data = null;
		
		try {
			pstmt = conn.prepareStatement(SELECTONE);
			pstmt.setInt(1, productDTO.getNum());
			ResultSet result = pstmt.executeQuery();
			
			if(result.next()) {				
				data = new ProductDTO();
				data.setNum(result.getInt("NUM"));
				data.setName(result.getString("NAME"));
				data.setDetails(result.getString("DETAILS"));
				data.setCnt(result.getInt("CNT"));
				data.setPrice(result.getInt("PRICE"));
				data.setSeller(result.getString("SELLER"));
			}
			System.out.println("selectOne success");
		} catch (SQLException e) {
			System.out.println("selectOne SQL fail");
			data = null;
		} catch (Exception e) {
			System.out.println("selectOne exception fail");
			data = null;
		} finally {
			if(!JDBCUtil.disconnect(conn, pstmt)) {
				System.out.println("selectOne disconnect fail");
				data = null;
			}
		}
		System.out.println("selectOne end");
		return data;
	}
}
