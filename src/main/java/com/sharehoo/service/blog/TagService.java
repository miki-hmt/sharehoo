package com.sharehoo.service.blog;

import com.sharehoo.entity.blog.Tag;

public interface TagService {
	public void save(Tag tag);
	public Tag getTagByUserId(int userId);
}
