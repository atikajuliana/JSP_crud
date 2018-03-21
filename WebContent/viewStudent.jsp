<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Student</title>
</head>
<body>
	<%@page import="comm.dao.StudentDAO, comm.bean.*, java.util.*" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	<h1>Student List</h1>
	
	<%
		List<Student> list = StudentDAO.getAllStudent();
		request.setAttribute("list", list);
	%>
	
	<table border="1" width="90%">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Password</th>
			<th>Email</th>
			<th>Gender</th>
			<th>Country</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<c:forEach items="${list}" var="s">
		<tr>
			<td>${s.getId()}</td>
			<td>${s.getName()}</td>
			<td>${s.getPassword()}</td>
			<td>${s.getEmail()}</td>
			<td>${s.getGender()}</td>
			<td>${s.getCountry()}</td>
			<td><a href="editForm.jsp?id=${s.getId()}">Edit</a>
			<td><a href="deleteStudent.jsp?id=${s.getId()}">Delete</a>
		</tr>
		</c:forEach>
	</table>
	
	<br/><a href="addStudentForm.jsp">Add New Student</a>  
</body>
</html>