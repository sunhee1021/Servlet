<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/common/bootstrap.jsp"></jsp:include>

<div class="container-fluid bg-danger">
  <nav class="navbar navbar-inverse">
    <div class="container-fluid bg-danger" >
      <ul class="nav navbar-nav bg-danger">
        <li><a id="len1" class="hoverable" href="Ex02_JDBC_Main.jsp">Home</a></li>
        <li><a id="len2" class="hoverable" href="Ex02_JDBC_Login.jsp">Login</a></li>
        <li><a id="len3" class="hoverable" href="Ex02_JDBC_JoinForm.jsp">Register</a></li>
        <li><a id="len4" class="hoverable" href="Ex02_JDBC_Main.jsp">Contents</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
						<c:set var="userid" value="${sessionScope.userid }" />
						<c:choose>
							<c:when test="${userid} != null">
								<b><%=session.getAttribute("userid") %></b>
								<li><a href='Ex02_JDBC_Logout.jsp'>[ 로그아웃 ]</a></li>
							</c:when>
							<c:otherwise>
								<li><b>로그인 하지 않으셨네요</b></li>
								<li><a href='Ex02_JDBC_Login.jsp' >[ 로그인 ]</a></li>
							</c:otherwise>	
						</c:choose>
					</ul>
    </div>
  </nav>
</div>
