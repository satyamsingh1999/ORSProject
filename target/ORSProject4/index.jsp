<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj4.bean.UserBean"%>
<%@page import="in.co.sunrays.proj4.controller.ORSView"%>
<html>
<head>
<title>Online Result System</title>
<link rel="icon" type="image/png"
	href="<%=ORSView.APP_CONTEXT%>/img/logo.png" sizes="16x16" />
</head>
<body>
	<br>
	<br>
	<%
		UserBean userBean = (UserBean) session.getAttribute("user");

		boolean userLoggedIn = userBean != null;

		if (userLoggedIn) {
			ServletUtility.forward(ORSView.WELCOME_VIEW, request, response);
		}
	%>
	
		<div align="center">
			<img src="img/customLogo.jpg" align="middle" width="318" height="127"
				border="0">
		</div>

	<br>

	<h1 align="center" >
		<font size="10px" color="red" > <a 
			href="<%=ORSView.WELCOME_CTL%>" >Online Result System</a></font>
	</h1>

</body>
</html>