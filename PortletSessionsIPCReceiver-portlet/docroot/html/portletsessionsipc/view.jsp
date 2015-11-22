<%@page import="javax.portlet.PortletSession"%>
<%@page import="com.liferay.portal.NoSuchUserException"%>
<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page import="com.liferay.portal.kernel.util.ParamUtil"%>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet"%>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>
<portlet:defineObjects />
<liferay-theme:defineObjects />
<h1>Receive User Data from Sender Portlet</h1>
<%
String message=null;
PortletSession portletSessionobject = renderRequest.getPortletSession();
String userEmailAddress=null;
if(portletSessionobject.getAttribute("userEmailAddress",PortletSession.APPLICATION_SCOPE)!=null){
	userEmailAddress = (String)portletSessionobject.getAttribute("userEmailAddress",PortletSession.APPLICATION_SCOPE);
}
User senderPortletUserOject=null;
try{
	if(userEmailAddress!=null){
		senderPortletUserOject=UserLocalServiceUtil.getUserByEmailAddress(themeDisplay.getCompanyId(), userEmailAddress);
	}
}catch(NoSuchUserException e){
	message="No User exists with the given Email Address.";
}catch(Exception e){
	message="There is problem in view the user details.";
}

if(senderPortletUserOject!=null){
%>
<table border="1">
	<tr>
		<td>User Id</td>
		<td><%=senderPortletUserOject.getUserId()%></td>
	</tr>
	<tr>
		<td>First Name</td>
		<td><%=senderPortletUserOject.getFirstName()%></td>
	</tr>
	<tr>
		<td>Last Name</td>
		<td><%=senderPortletUserOject.getLastName()%></td>
	</tr>
	<tr>
		<td>Email Address</td>
		<td><%=senderPortletUserOject.getEmailAddress()%></td>
	</tr>
	<tr>
		<td>Screen Name</td>
		<td><%=senderPortletUserOject.getScreenName()%></td>
	</tr>
</table>

<%}else{%>
<%=message%>
<%}%>