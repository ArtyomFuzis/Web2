package org.wlab2;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class ControllerServlet extends HttpServlet {
    public void doPost(HttpServletRequest request,
                      HttpServletResponse response)
            throws IOException, ServletException {
        if(request.getParameter("x") != null && request.getParameter("y") != null && request.getParameter("r") != null)
        {
            var disp = request.getRequestDispatcher("/request/areacheck");
            disp.forward(request,response);
        }
        else
        {
            HttpSession session = request.getSession();
            PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            var data = (ArrayList<Data>)session.getAttribute("data");
            if(data == null) data = new ArrayList<>();
            out.println(Data.save(data));
        }
    }
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws IOException, ServletException {
        var disp = request.getRequestDispatcher("home.jsp");
        disp.forward(request,response);
    }
}
