package com.fh.controller.app.department;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.controller.base.BaseController;
import com.fh.entity.app.AppContactVo;
import com.fh.service.fhoa.department.DepartmentManager;
import com.fh.service.system.dictionaries.DictionariesManager;
import com.fh.service.system.user.UserManager;
import com.fh.util.PageData;

/** 
 * APP公司部门职位
 */
@Controller
@RequestMapping(value="/app/contact")
public class AppDepartmentController extends BaseController {
	
	@Resource(name="departmentService")
	private DepartmentManager departmentService;
	
	@Resource(name="dictionariesService")
	private DictionariesManager dictionariesService;
	
	@Resource(name="userService")
	private UserManager userService;
	
	@RequestMapping(value="/find" ,produces="application/json;charset=UTF-8", method = RequestMethod.GET)
	@ResponseBody
	public Object find(String groupId)throws Exception{
		
		AppContactVo appContactVo = new AppContactVo();
		//修改通讯逻辑，登录进去获取全集团的所有公司
		
		 PageData paramData = new PageData(); 
		 paramData.put("BIANMA", "OA000000");//内蒙交投代码
		 paramData=departmentService.findHighestDepartmentDetail(paramData);//查询顶级节点信息
		 groupId=paramData.getString("DEPARTMENT_ID");
		 
		appContactVo = findSubDepartment(groupId);
		List<AppContactVo> AppContactVoList = new ArrayList<AppContactVo>();
		AppContactVoList.add(appContactVo);
		
		return AppContactVoList;
	}
	
	/**
	 * 递归找到公司下的所有部门职位
	 * @param groupId
	 * @return
	 * @throws Exception
	 */
	private AppContactVo findSubDepartment(String groupId) throws Exception {
		
		//找到自己的信息和下级信息
		AppContactVo appContactVo = new AppContactVo();
		PageData pd = new PageData();
		pd.put("DEPARTMENT_ID", groupId);
		PageData department = departmentService.findById(pd);
		
		
			//找等级
			appContactVo.setGroupId(groupId);
			appContactVo.setGroupName(department.get("NAME").toString());
			String ParentDepartmentIds =  departmentService.findParentDepartmentById(groupId);
			String[] ParentDepartmentIdsArray = ParentDepartmentIds.split(",");
			appContactVo.setLevel(String.valueOf(ParentDepartmentIdsArray.length-2));
			
			
			List<AppContactVo> AppContactVoList = new ArrayList<AppContactVo>();
			if("DT001001".equals(department.get("TYPE").toString())) {//只有公司才查询下级节点
				//查找儿子
				List<PageData> childrenDepartmentList = departmentService.findChildrenDepartmentById(pd);
					for (PageData pageData : childrenDepartmentList) {
						AppContactVoList.add(findSubDepartment(pageData.get("DEPARTMENT_ID").toString()));
					
					}
			}
			appContactVo.setChildren(AppContactVoList);
		
		return appContactVo;
	}
}
