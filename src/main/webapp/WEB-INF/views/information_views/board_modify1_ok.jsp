<%@page import="com.petopia.model.MemberTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	MemberTO userData = (MemberTO) session.getAttribute("loginMember");
	
%>
<!DOCTYPE html>
<html>
<head>
<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
<meta charset="UTF-8">
</head>
<body>
<script type="text/javascript">
<%
if( userData == null || !userData.getGrade_seq().equals("1") || request.getAttribute("flag") == null){
%>
Swal.fire('제한된 접근', '정상적인 경로를 이용해주세요', 'error').then(function(){history.back();});
<%
}else{
	int info_seq = Integer.parseInt(request.getParameter("info_seq"));
	int flag = (Integer)request.getAttribute("flag");
	int file_flag = (Integer)request.getAttribute("file_flag");
	
	if(file_flag != 0){
%>
Swal.fire('파일 업로드 실패', '', 'error').then(function(){history.back();});
<%
		if(flag != 0){
%>
Swal.fire('글쓰기 실패', '', 'error').then(function(){history.back();});
<%		}
	}else{
%>
Swal.fire('게시물을 수정했습니다', '', 'success').then(function(){location.href='information_view.do?info_seq=<%= info_seq %>';});
<%	}
}
%>
</script>

</body>
</html>