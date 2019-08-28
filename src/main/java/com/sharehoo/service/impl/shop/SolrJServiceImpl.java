package com.sharehoo.service.impl.shop;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehoo.dao.SearchDao;
import com.sharehoo.entity.shop.SearchResult;
import com.sharehoo.entity.shop.Source;
import com.sharehoo.service.SolrJService;
import com.sharehoo.service.shop.SourceService;
import com.sharehoo.util.forum.E3Result;
@Transactional
@Service("solrJService")
public class SolrJServiceImpl implements SolrJService {
	
	@Autowired
	private SolrClient solrServer;
	@Resource
	private SourceService sourceService;
	
	private SearchDao searchDao = new SearchDao();
	
	@Override
	public E3Result importAllItems() {
		// TODO Auto-generated method stub
		try {
			
			solrServer.deleteById("*:*",1000);			//先清空原来的内容
			
			// 查询商品列表
			List<Source> sourceList=sourceService.getSearchSourceList(null);
			//遍历商品列表
			for(Source searchItem : sourceList){
				//创建文档对象
				SolrInputDocument document=new SolrInputDocument();
				
				//向文档对象中添加域
				document.addField("id", String.valueOf(searchItem.getId()));
				document.addField("item_title", searchItem.getName());
				document.addField("item_uploadDate", searchItem.getUpload_time().toString());
				document.addField("item_douNum", searchItem.getDouNum());
				document.addField("item_downNum", searchItem.getDownNum());
				document.addField("item_image", searchItem.getPath());
				document.addField("item_category_name", searchItem.getCategory().getName());
				document.addField("item_desc", searchItem.getDescription());
				document.addField("item_type", searchItem.getType().getName());
				document.addField("item_menu", searchItem.getMenu().getName());
				document.addField("item_shop_name", searchItem.getShop().getShop_name());
				document.addField("item_tag", searchItem.getTag());
				document.addField("item_size", searchItem.getSize());
					//把文档对象写入索引库
					solrServer.add(document);
				}
					//提交
					solrServer.commit();
					//返回提交成功
				} catch (SolrServerException e) {
					
					e.printStackTrace();
					return E3Result.build(500, "数据导入异常");
				} catch (IOException e) {
					
					e.printStackTrace();
					return E3Result.build(500, "数据导入异常");
				}
			return E3Result.ok();
				
		}

	@Override
	public SearchResult search(String keyword,String category_name,String menu_name,String type, int page, int rows)
			throws Exception {
		// TODO Auto-generated method stub
		// 创建一个solrQuery对象
				SolrQuery solrQuery=new SolrQuery();
				
				if(!StringUtils.isNotEmpty(keyword)){
					keyword="*";
				}
				//如果是单个字符，进行模糊查询
				if(keyword.length()==1 && !"*".equals(keyword)){
					solrQuery.setQuery("item_title:"+"*"+keyword+"*");		//模糊查询
				}else{
					solrQuery.setQuery("item_title:"+keyword);
				}

				
				//设置分页条件
				if(page<=0){
					page=1;
				}
				solrQuery.setStart((page-1)*rows);
				solrQuery.setRows(rows);
				
				//设置默认搜索域
				solrQuery.set("df","item_title");
				solrQuery.set("df","item_desc");
				solrQuery.set("df","item_tag");
				
				//设置过滤条件,如果点击目录按钮，则将只筛选此目录内的数据
				if(StringUtils.isNotEmpty(category_name) && !"0".equals(category_name)){
					solrQuery.set("fq","item_category_name:"+category_name);
				}
				if(StringUtils.isNotEmpty(menu_name) && !"0".equals(menu_name)){
					solrQuery.set("fq", "item_menu:"+menu_name);
				}
				if(StringUtils.isNotEmpty(type) && !"0".equals(type)){
					solrQuery.set("fq", "item_type:"+type);
				}
				
				
				//开启高亮显示
				if("*".equals(keyword)){			//如果keyword为空，默认搜索全部资源，此时会将全部title和description高亮，要避免这样
					
					solrQuery.setHighlight(false);
					solrQuery.addHighlightField("item_title");
//					solrQuery.addHighlightField("item_desc");
				}else{
					solrQuery.setHighlight(true);
					solrQuery.addHighlightField("item_title");
//					solrQuery.addHighlightField("item_desc");
					solrQuery.setHighlightSimplePre("<em style=\"color:red\">");
					solrQuery.setHighlightSimplePost("</em>");
				}
				
				
				//调用dao执行查询
				SearchResult result=searchDao.search(solrQuery);
				
				//计算总页数
				long recordCount=result.getRecordCount();
				int totalPage = (int)(recordCount / rows) ;
				if(recordCount % rows>0){
					totalPage++;
				}
				
				//添加到返回结果
				result.setTotalPages(totalPage);
				
				return result;
			}
	}

