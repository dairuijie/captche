package com.netease.is.nc.demo.web;

import com.netease.is.nc.sdk.NECaptchaVerifier;
import com.netease.is.nc.sdk.NESecretPair;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.Request;

import java.io.IOException;

/**
 * 

* <p>Title: LoginServlet</p>  

* <p>Description:登陆测试Servlet </p>  

* @author dairuijie  

* @date 2018年4月1日
 */
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = -3185301474503659058L;
    private static final String captchaId = "申请服务获取"; // 验证码id
    private static final String secretId = "申请服务获取"; // 密钥对id
    private static final String secretKey = "申请服务获取"; // 密钥对key
    private static  String projectPath = null;//项目路劲
    private final NECaptchaVerifier verifier = new NECaptchaVerifier(captchaId, new NESecretPair(secretId, secretKey));

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        projectPath = request.getContextPath();
        String validate = request.getParameter(NECaptchaVerifier.REQ_VALIDATE); // 从请求体里获得验证码validate数据
        String user = "{'id':'123456'}";

        boolean isValid = verifier.verify(validate, user); // 发起二次校验

        System.out.println("validate = " + validate + ", isValid = " + isValid);
        if (isValid) {
            response.sendRedirect(projectPath + "/success.jsp");
        } else {
            response.sendRedirect(projectPath+ "/fail.jsp");
        }
    }
   
}
