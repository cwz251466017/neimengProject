package com.fh.entity.system;

import com.fh.entity.Page;

/**
 * 
* 类名称：用户
* 类描述： 
* @author FH QQ 313596790[青苔]
* 作者单位： 
* 联系方式：
* 创建时间：2014年6月28日
* @version 1.0
 */
public class User {
	private String USER_ID;		//用户id
	private String USERNAME;	//用户名
	private String PASSWORD; 	//密码
	private String NAME;		//姓名
	private String RIGHTS;		//权限
	private String ROLE_ID;		//角色id
	private String LAST_LOGIN;	//最后登录时间
	private String IP;			//用户登录ip地址
	private String STATUS;		//状态
	private Role role;			//角色对象
	private Page page;			//分页对象
	private String SKIN;		//皮肤
	private String BZ;
	private String EMAIL;
	private String NUMBER;
	private String PHONE;
	private String CITY;
	private String FAX;
	private Integer SEX;
	private String BIRTHDAY;
	private String ID_CARD;
	private String HEAD_PATH;
	private Integer JOB_STATE;
	private String TEL;
	private String WEIXIN;
	private String ADDRESS;
	private String DEPARTMENT_ID;
	private String DEPARTMENT_NAME;
	private String POST_ID;
	private String POST_NAME;
	private String COMPANY_ID;
	private String COMPANY_NAME;
	private String CREATE_TIME;
	private String UPDATE_TIME;
	private String USERID;
	private Integer IS_VALUE;
	private String PINYIN;
	private String HEAD_PIN_YIN;            //拼音首字母
	private Integer SORT_LEVEL;             //置顶排序顺序
	private String IS_PLACE_TOP;            //是否置顶
	
	private String POST_IDTwo;              //第二职位
	private String POST_IDThree;            //第三职位
	private String POST_IDFour;             //第四职位
	private Boolean removePositionOne;       //移除第一职位标志位
	private Boolean removePositionTwo;       //移除第二职位标志位
	private Boolean removePositionThree;     //移除第三职位标志位
	private Boolean removePositionFour;      //移除第四职位标志位
	
	public String getSKIN() {
		return SKIN;
	}
	public void setSKIN(String sKIN) {
		SKIN = sKIN;
	}
	
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getUSERNAME() {
		return USERNAME;
	}
	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}
	public String getPASSWORD() {
		return PASSWORD;
	}
	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getRIGHTS() {
		return RIGHTS;
	}
	public void setRIGHTS(String rIGHTS) {
		RIGHTS = rIGHTS;
	}
	public String getROLE_ID() {
		return ROLE_ID;
	}
	public void setROLE_ID(String rOLE_ID) {
		ROLE_ID = rOLE_ID;
	}
	public String getLAST_LOGIN() {
		return LAST_LOGIN;
	}
	public void setLAST_LOGIN(String lAST_LOGIN) {
		LAST_LOGIN = lAST_LOGIN;
	}
	public String getIP() {
		return IP;
	}
	public void setIP(String iP) {
		IP = iP;
	}
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}
	
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public Page getPage() {
		if(page==null)
			page = new Page();
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getNUMBER() {
		return NUMBER;
	}
	public void setNUMBER(String nUMBER) {
		NUMBER = nUMBER;
	}
	public String getPHONE() {
		return PHONE;
	}
	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}
	public String getCITY() {
		return CITY;
	}
	public void setCITY(String cITY) {
		CITY = cITY;
	}
	public String getFAX() {
		return FAX;
	}
	public void setFAX(String fAX) {
		FAX = fAX;
	}
	public Integer getSEX() {
		return SEX;
	}
	public void setSEX(Integer sEX) {
		SEX = sEX;
	}
	public String getBIRTHDAY() {
		return BIRTHDAY;
	}
	public void setBIRTHDAY(String bIRTHDAY) {
		BIRTHDAY = bIRTHDAY;
	}
	public String getID_CARD() {
		return ID_CARD;
	}
	public void setID_CARD(String iD_CARD) {
		ID_CARD = iD_CARD;
	}
	public String getHEAD_PATH() {
		return HEAD_PATH;
	}
	public void setHEAD_PATH(String hEAD_PATH) {
		HEAD_PATH = hEAD_PATH;
	}
	public Integer getJOB_STATE() {
		return JOB_STATE;
	}
	public void setJOB_STATE(Integer jOB_STATE) {
		JOB_STATE = jOB_STATE;
	}
	public String getTEL() {
		return TEL;
	}
	public void setTEL(String tEL) {
		TEL = tEL;
	}
	public String getWEIXIN() {
		return WEIXIN;
	}
	public void setWEIXIN(String wEIXIN) {
		WEIXIN = wEIXIN;
	}
	public String getADDRESS() {
		return ADDRESS;
	}
	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}
	public String getDEPARTMENT_ID() {
		return DEPARTMENT_ID;
	}
	public void setDEPARTMENT_ID(String dEPARTMENT_ID) {
		DEPARTMENT_ID = dEPARTMENT_ID;
	}
	public String getPOST_ID() {
		return POST_ID;
	}
	public void setPOST_ID(String pOST_ID) {
		POST_ID = pOST_ID;
	}
	public String getCOMPANY_ID() {
		return COMPANY_ID;
	}
	public void setCOMPANY_ID(String cOMPANY_ID) {
		COMPANY_ID = cOMPANY_ID;
	}
	public String getCREATE_TIME() {
		return CREATE_TIME;
	}
	public void setCREATE_TIME(String cREATE_TIME) {
		CREATE_TIME = cREATE_TIME;
	}
	public String getUPDATE_TIME() {
		return UPDATE_TIME;
	}
	public void setUPDATE_TIME(String uPDATE_TIME) {
		UPDATE_TIME = uPDATE_TIME;
	}
	public void useId(String uPDATE_TIME) {
		UPDATE_TIME = uPDATE_TIME;
	}
	public String getUSERID() {
		return USERID;
	}
	public void setUSERID(String uSERID) {
		USERID = uSERID;
	}
	public Integer getIS_VALUE() {
		return IS_VALUE;
	}
	public void setIS_VALUE(Integer iS_VALUE) {
		IS_VALUE = iS_VALUE;
	}
	public String getBZ() {
		return BZ;
	}
	public void setBZ(String bZ) {
		BZ = bZ;
	}
	public String getPINYIN() {
		return PINYIN;
	}
	public void setPINYIN(String pINYIN) {
		PINYIN = pINYIN;
	}
	public String getDEPARTMENT_NAME() {
		return DEPARTMENT_NAME;
	}
	public void setDEPARTMENT_NAME(String dEPARTMENT_NAME) {
		DEPARTMENT_NAME = dEPARTMENT_NAME;
	}
	public String getPOST_NAME() {
		return POST_NAME;
	}
	public void setPOST_NAME(String pOST_NAME) {
		POST_NAME = pOST_NAME;
	}
	public String getCOMPANY_NAME() {
		return COMPANY_NAME;
	}
	public void setCOMPANY_NAME(String cOMPANY_NAME) {
		COMPANY_NAME = cOMPANY_NAME;
	}
	public String getHEAD_PIN_YIN() {
		return HEAD_PIN_YIN;
	}
	public void setHEAD_PIN_YIN(String hEAD_PIN_YIN) {
		HEAD_PIN_YIN = hEAD_PIN_YIN;
	}
	public Integer getSORT_LEVEL() {
		return SORT_LEVEL;
	}
	public void setSORT_LEVEL(Integer sORT_LEVEL) {
		SORT_LEVEL = sORT_LEVEL;
	}
	public String getIS_PLACE_TOP() {
		return IS_PLACE_TOP;
	}
	public void setIS_PLACE_TOP(String iS_PLACE_TOP) {
		IS_PLACE_TOP = iS_PLACE_TOP;
	}
	public String getPOST_IDTwo() {
		return POST_IDTwo;
	}
	public void setPOST_IDTwo(String pOST_IDTwo) {
		POST_IDTwo = pOST_IDTwo;
	}
	public String getPOST_IDThree() {
		return POST_IDThree;
	}
	public void setPOST_IDThree(String pOST_IDThree) {
		POST_IDThree = pOST_IDThree;
	}
	public String getPOST_IDFour() {
		return POST_IDFour;
	}
	public void setPOST_IDFour(String pOST_IDFour) {
		POST_IDFour = pOST_IDFour;
	}
	public Boolean getRemovePositionOne() {
		return removePositionOne;
	}
	public void setRemovePositionOne(Boolean removePositionOne) {
		this.removePositionOne = removePositionOne;
	}
	public Boolean getRemovePositionTwo() {
		return removePositionTwo;
	}
	public void setRemovePositionTwo(Boolean removePositionTwo) {
		this.removePositionTwo = removePositionTwo;
	}
	public Boolean getRemovePositionThree() {
		return removePositionThree;
	}
	public void setRemovePositionThree(Boolean removePositionThree) {
		this.removePositionThree = removePositionThree;
	}
	public Boolean getRemovePositionFour() {
		return removePositionFour;
	}
	public void setRemovePositionFour(Boolean removePositionFour) {
		this.removePositionFour = removePositionFour;
	}
	
	
	
	
}
