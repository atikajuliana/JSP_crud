<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Student</title>
</head>
<body>
	<%@page import="comm.dao.StudentDAO, comm.bean.Student"%>

	<%
		String id = request.getParameter("id");
		Student s = StudentDAO.getStudentById(Integer.parseInt(id));
		
	%>

	<h1>Edit Student</h1>
	<form action="editStudent.jsp" method="post">
		<input type="hidden" name="id" value="<%=s.getId()%>" />
		<table>
			<tr>
				<td>Name:</td>
				<td><input type="text" name="name" value="<%=s.getName()%>" /></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password"
					value="<%=s.getPassword()%>" /></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><input type="email" name="email" value="<%=s.getEmail()%>" /></td>
			</tr>
			<tr>
				<td>Sex:</td>
				<td><input type="radio" name="gender" value="male" <%=s.getGender().equals("male") ? "checked=\"checked\"": ""%> />Male <input
					type="radio" name="gender" value="female" <%=s.getGender().equals("female") ? "checked=\"checked\"": ""%>/>Female</td>
			</tr>
			<tr>
				<td>Country:</td>
				<td>
					<select name="country">
						<option value="India" <%=s.getCountry().equals("India") ? "selected=\"selected\"": ""%> >India</option>
						<option value="Indonesia" <%=s.getCountry().equals("Indonesia") ? "selected=\"selected\"": ""%>>Indonesia</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Edit Student" /></td>
			</tr>
		</table>
	</form>
</body>
</html>