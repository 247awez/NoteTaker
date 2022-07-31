/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlets;

import com.entities.Note;
import com.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
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
public class DeleteServlet extends HttpServlet {
private static final long serialVersionUID =1L;
public DeleteServlet(){}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    try{
    
    int noteId=Integer.parseInt(request.getParameter("note_id").trim());
    Session s =FactoryProvider.getFactory().openSession();
    Transaction t =s.beginTransaction();
    Note note = s.get(Note.class, noteId);
    s.delete(note);
    t.commit();
    s.close();
    response.sendRedirect("all_notes.jsp");
    }catch(Exception e){System.out.println("error");}
    }

}
