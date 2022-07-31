/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlets;

import com.entities.Note;
import com.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author awezp
 */
public class UpdateServlet extends HttpServlet {

   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
 String title = request.getParameter("title");
 String content = request.getParameter("content");
 int noteId= Integer.parseInt(request.getParameter("note_id").trim());
        Session s = FactoryProvider.getFactory().openSession();
        Transaction t =s.beginTransaction();
        Note note = s.get(Note.class, noteId);
        note.setContent(content);
        note.setTitle(title);
        note.setAddedDate(new Date());
        
        
        t.commit();
        s.close();
            response.setContentType("text/html");
        
                    PrintWriter out = response.getWriter();

        out.println("Your note updated successfully!");
        out.println("<a href='http://localhost:8080/Notetaker/index.jsp'>return to home page</a>");
                    out.println("<h2><a href='http://localhost:8080/Notetaker/all_notes.jsp'>View all notes</a></h2>");

    }catch(Exception e){System.out.println("com.servlets.UpdateServlet.doPost()");}
    }

}
