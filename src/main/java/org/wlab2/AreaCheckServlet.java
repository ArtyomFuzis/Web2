package org.wlab2;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class AreaCheckServlet extends HttpServlet {
    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        var data = (ArrayList<Data>)session.getAttribute("data");
        if(data == null) data = new ArrayList<>();
        Double x = Double.parseDouble(request.getParameter("x"));
        Double y = Double.parseDouble(request.getParameter("y"));
        Double r = Double.parseDouble(request.getParameter("r"));
        data.add(new Data(x,y,r,check(x,y,r)));
        session.setAttribute("data", data);
        out.println(Data.save(data));
    }
    private Boolean check(Double x, Double y, Double r)
    {
        if(x >= 0 && y >= 0 )
        {
            return x*x+y*y <=(r/2)*(r/2);
        }
        else if(x <=0 && y <= 0)
        {
            return (x >= -r) && (y >= -r/2);
        }
        else if(x <=0 && y >= 0)
        {
            return y<=x+r;
        }
        return false;
    }
}

