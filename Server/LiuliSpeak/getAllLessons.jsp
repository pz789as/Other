<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="java.io.File"%>
<%@page import="java.io.PrintStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%
    String path = request.getRealPath("/Lessons/");
    File file=new File(path);
    File[] files=file.listFiles();
    StringBuffer buffer = new StringBuffer();
    buffer.append("[");
    boolean isFirst = false;
    for(File f :files)
    {
      if (f.isFile()){
        if (!isFirst) {
          isFirst = true;
          buffer.append("{");
        }else{
          buffer.append(",{");
        }
        buffer.append("\"path\":\"/LiuliSpeak/Lessons/").append(f.getName()).append("\"");
        
        Scanner scan = new Scanner(f, "UTF-8");
        scan.useDelimiter("\n");
        StringBuffer jsonBuffer = new StringBuffer();
        while(scan.hasNext()){
            jsonBuffer.append(scan.next());
        }
        String fileData = jsonBuffer.toString().trim()
            .replaceAll("\r","")
            .replaceAll("\n","")
            .replaceAll("\t","");
        String subData = fileData.substring(1, fileData.indexOf("practices") - 2);

        buffer.append(",");
        buffer.append(subData);
        scan.close();

        buffer.append("}");
      }
    }
    buffer.append("]");
%>
<%=buffer %>