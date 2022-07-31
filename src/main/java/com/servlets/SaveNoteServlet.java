package com.servlets;
import com.entities.Note;
import java.io.IOException;
import com.helper.FactoryProvider;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
    public SaveNoteServlet() {
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            
        try{
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            
            Note n1 = new Note(title,content,new Date());
            Session s = FactoryProvider.getFactory().openSession(); 
            Transaction t = s.beginTransaction();
            s.save(n1);
            t.commit();
            s.close();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h2>Successfully created your note!!</br></h2>");
            out.println("<h2><a href='http://localhost:8080/Notetaker/all_notes.jsp'>View all notes</a></h2>");
        }catch(Exception e){System.out.println(e);
        }
        }

}
