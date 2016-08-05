<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="java.io.File"%>
<%@page import="java.io.PrintStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("filename");
    String filename = this.getServletContext().getRealPath("/") + "Lessons" + File.separator + name;
    File file = new File(filename);
    StringBuffer buffer = new StringBuffer();
    if(!file.exists()){
        buffer.append("{\"code\": 1, \"dsc\":\"文件不存在\"}");
    }else{
        Scanner scan = new Scanner(file, "UTF-8");
        scan.useDelimiter("\n");
        StringBuffer jsonBuffer = new StringBuffer();
        while(scan.hasNext()){
            jsonBuffer.append(scan.next());
        }
        buffer.append(jsonBuffer.toString().trim()
            .replaceAll("\r","")
            .replaceAll("\n","")
            .replaceAll("\t",""));
        scan.close();
    }
%>
<%=buffer %>