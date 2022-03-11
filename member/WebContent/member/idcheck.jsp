<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO"%>
    
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#close1").click(function(){	// 중복 ID 버튼 클릭
			opener.$("id").val("").focus();
			window.close();
		});
	});
		$("#close2").click(function(){	// 사용가능한 ID 버튼 클릭
			opener.$("passwd").val("").focus();
			window.close();
		});
	});
</script>
    
<%
	String id = request.getParameter("id");
	
	MemberDAO dao = MemberDAO.getInstance();
	
	// ID 중복검사 메소드 호출
	int result = dao.memberAuth(id);
	
	if(result==1){	// 중복 ID : 1
%>   
		<%=id%>는 중복 ID 입니다.	<br><br><br>
		
		<input type="button" value="닫기" id="close1">
		
<% }else{ 	// 사용 가능한 ID : -1 %>

		<%=id%>는 사용 가능한 ID 입니다. <br><br><br>
		
		<input type="button" value="닫기" id="close2">
		
<% } %>