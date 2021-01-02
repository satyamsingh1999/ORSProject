<%@page import="in.co.sunrays.proj4.controller.ForgetPasswordCtl"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<html>
<head>
<title>Forget Password</title>
<link rel="icon" type="image/png" href="<%=ORSView.APP_CONTEXT%>/img/logo.png" sizes="16x16"/>
</head>
<body>
	<form action="<%=ORSView.FORGET_PASSWORD_CTL%>" method="post">

		<%@ include file="Header.jsp"%>

		<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.UserBean"
			scope="request"></jsp:useBean>

		<div align="center">

			<h1 align="center" style="margin-bottom: -15; color: navy">Forgot
				your password?</h1>

			<div style="height: 15px; margin-bottom: 12px">
				<H3 align="center">
					<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
					</font>
				</H3>
				<H3 align="center">
					<font color="red"> <%=ServletUtility.getErrorMessage(request)%>
					</font>
				</H3>
			</div>
			<input type="hidden" name="id" value="<%=bean.getId()%>">
			<h3 style="margin-bottom: -10;">
				<label>Submit your email address and we'll send you
					password.</label>
			</h3>
			<table>
				<tr>
					<th align="left">Email Id<span style="color: red">*</span>&nbsp;
					</th>&emsp;
					<td align="center"><input type="text" name="login"
						placeholder="Enter Email ID Here"
						value="<%=ServletUtility.getParameter("login", request)%>">&nbsp;</td>

					<td align="center"><input type="submit" name="operation"
						value="<%=ForgetPasswordCtl.OP_GO%>"></td>
					<td style="position: fixed;"><font color="red"> <%=ServletUtility.getErrorMessage("login", request)%></font></td>

				</tr>

			</table>

		</div>
	</form>

	<%@ include file="Footer.jsp"%>
</body>
</html>