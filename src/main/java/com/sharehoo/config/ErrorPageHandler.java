package com.sharehoo.config;

import org.springframework.boot.web.server.ErrorPage;
import org.springframework.boot.web.server.ErrorPageRegistrar;
import org.springframework.boot.web.server.ErrorPageRegistry;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

@Component
public class ErrorPageHandler implements ErrorPageRegistrar{

	@Override
	public void registerErrorPages(ErrorPageRegistry registry) {
		// TODO Auto-generated method stub
		ErrorPage error404Page = new ErrorPage(HttpStatus.NOT_FOUND, "/WEB-INF/jsp/bug/error.jsp");
        ErrorPage error405Page = new ErrorPage(HttpStatus.METHOD_NOT_ALLOWED, "/WEB-INF/errorpage/405.html");
        ErrorPage error500Page = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/WEB-INF/jsp/bug/1bug.jsp");
        registry.addErrorPages(error404Page, error405Page, error500Page);
	}

}
