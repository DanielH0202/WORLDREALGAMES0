package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/DetalleTeatro"})
public class DetalleTeatro extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            int numero = Integer.parseInt(request.getParameter("num"));

            switch (numero) {
                case 1:
                    out.println("<p>Somos una empresa que busca salir adelante con esfuerzo y dedicacion<br/></p>");
                    break;
                case 2:
                    out.println("<p>La empresa surge en la d&eacute;cada de los 80´s, con la finalidad de desarrollar video juegos.<br/> fue fundada por juanito pantera y el tipo de los pastes</p>");
                    break;
                case 3:
                    out.println("<p><iframe  src=\"Claretta 2020.pdf\" width=\"770\" height=\"534\"></iframe><br/></p>");
                    break;
                case 4:
                   out.println("<p><iframe  src=\"Cata1og Mx.pdf\" width=\"770\" height=\"534\"></iframe><br/></p>");
                    break;
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}




