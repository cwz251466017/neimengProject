package com.fh.controller.fhoa.fhfile;

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
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.service.fhoa.companydepartmentpostuser.CompanyDepartmentPostUserManager;
import com.fh.service.fhoa.department.DepartmentManager;
import com.fh.service.fhoa.fhfile.FhfileManager;
import com.fh.service.system.user.UserManager;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.DelAllFile;
import com.fh.util.FileDownload;
import com.fh.util.FileUtil;
import com.fh.util.FileUtils;
import com.fh.util.GetPinyin;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import com.fh.util.PathUtil;
import com.fh.util.Tools;
import com.fh.util.myUtils;

/** 
 * 说明：文件管理
 * 创建人：FH Q313596790
 * 创建时间：2016-05-27
 */
@Controller
@RequestMapping(value="/fhfile")
public class FhfileController extends BaseController {
	
	String menuUrl = "fhfile/list.do"; //菜单地址(权限用)
	@Resource(name="fhfileService")
	private FhfileManager fhfileService;
	
	@Resource(name="departmentService")
	private DepartmentManager departmentService;   //部门
	
	@Resource(name="userService")
	private UserManager userService;//用户
	
	@Resource(name="companydepartmentpostuserService")
	private CompanyDepartmentPostUserManager companydepartmentpostuserService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Fhfile");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("FHFILE_ID", this.get32UUID());						//主键
		pd.put("CTIME", Tools.date2Str(new Date()));				//上传时间
		pd.put("USERNAME", Jurisdiction.getUsername());				//上传者
		pd.put("DEPARTMENT_ID", Jurisdiction.getDEPARTMENT_ID());	//部门ID
		pd.put("FILESIZE", FileUtil.getFilesize(PathUtil.getClasspath() + Const.FILEPATHFILEOA + pd.getString("FILEPATH")));	//文件大小
		fhfileService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Fhfile");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = fhfileService.findById(pd);
		fhfileService.delete(pd);
		DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHFILEOA + pd.getString("FILEPATH")); //删除文件
		out.write("success");
		out.close();
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Fhfile");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String item = Jurisdiction.getDEPARTMENT_IDS();
		if("0".equals(item) || "无权".equals(item)){
			pd.put("item","");		//根据部门ID过滤
		}else{
			pd.put("item", item.replaceFirst("\\(", "\\('"+Jurisdiction.getDEPARTMENT_ID()+"',"));
		}
		page.setPd(pd);
		List<PageData>	varList = fhfileService.list(page);		//列出Fhfile列表
		mv.setViewName("fhoa/fhfile/fhfile_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());				//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("fhoa/fhfile/fhfile_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Fhfile");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			PageData fpd = new PageData();
			for(int i=0;i<ArrayDATA_IDS.length;i++){
				fpd.put("FHFILE_ID", ArrayDATA_IDS[i]);
				fpd = fhfileService.findById(fpd);
				DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHFILEOA + fpd.getString("FILEPATH")); //删除物理文件
			}
			fhfileService.deleteAll(ArrayDATA_IDS);		//删除数据库记录
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	/**下载
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/download")
	public void downExcel(HttpServletResponse response)throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = fhfileService.findById(pd);
		String fileName = pd.getString("FILEPATH");
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILEOA + fileName, pd.getString("NAME")+fileName.substring(19, fileName.length()));
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
	@RequestMapping(value="/goImport")
	public ModelAndView goImport() {
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("fhoa/fhfile/fhfile_import");
		return mv;
	}
	
	
	/**
	 * 信息导入，人员基本信息，职位信息，公司与部门信息
	 * @param multipartFile
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/importData")
	@ResponseBody
	public Object importData(@RequestParam(value = "attachment", required = false) MultipartFile multipartFile,@RequestParam(value = "fileType", required = false) String fileType) throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//找到模板路径，MultipartFile to File
		File file = FileUtils.changeMultipartFileToFile(multipartFile);
				
		//导入逻辑处理
		List<Map<String, Object>> list = FileUtils.importDataToMap(file);
		Map mapTemp;
		String bianma;
		String parentName;
		String parentId=null;
		String name;
		PageData findPd;
		PageData pageDataResult;
		String fatherDepartmentName;
		String headFatherDeptName=null;
		String headGrandFatherDeptName=null;
		String gfFatherStr=null;
		PageData isHasPosition;
		PageData positonDetail=new PageData();
		String highestDepartmentId=null;             //顶级节点
		String highestDepartmentName=null;           //顶级部门名称
		
		//人员导入使用 
		String userName;//登录账号
        String trueName;//真实姓名
        String phone;
        String companyDetail;//公司部门信息
        String positionName;
		String isPlaceTop;//是否置顶，1表示需要置顶
		String isPlaceTopLevel;//置顶顺序
		String email;
		String workNo;//员工编号
		String certNo;//身份证号码
		String workPhone;//办公电话
		User user=new User();
		PageData isHasUser;
		String userCompanyId=null;
		String userDepId=null;
		String userPositionId=null;
		String userCompanyName=null;
		String userDepName=null;
		String userPositionName=null;
		String positionComDepName=null;  //职位所属公司与部门
		
		for(int i = 0,j = list.size(); i < j; i++) {
			mapTemp = list.get(i);
			
			findPd = new PageData();
			
			//判断是何种类型的数据导入
			if(fileType.equals("1")) {//公司部门信息
				parentName=mapTemp.get("上级部门")==null?null:mapTemp.get("上级部门").toString();
				if(null!=parentName) {
					PageData paramPd=new PageData();
					paramPd.put("NAME", parentName);
					paramPd=departmentService.findDepartmentDetailByName(paramPd);
					parentId=paramPd.getString("DEPARTMENT_ID");
				}
				bianma=mapTemp.get("部门排序号").toString();
				name= mapTemp.get("部门名称").toString();
				findPd.put("BIANMA", bianma);
				//根据编码查询部门
				pageDataResult=departmentService.findByBianma(findPd);
				PageData paramData = new PageData(); 
				  paramData.put("BIANMA", "OA000000");//内蒙交投代码
				  paramData=departmentService.findHighestDepartmentDetail(paramData);//查询顶级节点信息
				highestDepartmentId=paramData.getString("DEPARTMENT_ID");
				highestDepartmentName =paramData.getString("NAME");
				if(null==pageDataResult) {//插入部门
					pageDataResult=new PageData();
					pageDataResult.put("DEPARTMENT_ID", this.get32UUID());
					pageDataResult.put("NAME", name);
					pageDataResult.put("BIANMA", bianma);
					pageDataResult.put("PARENT_ID", parentId==null?highestDepartmentId:parentId);
					pageDataResult.put("IS_VALUE", 0);
					pageDataResult.put("CREATE_TIME", DateUtil.getTime());
					pageDataResult.put("PARENT_NAME", parentName==null?highestDepartmentName:parentName);
					pageDataResult.put("TYPE", parentName==null?"DT001001":"DT001002");
					pageDataResult.put("IS_STATE", 1);					
					departmentService.save(pageDataResult);
				}else {//更新数据
					pageDataResult.put("NAME", name);
					pageDataResult.put("BIANMA", bianma);
					pageDataResult.put("PARENT_ID", parentId==null?highestDepartmentId:parentId);
					pageDataResult.put("UPDATE_TIME", DateUtil.getTime());
					pageDataResult.put("TYPE", parentName==null?"DT001001":"DT001002");
					pageDataResult.put("PARENT_NAME", parentName==null?highestDepartmentName:parentName);
					departmentService.edit(pageDataResult);
				}
				continue;
				
			}else if(fileType.equals("2")) {//职位信息
				name=mapTemp.get("职位名称")==null?null:mapTemp.get("职位名称").toString();
				if(myUtils.isBlank(name))
					continue;
				fatherDepartmentName=mapTemp.get("职位所属部门名称")==null?null:mapTemp.get("职位所属部门名称").toString();
				if(myUtils.isBlank(fatherDepartmentName))
					continue;
				
				String[] fatherDepartmentArray=fatherDepartmentName.split("\\\\");
				headFatherDeptName=fatherDepartmentArray[fatherDepartmentArray.length-1];
				headGrandFatherDeptName=null;//重新初始化爷级上级
				if(fatherDepartmentArray.length>2)
					headGrandFatherDeptName=fatherDepartmentArray[fatherDepartmentArray.length-2];
				
				//拼凑爷级+父级上级
				gfFatherStr=(headGrandFatherDeptName==null?"":"\\"+headGrandFatherDeptName)+"\\"+headFatherDeptName;
				
				//根据职位名称       职位所属公司部门查询职位是否已经存在
				positonDetail.put("NAME", name);
				positonDetail.put("PARENT_NAME", gfFatherStr);
				isHasPosition =departmentService.findDepartmentDetailByNameAndParentName(positonDetail);
				if(null ==isHasPosition) {//插入数据
					PageData paramPd=new PageData();
					paramPd.put("PARENT_NAME", headGrandFatherDeptName); //父公司或者父部门名称
					paramPd.put("NAME", headFatherDeptName);
					paramPd=departmentService.findDepartmentDetailByNameAndParentName(paramPd);
					parentId=paramPd.getString("DEPARTMENT_ID");
					//职位信息插入
					pageDataResult=new PageData();
					pageDataResult.put("DEPARTMENT_ID", this.get32UUID());
					pageDataResult.put("NAME", name);
					pageDataResult.put("PARENT_ID", parentId);
					pageDataResult.put("IS_VALUE", 0);
					pageDataResult.put("CREATE_TIME", DateUtil.getTime());
					pageDataResult.put("PARENT_NAME", gfFatherStr);
					pageDataResult.put("IS_STATE", 1);
					pageDataResult.put("TYPE", "DT001003");//职位类型
					departmentService.save(pageDataResult);
				}
				continue;
			}else if(fileType.equals("3")) {//人员信息
				
				String userId="";
				userName=myUtils.isObjectNullReturnNull(mapTemp.get("账号"));
				trueName=myUtils.isObjectNullReturnNull(mapTemp.get("姓名"));
				phone=myUtils.isObjectNullReturnNull(mapTemp.get("联系电话"));
				companyDetail=myUtils.isObjectNullReturnNull(mapTemp.get("所属公司名称"));
				positionName=myUtils.isObjectNullReturnNull(mapTemp.get("职位名称"));
				isPlaceTop=myUtils.isObjectNullReturnNull(mapTemp.get("置顶1"));
				if(null==isPlaceTop) 
					isPlaceTop="0";
				if(!isPlaceTop.equals("1"))
					isPlaceTop="0";
				if(isPlaceTop.equals("1"))
					isPlaceTop="1";
				isPlaceTopLevel=myUtils.isObjectNullReturnNull(mapTemp.get("置顶顺序"));
				email=myUtils.isObjectNullReturnNull(mapTemp.get("邮箱地址"));
				workNo=myUtils.isObjectNullReturnNull(mapTemp.get("员工编号"));
				certNo=myUtils.isObjectNullReturnNull(mapTemp.get("身份证号码"));
				workPhone=myUtils.isObjectNullReturnNull(mapTemp.get("办公电话"));
				workPhone=workPhone==null?null:(workPhone.equals("无")?"":workPhone);
				if(null==userName||null==companyDetail||null==positionName)
					continue;
				
				
				//插入用户公司，部门，职位信息
				String[] companyDetailArray=companyDetail.split("\\\\");
				userPositionName=positionName;
				if(companyDetailArray.length>2) {
					userCompanyName=companyDetailArray[companyDetailArray.length-2];
					userDepName=companyDetailArray[companyDetailArray.length-1];
					positionComDepName="\\"+userCompanyName+"\\"+userDepName;
					
				}else {//用户直接挂钩一级公司
					userCompanyName=companyDetailArray[1];
					userDepName=null;
					positionComDepName="\\"+userCompanyName;
					
				}
				//查询公司信息
				PageData companyParamPd=new PageData();
				companyParamPd.put("NAME", userCompanyName);
				companyParamPd=departmentService.findDepartmentDetailByName(companyParamPd);//公司名唯一，可通过名称查询
				if(null==companyParamPd)
					throw new Exception("公司名:"+userCompanyName+"尚未存在");
				userCompanyId=companyParamPd.getString("DEPARTMENT_ID");
				//查询部门信息
				PageData deptParamPd=new PageData();
				if(null==userDepName) {//用户直接挂靠一级公司,改公司下面没部门
					userDepId=userCompanyId;
					
				}else {
					deptParamPd.put("PARENT_NAME", userCompanyName); 
					deptParamPd.put("NAME", userDepName);
					deptParamPd=departmentService.findDepartmentDetailByNameAndParentName(deptParamPd);
					userDepId=deptParamPd.getString("DEPARTMENT_ID");	
				}
					
				//查询职位信息
				PageData positionParamPd=new PageData();
				positionParamPd.put("PARENT_NAME", positionComDepName); //父公司或者父部门名称
				positionParamPd.put("NAME", positionName);
				positionParamPd=departmentService.findDepartmentDetailByNameAndParentName(positionParamPd);
				if(null==positionParamPd)
					throw new Exception(positionComDepName+"下的职位："+positionName+"尚未存在");
				userPositionId=positionParamPd.getString("DEPARTMENT_ID");
				
				
				//根据账号查询用户信息
				user.setUSERNAME(userName);
				isHasUser=userService.findByUsername(user);
				user.setUSERNAME(userName);
				user.setNAME(trueName);
				user.setPHONE(phone);
				user.setIS_PLACE_TOP(isPlaceTop);
				user.setSORT_LEVEL(isPlaceTopLevel==null?null:Integer.valueOf(isPlaceTopLevel));
				user.setEMAIL(email);
				user.setNUMBER(workNo);
				user.setID_CARD(certNo);
				user.setTEL(workPhone);
				user.setPINYIN(GetPinyin.getPinYinHeadChar(userName));
				user.setHEAD_PIN_YIN(user.getPINYIN().substring(0,1));
				user.setCOMPANY_ID(userCompanyId);
				user.setPOST_ID(userPositionId);
				user.setDEPARTMENT_ID(userDepId);
				user.setROLE_ID("3e98d146b7cc43e9952da535e0d5f6ae");
				user.setHEAD_PATH("../uploadFiles/userHeadImage/"+userName+".jpg");
				user.setJOB_STATE(1);
				user.setIS_VALUE(0);
				user.setSTATUS("0");
				if(null==isHasUser) {//首次添加用户信息
					userId=this.get32UUID();
					user.setUSER_ID(userId);
					user.setPASSWORD(new SimpleHash("SHA-1","123456").toString());
					userService.saveU(user);//插入用户信息
					
				}else {//更新用户信息
					userId=isHasUser.getString("USER_ID");
					user.setUSER_ID(userId);
					userService.editU(user);
				}
				
				
				
				PageData isHasSamePosiPd = new PageData();
				isHasSamePosiPd.put("USER_ID", userId);
				isHasSamePosiPd.put("POST_ID", userPositionId);
				isHasSamePosiPd.put("COMPANY_ID", userCompanyId);
				isHasSamePosiPd.put("DEPARTMENT_ID", userDepId);
				isHasSamePosiPd = companydepartmentpostuserService.findByComDeptPostUserId(isHasSamePosiPd);
				
				//当前职位已存在，跳过插入
				if(myUtils.isNotNull(isHasSamePosiPd))
					continue;
				
				List<PageData> isPersionHasPositionList = new ArrayList<PageData>();
				PageData isPersionHasPosition = new PageData();
				isPersionHasPosition.put("USER_ID", userId);
				isPersionHasPositionList = companydepartmentpostuserService.findByUserId(isPersionHasPosition);
				
				
					//公司部门职位用户关系表
					pd.put("COMPANYDEPARTMENTPOSTUSER_ID", this.get32UUID());
					pd.put("COMPANY_ID", userCompanyId);
					pd.put("DEPARTMENT_ID", userDepId);
					pd.put("POST_ID", userPositionId);
					pd.put("USER_ID", userId);
					pd.put("POSITION_TYPE", isPersionHasPositionList==null?1:isPersionHasPositionList.size()+1);
			        pd.put("POSITION_NAME", positionName);
					companydepartmentpostuserService.save(pd);
				
				
				continue;
			}
			
		}
		
		//程序结束时，删除临时文件
		FileUtils.deleteFile(file);
		
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
}
