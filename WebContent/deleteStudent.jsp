<%@page import="comm.dao.StudentDAO"%>  
<jsp:useBean id="s" class="comm.bean.Student"></jsp:useBean>  
<jsp:setProperty property="*" name="s"/>  
<%  
	StudentDAO.delete(s);  
	response.sendRedirect("viewStudent.jsp");  
%>  