package com.meer.liferay.ipc;
import java.io.IOException;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletSession;

import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;
public class PortletSessionsIPCSenderAction extends MVCPortlet {
		public void getData(ActionRequest actionRequest,
				ActionResponse actionResponse) throws IOException, PortletException, SystemException {
			   String userEmailAddress = ParamUtil.getString(actionRequest,"userEmailAddress");
			   PortletSession portletSession = actionRequest.getPortletSession();
			   portletSession.setAttribute("userEmailAddress",userEmailAddress,PortletSession.APPLICATION_SCOPE);
			   
		}
}
