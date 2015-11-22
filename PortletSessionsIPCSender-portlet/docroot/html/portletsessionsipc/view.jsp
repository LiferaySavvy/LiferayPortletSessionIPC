<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet"%>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>
<portlet:defineObjects />
<liferay-theme:defineObjects />
<portlet:actionURL var="sendDataActionURL" windowState="normal"
	name="getData">
</portlet:actionURL>
<h1>Portlet Sessions IPC Sender Portlet</h1>
<aui:form action="<%=sendDataActionURL%>" method="post" name="smsForm">
<aui:input name="userEmailAddress" id="userEmailAddress" label="User Email Address">
	<aui:validator name="required" />
	<aui:validator name="email"></aui:validator>
</aui:input>
<aui:button type="submit" value="Submit"></aui:button>
</aui:form>