package com.sharehoo.listener;

import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.ProgressListener;
import org.springframework.stereotype.Component;

import com.sharehoo.util.CxCacheUtil;

@Component
public class UploadProgressListener implements ProgressListener{
	
	private HttpSession session;
	 
	public void setSession(HttpSession session){
		this.session=session;
	}
	
	@Override
	public void update(long BytesRead, long contentLength, int pItems) {
		// TODO Auto-generated method stub
		CxCacheUtil.getIntance().setValue("total_"+session.getId(), contentLength);
		CxCacheUtil.getIntance().setValue("progress_"+session.getId(), BytesRead);
	}

}
