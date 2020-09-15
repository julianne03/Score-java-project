package Student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import user.User;

public class StudentDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public StudentDAO() {
		try {
			String dbURL="jdbc:mysql://localhost:3306/score";
			String dbID="root";
			String dbPassword="123456";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int select(int hakbun,String userPassword) {
		String SQL="select userPassword,userName,korean,math,social,science,english from students where hakbun=?";
		
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, hakbun);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).contentEquals(userPassword)) {
					return 1;
				}
				else {
					return 0;
				}
			}
			return -1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	public Student myScore(int hakbun) {
		String SQL="select hakbun,userName,korean,math,social,science,english from students where hakbun=?";
		Student student=null;
		
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, hakbun);
			rs=pstmt.executeQuery();

			if(rs.next()) {
				student=new Student();
				student.setHakbun(rs.getInt("hakbun"));
				student.setUserName(rs.getString("userName"));
				student.setKorean(rs.getInt("korean"));
				student.setMath(rs.getInt("math"));
				student.setSocial(rs.getInt("social"));
				student.setScience(rs.getInt("science"));
				student.setEnglish(rs.getInt("english"));
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return student;
	}
	public int insert(Student student) {
		String SQL="insert into students values (?,?,?,?,?,?,?,?)";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, student.getHakbun());
			pstmt.setString(2, student.getUserPassword());
			pstmt.setString(3, student.getUserName());
			pstmt.setInt(4, student.getKorean());
			pstmt.setInt(5, student.getMath());
			pstmt.setInt(6, student.getSocial());
			pstmt.setInt(7, student.getScience());
			pstmt.setInt(8, student.getEnglish());
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int update(Student student) {
		String SQL="update students set userPassword=?,userName=?,korean=?,math=?,social=?,science=?,english=? where hakbun=?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, student.getUserPassword());
			pstmt.setString(2, student.getUserName());
			pstmt.setInt(3, student.getKorean());
			pstmt.setInt(4, student.getMath());
			pstmt.setInt(5, student.getSocial());
			pstmt.setInt(6, student.getScience());
			pstmt.setInt(7, student.getEnglish());
			pstmt.setInt(8, student.getHakbun());
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
