package comm.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import comm.bean.Student;

public class StudentDAO {
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "admin", "123456");	
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public static int save(Student student) {
		int status =  0;
		
		try {
			Connection conn = getConnection();
			String sql = "insert into student(name, password, email, gender, country) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, student.getName());
			ps.setString(2, student.getPassword());
			ps.setString(3, student.getEmail());
			ps.setString(4, student.getGender());
			ps.setString(5, student.getCountry());
			
			status = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return status;
	}
	
	public static int update(Student student) {
		int status =  0;
		
		try {
			Connection conn = getConnection();
			String sql = "update student set name=?, password=?, email=?, gender=?, country=? WHERE id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, student.getName());
			ps.setString(2, student.getPassword());
			ps.setString(3, student.getEmail());
			ps.setString(4, student.getGender());
			ps.setString(5, student.getCountry());
			ps.setInt(6, student.getId());
			
			status = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return status;
	}
	
	public static int delete(Student student) {
		int status = 0;
		
		try {
			Connection conn = getConnection();
			String sql = "delete from student WHERE id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, student.getId());
			
			status = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return status;
	}
	
	
	public static List<Student> getAllStudent() {
		List<Student> list = new ArrayList<Student>();
		
		try {
			Connection conn = getConnection();
			String sql = "select * from student";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Student student = new Student();
				student.setId(rs.getInt("id"));
				student.setName(rs.getString("name"));
				student.setPassword(rs.getString("password"));
				student.setEmail(rs.getString("email"));
				student.setGender(rs.getString("gender"));
				student.setCountry(rs.getString("country"));
				
				list.add(student);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	public static Student getStudentById(int id) {
		Student student = null;
		
		try {
			Connection conn = getConnection();
			String sql = "select * from student where id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				student = new Student();
				student.setId(rs.getInt("id"));
				student.setName(rs.getString("name"));
				student.setPassword(rs.getString("password"));
				student.setEmail(rs.getString("email"));
				student.setGender(rs.getString("gender"));
				student.setCountry(rs.getString("country"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return student;
	} 
}
