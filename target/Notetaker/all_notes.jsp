<%-- 
    Document   : all_notes
    Created on : 16-Jan-2022, 5:49:11 pm
    Author     : awezp
--%>

<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>All notes</title>
        <%@include file="js_css.jsp"%>

    </head>
    <body>
        <div class="container">
		<%@include file="navbar.jsp"%>
                <br>
                <h1>All notes</h1>
                <%
                    Session s = FactoryProvider.getFactory().openSession();
               Query q =  s.createQuery("from Note");
                List<Note> list = q.list();
                for(Note note:list){ %>
                <div class="card m-3"  style="width:100hw; border:2px solid #855555;
    border-radius: 5px;">
                    <img class="card-img-top mx-auto" src="notes-icon-design-vector.webp" style="max-width: 200px" alt="Card image cap">

  <div class="card-body ">

    <h3 class="card-title">Title:  <%out.println(note.getTitle());%></h3>
    <p class="card-text">Content: <% out.println(note.getContent());%></p>
    <div class="container text-center">
    <a href="DeleteServlet?note_id=<%=note.getId()%>" class="btn btn-danger">delete</a>
    <a href="edit.jsp?note_id=<%=note.getId()%>" class="btn blue" >update</a>

    </div></div>
</div>
                <%
            }
               %>
        </div>
    </body>
</html>
