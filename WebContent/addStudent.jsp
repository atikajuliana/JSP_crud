<%@page import="comm.dao.StudentDAO" %>
<jsp:useBean id="u" class="comm.bean.Student"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
int i = StudentDAO.save(u);
if (i>0) {
	response.sendRedirect("addstudent-success.jsp");
} else {
	response.sendRedirect("addstudent-error.jsp");
}
%>