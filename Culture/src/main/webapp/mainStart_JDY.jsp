<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//String url = request.getContextPath()+"/totalBoardList.bd";
	//String url = request.getContextPath()+"/noticeBoardList.bd";
	//String url = request.getContextPath()+"/qnaBoardList.bd";
	//String url = request.getContextPath()+"/freeBoardList.bd";
	//String url = request.getContextPath()+"/clubBoardList.bd";
	String url = request.getContextPath()+"/clubBoardList.bd?uid=son";
	response.sendRedirect(url);
	
	
	
%>