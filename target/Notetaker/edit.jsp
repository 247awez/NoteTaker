<%-- 
    Document   : edit
    Created on : 18-Jan-2022, 12:37:32 pm
    Author     : awezp
--%>

<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Edit note page</title>
                <%@include file="js_css.jsp"%>

    </head>
    <body>
                <div class="container">
		<%@include file="navbar.jsp"%>
                <br></div>
                <%
int noteId= Integer.parseInt(request.getParameter("note_id").trim());
Session s = FactoryProvider.getFactory().openSession();
Transaction t =s.beginTransaction();
Note note = s.get(Note.class, noteId);

                    
                    %>
                    <div class="container">
                    <form action="UpdateServlet" method="post">
                        <input value="<%=note.getId()%>" name="note_id" type="hidden">
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Title</label>
                                <input
                                    name="title"
					required type="text" 
                                        class="form-control"
                                        id="title"
                                        value="<%=note.getTitle()%>"
                                        >
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Content</label>
				<textarea
                                    name="content"
                                    required type="text" id="content"
					class="form-control"
                                        style="min-height: 300px"><%=note.getContent()%>
</textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn blue " style="width: 15rem">Add</button>
			</div>
		</form>
</div>
                    </body>
</html>
