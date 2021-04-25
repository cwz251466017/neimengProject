package com.fh.controller.app.user;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.fh.controller.base.BaseController;
import com.fh.entity.app.AppContactUserVo;
import com.fh.entity.app.AppUserDetails;
import com.fh.entity.system.User;
import com.fh.service.fhoa.department.DepartmentManager;
import com.fh.service.system.dictionaries.DictionariesManager;
import com.fh.service.system.user.UserManager;
import com.fh.util.FileUpload;
import com.fh.util.FileUtil;
import com.fh.util.GetPinyin;
import com.fh.util.PageData;
import com.fh.util.PathUtil;
import com.fh.util.Tools;
import com.fh.util.myUtils;

/** 
 * APP用户信息
 */
@Controller
@RequestMapping(value="/app/user")
public class AppUserController extends BaseController {
	
	@Resource(name="departmentService")
	private DepartmentManager departmentService;
	
	@Resource(name="dictionariesService")
	private DictionariesManager dictionariesService;
	
	@Resource(name="userService")
	private UserManager userService;
	
	@RequestMapping(value="/find" ,produces="application/json;charset=UTF-8", method = RequestMethod.GET)
	@ResponseBody
	public Object find(String groupId,String keyword)throws Exception{
		PageData pd = new PageData();
		pd.put("DEPARTMENT_ID", groupId);
		pd.put("NAME", keyword);
		
		Map appUserDetailsMap = new HashMap();
		List<PageData> departmentList = departmentService.findDepartmentTypeByIdLikeName(pd);
		//是否进行自定义排序
		Boolean sortFlag=false;
		Boolean jumpFlag=false;
		for(int i = 0,j = departmentList.size();i < j;i++) {
			if("DT001001".equals(departmentList.get(i).get("TYPE"))) {//公司
				pd.put("COMPANY_ID", groupId);
				pd.put("USERNAME", keyword);
				List<PageData> companyUserList = userService.findUserByCompanyId(pd);
				if(myUtils.isEmpty(companyUserList)) {
					if(myUtils.isNotBlank(keyword)) {//判断是否有搜索关键字
						companyUserList = userService.findUserByLikeUserName(pd);
						jumpFlag=true;
					}
				if(!jumpFlag) {
					//判断是否顶级节点 OA000000 DEPARTMENT_ID
					PageData getTopDepPd = new PageData();
					getTopDepPd=departmentService.findById(pd);
					if(myUtils.isNull(getTopDepPd))
						continue;
					if(myUtils.isNull(getTopDepPd.get("BIANMA")))
						continue;
					if("OA000000".equals(getTopDepPd.get("BIANMA").toString()))
						companyUserList=userService.findUserByTopCompany(pd);//查询全集团
				}
			 }
				
				appUserDetailsMap = sortConcactUserByFirstPinYin(companyUserList,appUserDetailsMap,false);
			}else if("DT001002".equals(departmentList.get(i).get("TYPE"))) {//部门
				pd.put("DEPARTMENT_ID", groupId);
				pd.put("USERNAME", keyword);
				List<PageData> departmentUserList = userService.findUserByDepartmentId(pd);
				if(myUtils.isEmpty(departmentUserList)) {
	                    if(myUtils.isNotBlank(keyword)) {//判断是否有搜索关键字
	                    	departmentUserList = userService.findUserByLikeUserName(pd);
							
						}
						
				}
				
				appUserDetailsMap = sortConcactUserByFirstPinYin(departmentUserList,appUserDetailsMap,true);
				sortFlag=true;//进行自定义排序
			}else if("DT001003".equals(departmentList.get(i).get("TYPE"))) {//职位
				pd.put("POST_ID", groupId);
				pd.put("USERNAME", keyword);
				List<PageData> postUserList = userService.findUserByPostId(pd);
				if(myUtils.isEmpty(postUserList)) {
	                    if(myUtils.isNotBlank(keyword)) {//判断是否有搜索关键字
	                    	postUserList = userService.findUserByLikeUserName(pd);
							
						}
						
				}

				appUserDetailsMap = sortConcactUserByFirstPinYin(postUserList,appUserDetailsMap,false);
			}
		}
		
		List<AppContactUserVo> appContactUserVoList = convertConcactUserByMap(appUserDetailsMap,sortFlag);
		return appContactUserVoList;
	}
	
	@RequestMapping(value="/edit" , method = RequestMethod.POST)
	@ResponseBody
	public Object edit(String userId,String details,
			@RequestParam(value = "file[]", required = false) MultipartFile[] files)throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		Date date = new Date();
		
		JSONObject  jsonObject = JSONObject.parseObject(details);
		
		pd.put("USER_ID", userId);
		User edituser = userService.findByIdPo(pd);
		
		edituser.setUPDATE_TIME(Tools.date2Str(date,"yyyy-MM-dd HH:mm:ss"));
		edituser.setUSERID(userId);
		edituser.setPINYIN(GetPinyin.getPinYinHeadChar(edituser.getNAME()));
		if(jsonObject != null && jsonObject.size() > 0) {
			if(jsonObject.get("name") != null) {
				edituser.setNAME(jsonObject.get("name").toString());
			}
			if(jsonObject.get("sex") != null) {
				edituser.setSEX(Integer.valueOf(jsonObject.get("sex").toString()));
			}
			if(jsonObject.get("born") != null) {
				edituser.setBIRTHDAY(jsonObject.get("born").toString());
			}
			if(jsonObject.get("idNo") != null) {
				edituser.setID_CARD(jsonObject.get("idNo").toString());
			}
			if(jsonObject.get("mobile") != null) {
				edituser.setPHONE(jsonObject.get("mobile").toString());
			}
			if(jsonObject.get("tel") != null) {
				edituser.setTEL(jsonObject.get("tel").toString());
			}
			if(jsonObject.get("wx") != null) {
				edituser.setWEIXIN(jsonObject.get("wx").toString());
			}
			if(jsonObject.get("email") != null) {
				edituser.setEMAIL(jsonObject.get("email").toString());
			}
			if(jsonObject.get("email") != null) {
				edituser.setEMAIL(jsonObject.get("email").toString());
			}
			if(jsonObject.get("address") != null) {
				edituser.setADDRESS(jsonObject.get("address").toString());
			}
			
		}
		
		//**********保存处理表附件并删除原文件***********
		//删除图片
		if(files.length > 0 && files[0].getOriginalFilename() != "") {
			FileUtil.delFile(PathUtil.getClasspath()+edituser.getHEAD_PATH());
		}
		
		//保存图片
		String month = new SimpleDateFormat("yyyyMM/").format(date);	//按月份保存文件
		String filepath = "../uploadFiles/userHeadImage/";
		for (int i = 0; i < files.length; i++) { // 循环获取file数组中的文件
			if (files[i].getOriginalFilename() != "") {
				MultipartFile file = files[i];
				// 保存文件
				String realName = FileUpload.copyFileAndBak(file.getInputStream(), PathUtil.getClasspath() + filepath+month,
						"", file.getOriginalFilename());
				
				String realfilepath = filepath+month+realName;
				edituser.setHEAD_PATH(realfilepath);
			}
		}
		
		userService.editU(edituser);	//执行修改
		
		AppUserDetails appUserDetails = new AppUserDetails();
		//appUserDetails.setGroupId(edituser.getCOMPANY_ID());
		appUserDetails.setGroupId(edituser.getDEPARTMENT_ID());
		appUserDetails.setUserId(edituser.getUSER_ID());
		appUserDetails.setContactId(edituser.getUSER_ID());
		appUserDetails.setName(edituser.getNAME());
		appUserDetails.setSex(edituser.getSEX().toString());
		appUserDetails.setBorn(edituser.getBIRTHDAY());
		appUserDetails.setIdNo(edituser.getID_CARD());
		//appUserDetails.setIcon(AppConst.APPIP+edituser.getHEAD_PATH());
		appUserDetails.setIcon(edituser.getHEAD_PATH());
		appUserDetails.setJobState(edituser.getJOB_STATE().toString());
		appUserDetails.setUnitId(edituser.getCOMPANY_ID());
		appUserDetails.setUnit(edituser.getCOMPANY_NAME());
		appUserDetails.setDeptId(edituser.getDEPARTMENT_ID());
		appUserDetails.setDept(edituser.getDEPARTMENT_NAME());
		appUserDetails.setPosition(edituser.getPOST_NAME());
		appUserDetails.setMobile(edituser.getPHONE());
		appUserDetails.setTel(edituser.getTEL());
		appUserDetails.setWx(edituser.getWEIXIN());
		appUserDetails.setEmail(edituser.getEMAIL());
		appUserDetails.setAddress(edituser.getADDRESS());
		return appUserDetails;
	}
	
	/**
	 * 用map进行tag分类
	 * @param pageDateList
	 * @param appUserDetailsMap
	 * @param flag  是否进行自定义排序
	 * @return
	 * @throws Exception 
	 */
	private Map sortConcactUserByFirstPinYin(List<PageData> pageDateList,Map appUserDetailsMap,Boolean sortFlag) throws Exception {
		//用map来对tag分类
		for(int i = 0,j = pageDateList.size();i < j;i++) {
			String tag = GetPinyin.getPinYinFirstHeadChar(pageDateList.get(i).get("USERNAME").toString());
			if(sortFlag) {//需要进行自定义排序
				if(myUtils.isNotNull(pageDateList.get(i).get("IS_PLACE_TOP"))){
					if(pageDateList.get(i).get("IS_PLACE_TOP").toString().equals("1"))
					tag="#";
				}
			}
			List<AppUserDetails> appUserDetailsList = (List<AppUserDetails>) appUserDetailsMap.get(tag);
			AppUserDetails appUserDetails = new AppUserDetails();
			String userId=myUtils.isObjectNullReturnNull(pageDateList.get(i).get("USER_ID"));
			//查询用户职位信息
			PageData userPosPd = new PageData();
			userPosPd.put("USER_ID", userId);
			List<PageData> userPositionListPd = userService.getUserPositionListByUserId(userPosPd);
			StringBuilder positonName=new StringBuilder();
			//根据用户名和密码去读取用户信息
			for(int x= 0;x<userPositionListPd.size();x++) {
				userPosPd=userPositionListPd.get(x);
				positonName=positonName.append(",").append(userPosPd.get("POSITION_NAME").toString());
						
			}
			  
			if(appUserDetailsList == null || appUserDetailsList.size() == 0) {//取不到tag
				appUserDetailsList = new ArrayList<AppUserDetails>();
				appUserDetails = new AppUserDetails();
				appUserDetails.setGroupId(myUtils.isObjectNullReturnNull(pageDateList.get(i).get("COMPANY_ID")));
				appUserDetails.setUserId(userId);
				appUserDetails.setContactId(myUtils.isObjectNullReturnNull(pageDateList.get(i).get("USER_ID")));
				appUserDetails.setName(myUtils.isObjectNullReturnNull(pageDateList.get(i).get("NAME")));
	
				appUserDetails.setSex(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("SEX")));
				appUserDetails.setBorn(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("BIRTHDAY")));
				appUserDetails.setIdNo(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("ID_CARD")));
				appUserDetails.setIcon(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("HEAD_PATH")));
				
				appUserDetails.setJobState(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("JOB_STATE")));
				appUserDetails.setUnitId(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("COMPANY_ID")));
				appUserDetails.setUnit(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("COMPANY_NAME")));
				appUserDetails.setDeptId(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("DEPARTMENT_ID")));
				appUserDetails.setDept(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("DEPARTMENT_NAME")));
				//appUserDetails.setPosition(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("POST_NAME")));
				appUserDetails.setPosition(positonName.toString().substring(1)); 
				
				appUserDetails.setMobile(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("PHONE")));
				appUserDetails.setTel(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("TEL")));
				appUserDetails.setWx(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("WEIXIN")));
				appUserDetails.setEmail(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("EMAIL")));
				appUserDetails.setAddress(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("ADDRESS")));
				appUserDetails.setSortLevel(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("SORT_LEVEL"))==null?null:Integer.valueOf(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("SORT_LEVEL"))));
				appUserDetailsList.add(appUserDetails);
				appUserDetailsMap.put(tag,appUserDetailsList);
			}else {//取到tag，将用户详细列表拿出来，继续放
				appUserDetails = new AppUserDetails();
				appUserDetails.setGroupId(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("COMPANY_ID")));
				appUserDetails.setUserId(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("USER_ID")));
				appUserDetails.setContactId(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("USER_ID")));
				appUserDetails.setName(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("NAME")));
				
				appUserDetails.setSex(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("SEX")));
				appUserDetails.setBorn(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("BIRTHDAY")));
				appUserDetails.setIdNo(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("ID_CARD")));
				appUserDetails.setIcon(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("HEAD_PATH")));
				
				appUserDetails.setJobState(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("JOB_STATE")));
				appUserDetails.setUnitId(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("COMPANY_ID")));
				appUserDetails.setUnit(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("COMPANY_NAME")));
				appUserDetails.setDeptId(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("DEPARTMENT_ID")));
				appUserDetails.setDept(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("DEPARTMENT_NAME")));
				//appUserDetails.setPosition(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("POST_NAME")));
				appUserDetails.setPosition(positonName.toString().substring(1));
				
				appUserDetails.setMobile(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("PHONE")));
				appUserDetails.setTel(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("TEL")));
				appUserDetails.setWx(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("WEIXIN")));
				appUserDetails.setEmail(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("EMAIL")));
				appUserDetails.setAddress(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("ADDRESS")));
				appUserDetails.setSortLevel(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("SORT_LEVEL"))==null?null:Integer.valueOf(myUtils.isObjectNullReturnNull (pageDateList.get(i).get("SORT_LEVEL"))));
				
				appUserDetailsList.add(appUserDetails);
				appUserDetailsMap.put(tag,appUserDetailsList);
			}
		}
		return appUserDetailsMap;
	}
	
	/**
	 * 将分类好的map转为List
	 * @param appUserDetailsMap
	 * @return
	 */
	private List<AppContactUserVo> convertConcactUserByMap(Map appUserDetailsMap,Boolean sortFlag) {
		
		List<AppContactUserVo> appContactUserVoTotalList = new ArrayList<AppContactUserVo>();//总的list
		List<AppContactUserVo> appContactUserVoSelfList = new ArrayList<AppContactUserVo>();//自定义排序list
		List<AppContactUserVo> appContactUserVoPinYinList = new ArrayList<AppContactUserVo>();//按拼音排序的list
		
		
		AppContactUserVo appContactUserVo;
		//抽取自定义排序的集合
		if(sortFlag) {
			if(myUtils.isNotNull(appUserDetailsMap.get("#"))) {
				List<AppUserDetails> selfAppUserDetails=(List<AppUserDetails>)appUserDetailsMap.get("#");
				for(AppUserDetails ad :selfAppUserDetails) {
					if(ad.getSortLevel() ==null)
						ad.setSortLevel(selfAppUserDetails.size());
					
				}
				
				//对结果进行排序，按指定顺序由大到小进行排序
				 Comparator<AppUserDetails> comparator=new Comparator<AppUserDetails>() {

				  public int compare(AppUserDetails o1, AppUserDetails o2) {					    
						if(o1.getSortLevel()!=o2.getSortLevel()) {
							return (int)(o1.getSortLevel()-o2.getSortLevel());
						}else {
							return (int)(o1.getSortLevel()-o2.getSortLevel());	
						}
								
		             }
					};
				  Collections.sort(selfAppUserDetails,comparator);
				
				appContactUserVo = new AppContactUserVo();
				appContactUserVo.setTag("#");
				appContactUserVo.setContacts(selfAppUserDetails);
				appContactUserVoSelfList.add(appContactUserVo);
				appUserDetailsMap.remove("#");
			}
		}
		for (Object key : appUserDetailsMap.keySet()) {
			
			appContactUserVo = new AppContactUserVo();
			appContactUserVo.setTag(key.toString());
			appContactUserVo.setContacts((List<AppUserDetails>) appUserDetailsMap.get(key));
			appContactUserVoPinYinList.add(appContactUserVo);
		}
		
		appContactUserVoTotalList.addAll(appContactUserVoSelfList);
		appContactUserVoTotalList.addAll(appContactUserVoPinYinList);
		
		return appContactUserVoTotalList;
	}
	
}
