package com.sharehoo.service.forum;

import java.util.List;

import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.Section;

public interface SectionService {

	public void saveSection(Section section);
	
	public void deleteSection(Section section);
	
	public List<Section> findSectionList(Section s_section,PageBean pageBean);
	
	public Long getSectionCount(Section s_section);
	
	public Section findSectionById(int sectionId);
	
}
