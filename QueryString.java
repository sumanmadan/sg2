
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/QueryString")
public class QueryString extends HttpServlet {
	 private static final int BUFSIZE = 4096;
  public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException,
      IOException {
    res.setContentType("text/plain");
   // PrintWriter out = res.getWriter();

    System.out.println("Query String:");
    System.out.println(req.getQueryString());
    System.out.println();

    System.out.println("Request Parameters:");
    String stp = "";
    Enumeration e = req.getParameterNames();
    while (e.hasMoreElements()) {
      String name = (String) e.nextElement();
      String values[] = req.getParameterValues(name);
      if (values != null) {
        for (int i = 0; i < values.length; i++) {
          System.out.println(name + " (" + i + "): " + values[i]);
          stp = values[i].toString();
        }
      }
    }
    
    //out.close();
   // String[] fff =stp.split("//");
    String filePath = stp;
   // String filePath  = fff[0].toString();
    
    File file = new File(filePath);
    
    
    
    
    int length   = 0;
    ServletOutputStream outStream = res.getOutputStream();
    ServletContext context  = getServletConfig().getServletContext();
    String mimetype = context.getMimeType(filePath);
    System.out.println("hhhh   " + req.getQueryString());
    // sets response content type
    if (mimetype == null) {
        mimetype = "application/octet-stream";
    }
    res.setContentType(mimetype);
    res.setContentLength((int)file.length());
    String fileName = (new File(filePath)).getName();
    
    // sets HTTP header
    res.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
    
    byte[] byteBuffer = new byte[BUFSIZE];
    DataInputStream in = new DataInputStream(new FileInputStream(file));
    
    // reads the file's bytes and writes them to the response stream
    while ((in != null) && ((length = in.read(byteBuffer)) != -1))
    {
        outStream.write(byteBuffer,0,length);
    }
    
    in.close();
    outStream.close();
    

    
    
    
  }
}