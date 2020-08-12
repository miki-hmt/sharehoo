package com.sharehoo.entity.shop;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


/*
 * miki 2017.06.24	店铺等级表实体对象模型
 */

@Entity
@Table(name="t_level")
public class Level implements Serializable{
	private int id;
	private int score;		//百分比，计算所有用户评价分数的总和，然后求平均值。为了防止小数点问题，求平均值后都要乘以100
	private String name;	//等级划分，每个等级对应一个名字(荣耀黄金，华贵白金.....)
	
	@Id
	@GeneratedValue(generator="_native") //设置自动增长
	@GenericGenerator(name="_native",strategy="native")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(length=11)
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	@Column(length=20)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
}
