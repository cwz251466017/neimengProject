package com.fh.controller.system.user;

import java.io.File;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.Role;
import com.fh.entity.system.User;
import com.fh.service.fhoa.companydepartmentpostuser.CompanyDepartmentPostUserManager;
import com.fh.service.fhoa.department.DepartmentManager;
import com.fh.service.system.fhlog.FHlogManager;
import com.fh.service.system.menu.MenuManager;
import com.fh.service.system.role.RoleManager;
import com.fh.service.system.user.UserManager;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.FileDownload;
import com.fh.util.FileUpload;
import com.fh.util.FileUtil;
import com.fh.util.FileUtils;
import com.fh.util.GetPinyin;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelRead;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.PathUtil;
import com.fh.util.Tools;
import com.fh.util.myUtils;

import net.sf.json.JSONArray;

/** 
 * 类名称：UserController
 * 创建人：FH fh313596790qq(青苔)
 * 更新时间：2015年11月3日
 * @version
 */
@Controller
@RequestMapping(value="/user")
public class UserController extends BaseController {
	
	String menuUrl = "user/listUsers.do"; //菜单地址(权限用)
	@Resource(name="userService")
	private UserManager userService;
	@Resource(name="roleService")
	private RoleManager roleService;
	@Resource(name="menuService")
	private MenuManager menuService;
	@Resource(name="fhlogService")
	private FHlogManager FHLOG;
	@Resource(name="departmentService")
	private DepartmentManager departmentService;
	@Resource(name="companydepartmentpostuserService")
	private CompanyDepartmentPostUserManager companydepartmentpostuserService;
	
	
	/**显示用户列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listUsers")
	public ModelAndView listUsers(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		/*
		String lastLoginStart = pd.getString("lastLoginStart");	//开始时间
		String lastLoginEnd = pd.getString("lastLoginEnd");		//结束时间
		if(lastLoginStart != null && !"".equals(lastLoginStart)){
			pd.put("lastLoginStart", lastLoginStart+" 00:00:00");
		}
		if(lastLoginEnd != null && !"".equals(lastLoginEnd)){
			pd.put("lastLoginEnd", lastLoginEnd+" 23:59:59");
		}
		*/ 
		
		///  
		String DEPARTMENT_ID = pd.getString("DEPARTMENT_ID");
		if(null == keywords || "".equals(keywords)) {
		  pd.put("DEPARTMENT_ID", null == DEPARTMENT_ID?Jurisdiction.getDEPARTMENT_ID():DEPARTMENT_ID);	//只有检索条件穿过值时，才不为null,否则读取缓存
		  pd.put("item", (null == pd.getString("DEPARTMENT_ID")?Jurisdiction.getDEPARTMENT_IDS():departmentService.getDEPARTMENT_IDS(pd.getString("DEPARTMENT_ID"))));	//部门检索条件,列出此部门下级所属部门的员工
		}else {
		  pd.put("item", "");
		}
		/* 比如员工 张三 所有部门权限的部门为 A ， A 的下级有  C , D ,F ，那么当部门检索条件值为A时，只列出A以下部门的员工(自己不能修改自己的信息，只能上级部门修改)，不列出部门为A的员工，当部门检索条件值为C时，可以列出C及C以下员工 */
		if(!(null == DEPARTMENT_ID || DEPARTMENT_ID.equals(Jurisdiction.getDEPARTMENT_ID()))){
			pd.put("item", pd.getString("item").replaceFirst("\\(", "\\('"+DEPARTMENT_ID+"',"));
		}
		
		page.setPd(pd);
		
		//列表页面树形下拉框用(保持下拉树里面的数据不变)
		String ZDEPARTMENT_ID = pd.getString("ZDEPARTMENT_ID");
		ZDEPARTMENT_ID = Tools.notEmpty(ZDEPARTMENT_ID)?ZDEPARTMENT_ID:Jurisdiction.getDEPARTMENT_ID();
		pd.put("ZDEPARTMENT_ID", ZDEPARTMENT_ID);
		List<PageData> zdepartmentPdList = new ArrayList<PageData>();
		JSONArray arr = JSONArray.fromObject(departmentService.listAllDepartmentToSelect(ZDEPARTMENT_ID,zdepartmentPdList));
		mv.addObject("zTreeNodes", arr.toString());
		PageData dpd = departmentService.findById(pd);
		if(null != dpd){
			ZDEPARTMENT_ID = dpd.getString("NAME");
		}
		mv.addObject("depname", ZDEPARTMENT_ID);
		///////
	
		List<PageData>	userList = userService.listUsers(page);	//列出用户列表
		mv.addObject("userList", userList);
		pd.put("ROLE_ID", "1");
		List<Role> roleList = roleService.listAllRolesByPId(pd);//列出所有系统用户角色
		mv.addObject("roleList", roleList);
		
		mv.setViewName("system/user/user_list");
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**删除用户
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteU")
	public void deleteU(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除user");
		PageData pd = new PageData();
		pd = this.getPageData();
		userService.deleteU(pd);
		FHLOG.save(Jurisdiction.getUsername(), "删除系统用户："+pd);
		out.write("success");
		out.close();
	}
	
	/**去新增用户页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddU")
	public ModelAndView goAddU()throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		pd.put("ROLE_ID", "1");
		List<Role> roleList = roleService.listAllRolesByPId(pd);//列出所有系统用户角色
		mv.addObject("roleList", roleList);
		
		List<PageData> zdepartmentPdList = new ArrayList<PageData>();
		JSONArray arr = JSONArray.fromObject(departmentService.listAllDepartmentToSelect(Jurisdiction.getDEPARTMENT_ID(),zdepartmentPdList));
		mv.addObject("zTreeNodes", (null == arr ?"":arr.toString()));
		
		mv.setViewName("system/user/user_edit");
		mv.addObject("msg", "saveU");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**保存用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveU", method = RequestMethod.POST)
	public ModelAndView saveU(User adduser,
			@RequestParam(value = "attachment[]", required = false) MultipartFile[] files) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		Date date = new Date();
		
		adduser.setUSER_ID(this.get32UUID());//ID 主键
		adduser.setPASSWORD(new SimpleHash("SHA-1",adduser.getPASSWORD()).toString());
		adduser.setRIGHTS("");
		adduser.setLAST_LOGIN("");
		adduser.setIP("");
		adduser.setSTATUS("0");
		adduser.setBZ("");
		adduser.setSKIN("default");
		adduser.setCITY("");
		adduser.setCREATE_TIME(Tools.date2Str(date,"yyyy-MM-dd HH:mm:ss"));
		adduser.setUPDATE_TIME(Tools.date2Str(date,"yyyy-MM-dd HH:mm:ss"));
		adduser.setUSERID(user.getUSER_ID());
		adduser.setIS_VALUE(0);
		adduser.setHEAD_PATH("../uploadFiles/userHeadImage/"+adduser.getUSERNAME()+".jpg");
		adduser.setPINYIN(GetPinyin.getPinYinHeadChar(adduser.getNAME()));
		adduser.setHEAD_PIN_YIN(GetPinyin.getPinYinHeadChar(adduser.getNAME()).substring(0,1));
		adduser.setROLE_ID("3e98d146b7cc43e9952da535e0d5f6ae");//通讯录用户
		/*如果是一级，公司id,部门id,职位id为同一个
		如果是二级，公司id和部门id同一个，职位id为一个
		如果是三级，公司id，部门id，职位id分别为一个*/
		//1.查出职位id
		
		  //遍历修改4个职位
		  String positionId=null;
		  String[] positionArray= {adduser.getPOST_ID(),adduser.getPOST_IDTwo(),adduser.getPOST_IDThree(),adduser.getPOST_IDFour()};
					
		  for(int i=0;i<positionArray.length;i++) {	
			  positionId=positionArray[i];
			  if(positionId == null)
				  continue;
				  
				if(null != positionId && !"".equals(positionId)) {
					pd.put("DEPARTMENT_ID", positionId);
					PageData department = departmentService.findById(pd);
					
					//2.查部门id
					String parentDeparementIds = departmentService.findParentDepartmentById(adduser.getPOST_ID());
					pd.put("parentDeparementIds", parentDeparementIds);
					List<PageData> departmentList = departmentService.findDepartmentByParentDeparementIds(pd);
					if(departmentList.size() == 0) {//如果没有
						adduser.setDEPARTMENT_ID(adduser.getPOST_ID());
					}else if(departmentList.size() == 1) {//如果有一个，则这个就是部门id
						adduser.setDEPARTMENT_ID(departmentList.get(0).get("DEPARTMENT_ID").toString());
					}else {//如果多个，职位id的父id就是部门id
						adduser.setDEPARTMENT_ID(department.get("PARENT_ID").toString());
					}
					
					//3.查公司id
					PageData company = departmentService.findCompanyByParentDeparementIds(pd);
					adduser.setCOMPANY_ID(company.get("DEPARTMENT_ID").toString());
					
					//公司部门职位用户关系表
					pd.put("COMPANYDEPARTMENTPOSTUSER_ID", this.get32UUID());
					pd.put("COMPANY_ID", company.get("DEPARTMENT_ID"));
					pd.put("DEPARTMENT_ID", adduser.getDEPARTMENT_ID());
					pd.put("POST_ID", positionId);
					pd.put("USER_ID", adduser.getUSER_ID());
					pd.put("POSITION_NAME", department.get("NAME").toString());
					pd.put("POSITION_TYPE", i+1);
					companydepartmentpostuserService.save(pd);
				}
		  }
		//**********保存处理表附件***********
		String month = new SimpleDateFormat("yyyyMM/").format(date);	//按月份保存文件
		String filepath = "../uploadFiles/userHeadImage/";
		for (int i = 0; i < files.length; i++) { // 循环获取file数组中的文件
			if (files[i].getOriginalFilename() != "") {
				MultipartFile file = files[i];
				// 保存文件
				String realName = FileUpload.copyFileAndBak(file.getInputStream(), PathUtil.getClasspath() + filepath+month,
						"", file.getOriginalFilename());
				
				String realfilepath = filepath+month+realName;
				adduser.setHEAD_PATH(realfilepath);
			}
		}
				
		if(null == userService.findByUsername(adduser)){	//判断用户名是否存在
			userService.saveU(adduser); 					//执行保存
			FHLOG.save(Jurisdiction.getUsername(), "新增系统用户："+adduser.getUSERNAME());
			mv.addObject("msg","success");
		}else{
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	/**判断用户名是否存在
	 * @return
	 */
	@RequestMapping(value="/hasU")
	@ResponseBody
	public Object hasU(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(userService.findByUsername(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**判断邮箱是否存在
	 * @return
	 */
	@RequestMapping(value="/hasE")
	@ResponseBody
	public Object hasE(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(userService.findByUE(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**判断手机号是否存在
	 * @return
	 */
	@RequestMapping(value="/hasP")
	@ResponseBody
	public Object hasP(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(userService.findByUP(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**判断编码是否存在
	 * @return
	 */
	@RequestMapping(value="/hasN")
	@ResponseBody
	public Object hasN(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(userService.findByUN(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**去修改用户页面(系统用户列表修改)
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditU")
	public ModelAndView goEditU() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		if("1".equals(pd.getString("USER_ID"))){return null;}		//不能修改admin用户
		
		pd.put("ROLE_ID", "1");
		List<Role> roleList = roleService.listAllRolesByPId(pd);	//列出所有系统用户角色
		mv.addObject("roleList", roleList);
		
		List<PageData> zdepartmentPdList = new ArrayList<PageData>();
		JSONArray arr = JSONArray.fromObject(departmentService.listAllDepartmentToSelect(Jurisdiction.getDEPARTMENT_ID(),zdepartmentPdList));
		mv.addObject("zTreeNodes", (null == arr ?"":arr.toString()));
		
		//查出用户信息
		pd = userService.findById(pd);								//根据ID读取
		String departmentId = pd.get("DEPARTMENT_ID").toString();				//1.临时存储部门id，用于后面还原真是部门信息
		
		//更改头像相对地址为服务器地址
		pd.put("HEAD_PATH", pd.get("HEAD_PATH"));
		
		//根据用户信息职位id，还原ztree之前选的值
		pd.put("DEPARTMENT_ID", pd.get("POST_ID"));
		//查询用户所担任的职位
		List<PageData> userPositionPd=companydepartmentpostuserService.findByUserId(pd);
		PageData pramPd=new PageData();
		String positionId=null;
		for(int i =0;i<userPositionPd.size();i++) {
			pramPd = userPositionPd.get(i);
			positionId =pramPd.get("POST_ID").toString();
			pramPd.put("DEPARTMENT_ID", positionId);
			mv.addObject("postname"+(i+1), departmentService.findById(pramPd).getString("NAME"));
			pd.put("POST_ID"+(i+1), positionId);
		}
		pd.put("DEPARTMENT_ID", departmentId);			//1.还原真是的部门信息
		mv.addObject("pd", pd);
		mv.addObject("fx", "user");
		mv.addObject("msg", "editU");
		mv.setViewName("system/user/user_edit");
		return mv;
	}
	
	/**去修改用户页面(个人修改)
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditMyU")
	public ModelAndView goEditMyU() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.addObject("fx", "head");
		pd.put("ROLE_ID", "1");
		List<Role> roleList = roleService.listAllRolesByPId(pd);	//列出所有系统用户角色
		pd.put("USERNAME", Jurisdiction.getUsername());
		pd = userService.findByUsername(pd);						//根据用户名读取
		mv.setViewName("system/user/user_edit");
		mv.addObject("msg", "editU");
		mv.addObject("pd", pd);
		mv.addObject("roleList", roleList);
		return mv;
	}
	
	/**查看用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/view")
	public ModelAndView view() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if("admin".equals(pd.getString("USERNAME"))){return null;}	//不能查看admin用户
		pd.put("ROLE_ID", "1");
		List<Role> roleList = roleService.listAllRolesByPId(pd);	//列出所有系统用户角色
		pd = userService.findByUsername(pd);						//根据ID读取
		
		
		//查询用户所担任的职位
		List<PageData> userPositionPd=companydepartmentpostuserService.findByUserId(pd);
		PageData pramPd=new PageData();
		String positionId=null;
		for(int i =0;i<userPositionPd.size();i++) {
			    pramPd = userPositionPd.get(i);
				positionId =pramPd.get("POST_ID").toString();
				pramPd.put("DEPARTMENT_ID", positionId);
				mv.addObject("postname"+(i+1), departmentService.findById(pramPd).getString("NAME"));
				pd.put("POST_ID"+(i+1), positionId);
		}
		
		
		mv.setViewName("system/user/user_view");
		mv.addObject("msg", "editU");
		mv.addObject("pd", pd);
		mv.addObject("roleList", roleList);
		return mv;
	}
	
	/**去修改用户页面(在线管理页面打开)
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditUfromOnline")
	public ModelAndView goEditUfromOnline() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if("admin".equals(pd.getString("USERNAME"))){return null;}	//不能查看admin用户
		pd.put("ROLE_ID", "1");
		List<Role> roleList = roleService.listAllRolesByPId(pd);	//列出所有系统用户角色
		pd = userService.findByUsername(pd);						//根据ID读取
		mv.setViewName("system/user/user_edit");
		mv.addObject("msg", "editU");
		mv.addObject("pd", pd);
		mv.addObject("roleList", roleList);
		return mv;
	}
	
	/**
	 * 修改用户
	 */
	@RequestMapping(value="/editU", method = RequestMethod.POST)
	public ModelAndView editU(User edituser,
			@RequestParam(value = "attachment[]", required = false) MultipartFile[] files) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改user");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		Date date = new Date();
		
		if(!Jurisdiction.getUsername().equals(edituser.getUSERNAME())){		//如果当前登录用户修改用户资料提交的用户名非本人
			if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}  //校验权限 判断当前操作者有无用户管理查看权限
			if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限判断当前操作者有无用户管理修改权限
			if("admin".equals(edituser.getUSERNAME()) && !"admin".equals(Jurisdiction.getUsername())){return null;}	//非admin用户不能修改admin
		}else{	//如果当前登录用户修改用户资料提交的用户名是本人，则不能修改本人的角色ID
			edituser.setROLE_ID(userService.findByUsername(edituser).getString("ROLE_ID"));//对角色ID还原本人角色ID
		}
		
		//未更新用户前，1.要先更新关系表，2.公司部门职位用户关系表
		//更新关系对象并更新user对象的公司和部门id
		/*如果是一级，公司id,部门id,职位id为同一个
		如果是二级，公司id和部门id同一个，职位id为一个
		如果是三级，公司id，部门id，职位id分别为一个*/
		//1.先找到原关系对象(公司部门职位用户关系表)，不然edituser会在后面修改
		
		//遍历修改4个职位
		String positionId=null;
		String[] positionArray= {edituser.getPOST_ID(),edituser.getPOST_IDTwo(),edituser.getPOST_IDThree(),edituser.getPOST_IDFour()};
		Boolean removePositionFlag;
		Boolean[] removePositionFlagArray= {edituser.getRemovePositionOne(),edituser.getRemovePositionTwo(),edituser.getRemovePositionThree(),edituser.getRemovePositionFour()};
		for(int i=0;i<4;i++) {
			 positionId =positionArray[i];
			 if(null == positionId || "".equals(positionId)) 
				 continue;
				 
			 removePositionFlag = removePositionFlagArray[i];
				if(null != positionId && !"".equals(positionId) && !removePositionFlag) {//更新职位信息
					pd.put("COMPANY_ID", edituser.getCOMPANY_ID());
					pd.put("DEPARTMENT_ID", edituser.getDEPARTMENT_ID());
					pd.put("USER_ID", edituser.getUSER_ID());
					pd.put("POSITION_TYPE",i+1);//第几职位
					PageData companyDepartmentPostUser = companydepartmentpostuserService.findByIdCOMPANYDEPARTMENTPOSTUSER_ID(pd);
					
					//2.查出职位id
					pd.put("DEPARTMENT_ID", positionId);
					PageData department = departmentService.findById(pd);
					
					//3.查部门id
					String parentDeparementIds = departmentService.findParentDepartmentById(positionId);
					pd.put("parentDeparementIds", parentDeparementIds);
					List<PageData> departmentList = departmentService.findDepartmentByParentDeparementIds(pd);
					if(departmentList.size() == 0) {//如果没有
						edituser.setDEPARTMENT_ID(positionId);
					}else if(departmentList.size() == 1) {//如果有一个，则这个就是部门id
						edituser.setDEPARTMENT_ID(departmentList.get(0).get("DEPARTMENT_ID").toString());
					}else {//如果多个，职位id的父id就是部门id
						edituser.setDEPARTMENT_ID(department.get("PARENT_ID").toString());
					}
					
					//4.查公司id
					PageData company = departmentService.findCompanyByParentDeparementIds(pd);
					edituser.setCOMPANY_ID(company.get("DEPARTMENT_ID").toString());
					
					//5.更新原关系对象(公司部门职位用户关系表)
					if(null != companyDepartmentPostUser) {
						companyDepartmentPostUser.put("COMPANY_ID", company.get("DEPARTMENT_ID"));
						companyDepartmentPostUser.put("DEPARTMENT_ID", edituser.getDEPARTMENT_ID());
						companyDepartmentPostUser.put("POST_ID", positionId);
						companyDepartmentPostUser.put("USER_ID", edituser.getUSER_ID());
						companyDepartmentPostUser.put("POSITION_NAME", department.get("NAME").toString());
						companydepartmentpostuserService.edit(companyDepartmentPostUser);
					}else {
						companyDepartmentPostUser =new PageData();
						companyDepartmentPostUser.put("COMPANYDEPARTMENTPOSTUSER_ID", this.get32UUID());
						companyDepartmentPostUser.put("COMPANY_ID", company.get("DEPARTMENT_ID"));
						companyDepartmentPostUser.put("DEPARTMENT_ID", edituser.getDEPARTMENT_ID());
						companyDepartmentPostUser.put("POST_ID", positionId);
						companyDepartmentPostUser.put("USER_ID", edituser.getUSER_ID());
						companyDepartmentPostUser.put("POSITION_TYPE", i+1);
						companyDepartmentPostUser.put("POSITION_NAME", department.get("NAME").toString());
						companydepartmentpostuserService.deleteByUserIdAPosiType(companyDepartmentPostUser);
						companydepartmentpostuserService.save(companyDepartmentPostUser);
					}
					
					
					
				}else {//删除职位信息
					PageData delCompanyDepartmentPostUser = new PageData();
					delCompanyDepartmentPostUser.put("POSITION_TYPE",i+1);//第几职位
					delCompanyDepartmentPostUser.put("USER_ID", edituser.getUSER_ID());
					companydepartmentpostuserService.deleteByUserIdAPosiType(delCompanyDepartmentPostUser);
					
				}
				
	    }
				
		if(edituser.getPASSWORD() != null && !"".equals(edituser.getPASSWORD())){
			edituser.setPASSWORD(new SimpleHash("SHA-1",edituser.getPASSWORD()).toString());
		}
		edituser.setBZ("");
		edituser.setCITY("");
		edituser.setUPDATE_TIME(Tools.date2Str(date,"yyyy-MM-dd HH:mm:ss"));
		edituser.setUSERID(user.getUSER_ID());
		edituser.setPINYIN(GetPinyin.getPinYinHeadChar(edituser.getNAME()));
		
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
				String realName = FileUpload.copyFileAndBak(file.getInputStream(), PathUtil.getClasspath() + filepath,
						"", file.getOriginalFilename());
				
				String realfilepath = filepath+realName;
				edituser.setHEAD_PATH(realfilepath);
			}
		}
		
		userService.editU(edituser);	//执行修改
		
		FHLOG.save(Jurisdiction.getUsername(), "修改系统用户："+edituser.getUSERNAME());
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 批量删除
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteAllU")
	@ResponseBody
	public Object deleteAllU() throws Exception {
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"批量删除user");
		FHLOG.save(Jurisdiction.getUsername(), "批量删除user");
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String USER_IDS = pd.getString("USER_IDS");
		if(null != USER_IDS && !"".equals(USER_IDS)){
			String ArrayUSER_IDS[] = USER_IDS.split(",");
			userService.deleteAllU(ArrayUSER_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	/**导出用户信息到EXCEL
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		FHLOG.save(Jurisdiction.getUsername(), "导出用户信息到EXCEL");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			if(Jurisdiction.buttonJurisdiction(menuUrl, "cha")){
				String keywords = pd.getString("keywords");				//关键词检索条件
				if(null != keywords && !"".equals(keywords)){
					pd.put("keywords", keywords.trim());
				}
				String lastLoginStart = pd.getString("lastLoginStart");	//开始时间
				String lastLoginEnd = pd.getString("lastLoginEnd");		//结束时间
				if(lastLoginStart != null && !"".equals(lastLoginStart)){
					pd.put("lastLoginStart", lastLoginStart+" 00:00:00");
				}
				if(lastLoginEnd != null && !"".equals(lastLoginEnd)){
					pd.put("lastLoginEnd", lastLoginEnd+" 00:00:00");
				} 
				Map<String,Object> dataMap = new HashMap<String,Object>();
				List<String> titles = new ArrayList<String>();
				titles.add("用户名"); 		//1
				titles.add("编号");  		//2
				titles.add("姓名");			//3
				titles.add("职位");			//4
				titles.add("手机");			//5
				titles.add("邮箱");			//6
				titles.add("最近登录");		//7
				titles.add("上次登录IP");	//8
				dataMap.put("titles", titles);
				List<PageData> userList = userService.listAllUser(pd);
				List<PageData> varList = new ArrayList<PageData>();
				for(int i=0;i<userList.size();i++){
					PageData vpd = new PageData();
					vpd.put("var1", userList.get(i).getString("USERNAME"));		//1
					vpd.put("var2", userList.get(i).getString("NUMBER"));		//2
					vpd.put("var3", userList.get(i).getString("NAME"));			//3
					vpd.put("var4", userList.get(i).getString("ROLE_NAME"));	//4
					vpd.put("var5", userList.get(i).getString("PHONE"));		//5
					vpd.put("var6", userList.get(i).getString("EMAIL"));		//6
					vpd.put("var7", userList.get(i).getString("LAST_LOGIN"));	//7
					vpd.put("var8", userList.get(i).getString("IP"));			//8
					varList.add(vpd);
				}
				dataMap.put("varList", varList);
				ObjectExcelView erv = new ObjectExcelView();					//执行excel操作
				mv = new ModelAndView(erv,dataMap);
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**打开上传EXCEL页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goUploadExcel")
	public ModelAndView goUploadExcel()throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/user/uploadexcel");
		return mv;
	}
	
	/**下载模版
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/downExcel")
	public void downExcel(HttpServletResponse response)throws Exception{
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "Users.xls", "Users.xls");
	}
	
	/**从EXCEL导入到数据库
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/readExcel")
	public ModelAndView readExcel(
			@RequestParam(value="excel",required=false) MultipartFile file
			) throws Exception{
		FHLOG.save(Jurisdiction.getUsername(), "从EXCEL导入到数据库");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;}
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE;								//文件上传路径
			String fileName =  FileUpload.fileUp(file, filePath, "userexcel");							//执行上传
			List<PageData> listPd = (List)ObjectExcelRead.readExcel(filePath, fileName, 2, 0, 0);		//执行读EXCEL操作,读出的数据导入List 2:从第3行开始；0:从第A列开始；0:第0个sheet
			/*存入数据库操作======================================*/
			pd.put("RIGHTS", "");					//权限
			pd.put("LAST_LOGIN", "");				//最后登录时间
			pd.put("IP", "");						//IP
			pd.put("STATUS", "0");					//状态
			pd.put("SKIN", "default");				//默认皮肤
			pd.put("ROLE_ID", "1");
			List<Role> roleList = roleService.listAllRolesByPId(pd);//列出所有系统用户角色
			pd.put("ROLE_ID", roleList.get(0).getROLE_ID());		//设置角色ID为随便第一个
			/**
			 * var0 :编号
			 * var1 :姓名
			 * var2 :手机
			 * var3 :邮箱
			 * var4 :备注
			 */
			for(int i=0;i<listPd.size();i++){		
				pd.put("USER_ID", this.get32UUID());										//ID
				pd.put("NAME", listPd.get(i).getString("var1"));							//姓名
				
				String USERNAME = GetPinyin.getPingYin(listPd.get(i).getString("var1"));	//根据姓名汉字生成全拼
				pd.put("USERNAME", USERNAME);	
				if(userService.findByUsername(pd) != null){									//判断用户名是否重复
					USERNAME = GetPinyin.getPingYin(listPd.get(i).getString("var1"))+Tools.getRandomNum();
					pd.put("USERNAME", USERNAME);
				}
				pd.put("BZ", listPd.get(i).getString("var4"));								//备注
				if(Tools.checkEmail(listPd.get(i).getString("var3"))){						//邮箱格式不对就跳过
					pd.put("EMAIL", listPd.get(i).getString("var3"));						
					if(userService.findByUE(pd) != null){									//邮箱已存在就跳过
						continue;
					}
				}else{
					continue;
				}
				pd.put("NUMBER", listPd.get(i).getString("var0"));							//编号已存在就跳过
				pd.put("PHONE", listPd.get(i).getString("var2"));							//手机号
				
				pd.put("PASSWORD", new SimpleHash("SHA-1", "123456").toString());	//默认密码123456
				if(userService.findByUN(pd) != null){
					continue;
				}
				userService.saveU(pd);
			}
			/*存入数据库操作======================================*/
			mv.addObject("msg","success");
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	/**显示用户列表(弹窗选择用)
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listUsersForWindow")
	public ModelAndView listUsersForWindow(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String lastLoginStart = pd.getString("lastLoginStart");	//开始时间
		String lastLoginEnd = pd.getString("lastLoginEnd");		//结束时间
		if(lastLoginStart != null && !"".equals(lastLoginStart)){
			pd.put("lastLoginStart", lastLoginStart+" 00:00:00");
		}
		if(lastLoginEnd != null && !"".equals(lastLoginEnd)){
			pd.put("lastLoginEnd", lastLoginEnd+" 00:00:00");
		} 
		page.setPd(pd);
		List<PageData>	userList = userService.listUsersBystaff(page);	//列出用户列表(弹窗选择用)
		pd.put("ROLE_ID", "1");
		List<Role> roleList = roleService.listAllRolesByPId(pd);//列出所有系统用户角色
		mv.setViewName("system/user/window_user_list");
		mv.addObject("userList", userList);
		mv.addObject("roleList", roleList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	
	@RequestMapping(value="/goImport")
	public ModelAndView goImport() {
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/user/user_import");
		return mv;
	}
	
	/**
	 * 用户信息
	 * @param multipartFile
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/importData")
	@ResponseBody
	public Object importData(@RequestParam(value = "attachment", required = false) MultipartFile multipartFile) throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//找到模板路径，MultipartFile to File
		File file = FileUtils.changeMultipartFileToFile(multipartFile);
				
		//导入逻辑处理
		List<Map<String, Object>> list = FileUtils.importDataToMap(file);
		Map mapTemp;
		String bianma;
		String parentName;
		PageData findPd;
		for(int i = 0,j = list.size(); i < j; i++) {
			mapTemp = list.get(i);
			
			pd = new PageData();
			pd.put("DICTIONARIES_ID", this.get32UUID());	//人员信息表主键
			pd.put("USERNAME", mapTemp.get("账号"));         //登录账号
			pd.put("NAME", mapTemp.get("姓名"));             //用户名
			pd.put("PHONE", mapTemp.get("联系电话"));         //联系电话
			
			String companyName=mapTemp.get("所属公司名称").toString();       //所属公司名称
			String deptName=mapTemp.get("部门名称").toString();       //所属公司名称
			String position=mapTemp.get("").toString();       //所属公司名称
			
			
			
			pd.put("NAME_EN", GetPinyin.getPinYinHeadChar(myUtils.getStr(mapTemp, "名称")));
			
			//编码为null，不导入
			bianma = myUtils.getStr(mapTemp,"编码").trim();
			if(myUtils.isBlank(bianma))
				continue;
			
			//编码不唯一，不导入
			findPd = new PageData();
			findPd.put("BIANMA", bianma);
			//findPd = dictionariesService.findByBianma(findPd);
			if(myUtils.isNotNull(findPd))
				continue;
			
			pd.put("BIANMA", bianma);
			pd.put("ORDER_BY", mapTemp.get("排序"));
			pd.put("BZ", mapTemp.get("名称"));
			
			//父名称为null，不导入
			parentName = myUtils.getStr(mapTemp,"父名称").trim();
			if(myUtils.isBlank(parentName))
				continue;
			
			//父名称要有，才导入
			findPd = new PageData();
			findPd.put("NAME", parentName);
			//findPd = dictionariesService.findByName(findPd);
			if(myUtils.isNull(findPd))
				continue;
			
			pd.put("PARENT_ID", findPd.get("DICTIONARIES_ID"));
			//dictionariesService.save(pd);
		}
		
		//程序结束时，删除临时文件
		FileUtils.deleteFile(file);
		
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}

}
