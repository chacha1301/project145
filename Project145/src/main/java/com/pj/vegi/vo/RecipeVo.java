package com.pj.vegi.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RecipeVo {

	private String rId;    
	private String rType;    
	private String rTitle;      
	private Date rDate;               
	private String rContent;          
	private String rImage;     
	private int rHit;                     
	private String mId;         
	private String cId;              
	private String[] cIdArr;  
	private int rReport;     
	private int start;
	private int end;
	private int startPage;
	private int endPage;
}
