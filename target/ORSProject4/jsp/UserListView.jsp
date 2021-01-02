<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.model.RoleModel"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.bean.BaseBean"%>
<%@page import="in.co.sunrays.proj4.controller.UserListCtl"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<html>
<head>
<title>User List</title>
<link rel="icon" type="image/png"
	href="<%=ORSView.APP_CONTEXT%>/img/logo.png" sizes="16x16" />
<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=ORSView.APP_CONTEXT%>/js/CheckBox.js">
	
</script>
</head>
<body>

	<%@include file="Header.jsp"%>
	<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.UserBean"
		scope="request"></jsp:useBean>
	<div align="center">
		<h1 align="center" style="margin-bottom: -15; color: navy;">User
			List</h1>

		<div style="height: 15px; margin-bottom: 12px">
			<h3>
				<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
			</h3>
			<h3>
				<font color="green"><%=ServletUtility.getSuccessMessage(request)%></font>
			</h3>
		</div>
		<form action="<%=ORSView.USER_LIST_CTL%>" method="post">
			<%
				int pageNo = ServletUtility.getPageNo(request);
				int pageSize = ServletUtility.getPageSize(request);
				int index = ((pageNo - 1) * pageSize) + 1;
				int nextPageSize = DataUtility.getInt(request.getAttribute("nextListSize").toString());

				@SuppressWarnings("unchecked")
				List<RoleBean> roleList = (List<RoleBean>) request.getAttribute("roleList");

				@SuppressWarnings("unchecked")
				List<UserBean> list = (List<UserBean>) ServletUtility.getList(request);

				Iterator<UserBean> it = list.iterator();

				if (list.size() != 0) {
			%>

			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">

			<table style="width: 100%">
				<tr>
					<td align="center"><label><b>First Name :</b></label> <input
						type="text" name="firstName" placeholder="Enter First Name"
						value="<%=ServletUtility.getParameter("firstName", request)%>">
						&emsp; <label><b>Login Id:</b></label> <input type="text"
						name="login" placeholder="Enter Email ID"
						value="<%=ServletUtility.getParameter("login", request)%>">
						&emsp; <label><b>Role : </b></label><%=HTMLUtility.getList("roleId", String.valueOf(bean.getRoleId()), roleList)%>&emsp;
						<input type="submit" name="operation"
						value="<%=UserListCtl.OP_SEARCH%>">&nbsp; <input
						type="submit" name="operation" value="<%=UserListCtl.OP_RESET%>">
					</td>
				</tr>
			</table>
			<br>

			<table border="1" style="width: 100%; border: groove;">
				<tr style="background-color: #e1e6f1e3;">
					<th width="5%"><input type="checkbox" id="selectall" /></th>
					<th width="5%">S.No</th>
					<th width="13%">First Name</th>
					<th width="13%">Last Name</th>
					<th width="23%">Login Id</th>
					<th width="10%">Mobile No</th>
					<th width="8%">Gender</th>
					<th width="10%">Date of Birth</th>
					<th width="8%">Role</th>
					<th width="5%">Edit</th>
				</tr>

				<%
					while (it.hasNext()) {
							bean = (UserBean) it.next();
							RoleModel model = new RoleModel();
							RoleBean roleBean = new RoleBean();
							roleBean = model.findByPK(bean.getRoleId());
				%>
				<tr>
					<td style="text-align: center;"><input type="checkbox"
						class="case" name="ids" value="<%=bean.getId()%>"
						<%if (userBean.getId() == bean.getId() || bean.getRoleId() == RoleBean.ADMIN) {%>
						<%="disabled"%> <%}%>></td>
					<td style="text-align: center;"><%=index++%></td>
					<td style="text-align: center; text-transform: capitalize;"><%=bean.getFirstName()%></td>
					<td style="text-align: center; text-transform: capitalize;"><%=bean.getLastName()%></td>
					<td style="text-align: center; text-transform: lowercase;"><%=bean.getLogin()%></td>
					<td style="text-align: center;"><%=bean.getMobileNo()%></td>
					<td style="text-align: center; text-transform: capitalize;"><%=bean.getGender()%></td>
					<%
						SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
								String date = sdf.format(bean.getDob());
					%>
					<td style="text-align: center;"><%=date%></td>
					<td style="text-align: center; text-transform: capitalize;"><%=roleBean.getName()%></td>
					<td style="text-align: center;"><a
						href="UserCtl?id=<%=bean.getId()%>"
						<%if (userBean.getId() == bean.getId() || bean.getRoleId() == RoleBean.ADMIN) {%>
						onclick="return false;" <%}%>>Edit</a></td>

				</tr>
				<%
					}
				%>
			</table>
			<table style="width: 100%">
				<tr>

					<td style="width: 25%"><input type="submit" name="operation"
						value="<%=UserListCtl.OP_PREVIOUS%>"
						<%=pageNo > 1 ? "" : "disabled"%>></td>
					<td align="center" style="width: 25%"><input type="submit"
						name="operation" value="<%=UserListCtl.OP_NEW%>"></td>
					<td align="center" style="width: 25%"><input type="submit"
						name="operation" value="<%=UserListCtl.OP_DELETE%>"></td>
					<td style="width: 25%" align="right"><input type="submit"
						name="operation" value="<%=UserListCtl.OP_NEXT%>"
						<%=(nextPageSize != 0) ? "" : "disabled"%>></td>

				</tr>
			</table>
			<%
				}
				if (list.size() == 0) {
			%>
			<table>
				<tr>
					<td align="right"><input type="submit" name="operation"
						value="<%=UserListCtl.OP_BACK%>"></td>
				</tr>
			</table>

			<%
				}
			%>
		</form>
	</div>
	<%@include file="Footer.jsp"%>
</body>
</html>