/*
+--------------------------------------------------------------------------
|   Mblog [#RELEASE_VERSION#]
|   ========================================
|   Copyright (c) 2014, 2015 mtons. All Rights Reserved
|   http://www.mtons.com
|
+---------------------------------------------------------------------------
*/
package com.sharehoo.controller;

import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.sharehoo.base.upload.FileRepoFactory;
import com.sharehoo.base.util.StringEscapeEditor;
import com.sharehoo.config.AppContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
* @ClassName: BaseController  
* @Description: TODO(Controller 基类)  
* @author miki
* @date 2019年6月19日 下午12:17:06  
*
 */
public class BaseController {
	@Autowired
	protected HttpSession session;
	@Autowired
	protected AppContext appContext;
	@Autowired
	protected FileRepoFactory fileRepoFactory;

	@InitBinder
	public void initBinder(ServletRequestDataBinder binder) {
		/**
		 * 自动转换日期类型的字段格式
		 */
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));

		/**
		 * 防止XSS攻击
		 */
		binder.registerCustomEditor(String.class, new StringEscapeEditor(true, false));
	}

	/**
	 * 获取登录信息
	 * 
	 * @return
	 */
	/*protected AccountSubject getSubject(){
	    return (AccountSubject) SecurityUtils.getSubject();
	}
	
	protected void putProfile(AccountProfile profile) {
		SecurityUtils.getSubject().getSession(true).setAttribute("profile", profile);
	}

	protected AuthenticationToken createToken(String username, String password) {
		return new UsernamePasswordToken(username, MD5.md5(password));
	}*/

	protected Pageable wrapPageable() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		int pageSize = ServletRequestUtils.getIntParameter(request, "pageSize", 10);
		int pageNo = ServletRequestUtils.getIntParameter(request, "pn", 1);
		return new PageRequest(pageNo - 1, pageSize);
	}

	/**
	 * 包装分页对象
	 *
	 * @param pn 页码
	 * @param pn 页码
	 * @return
	 */
	protected Pageable wrapPageable(Integer pn, Integer pageSize) {
		if (pn == null || pn == 0) {
			pn = 1;
		}
		if (pageSize == null || pageSize == 0) {
			pageSize = 10;
		}
		return new PageRequest(pn - 1, pageSize);
	}

	protected String getSuffix(String name) {
		int pos = name.lastIndexOf(".");
		return name.substring(pos);
	}

	protected String getView(String view) {
		return "/default" + view;
	}
	
	protected String routeView(String route, String group) {
		String format = "/default" + route;
		return String.format(format, group);
	}

	public static String getIpAddr(HttpServletRequest request) throws Exception {
		String ip = request.getHeader("X-Real-IP");
		if (!StringUtils.isBlank(ip) && !"unknown".equalsIgnoreCase(ip)) {
			return ip;
		}
		ip = request.getHeader("X-Forwarded-For");
		if (!StringUtils.isBlank(ip) && !"unknown".equalsIgnoreCase(ip)) {
			// 多次反向代理后会有多个IP值，第一个为真实IP。
			int index = ip.indexOf(',');
			if (index != -1) {
				return ip.substring(0, index);
			} else {
				return ip;
			}
		} else {
			return request.getRemoteAddr();
		}
	}
	
//	protected List<Attach> handleAlbums(String[] albums) {
//		if (albums == null || albums.length == 0) {
//			return Collections.emptyList();
//		}
//
//		List<Attach> rets = new ArrayList<>();
//
//		for (String album : albums) {
//			if (StringUtils.isBlank(album)) {
//				continue;
//			}
//
//			String root = fileRepoFactory.select().getRoot();
//			File temp = new File(root + album);
//			Attach item = new Attach();
//			try {
//				// 保存原图
//				String orig = fileRepoFactory.select().storeScale(temp, appContext.getOrigDir(), 750);
//				item.setOriginal(orig);
//
//				// 创建缩放图片
//				String preview = fileRepoFactory.select().storeScale(temp, appContext.getThumbsDir(), 305);
//				item.setPreview(preview);
//
//				// 创建快照
//				String screenshot = fileRepoFactory.select().storeScale(temp, appContext.getScreenshotDir(), 225, 140);
//				item.setScreenshot(screenshot);
//
//				rets.add(item);
//			} catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//				if (temp != null) {
//					temp.delete();
//				}
//			}
//		}
//
//		return rets;
//	}

	/*protected void extractImages(Post post) {
		Document doc = Jsoup.parse(post.getContent());
		Elements elements = doc.select("img");
		List<Attach> rets = new ArrayList<>();

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

		for (Element el : elements) {
			String imageUrl = el.attr("src");

			if (request.getContextPath().length() > 1 && imageUrl.startsWith(request.getContextPath())) {
				imageUrl = imageUrl.replace(request.getContextPath(), "");
			}
			Attach a = new Attach();
			a.setOriginal(imageUrl);
			a.setPreview(imageUrl);

			if (imageUrl.startsWith("http")) {
				a.setStore(1);
			}
			rets.add(a);
		}

		post.setContent(doc.html());
		if (rets.size() > 0) {
			post.setAlbums(rets);
		}
	}*/
}
