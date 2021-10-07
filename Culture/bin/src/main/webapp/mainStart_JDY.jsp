<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String url = request.getContextPath()+"/totalBoardList.bd";
	//String url = request.getContextPath()+"/noticeBoardList.bd"; - 공지만 보기할때.
	response.sendRedirect(url);	
%>