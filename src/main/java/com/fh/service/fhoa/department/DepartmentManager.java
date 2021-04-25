package com.fh.service.fhoa.department;

import java.util.List;

import com.fh.entity.Page;
import com.fh.entity.system.Department;
import com.fh.util.PageData;

/** 
 * 说明： 组织机构接口类
 * 创建人：FH Q313596790
 * 创建时间：2015-12-16
 * @version
 */
public interface DepartmentManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	String findParentDepartmentById(String departmentId)throws Exception;
	
	PageData findCompanyByParentDeparementIds(PageData pd)throws Exception;
	
	List<PageData> findDepartmentByParentDeparementIds(PageData pd)throws Exception;
	
	List<PageData> findChildrenDepartmentById(PageData pd)throws Exception;
	
	List<PageData> findDepartmentTypeByIdLikeName(PageData pd)throws Exception;
	
	/**通过编码获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByBianma(PageData pd)throws Exception;
	
	/**
	 * 通过ID获取其子级列表
	 * @param parentId
	 * @return
	 * @throws Exception
	 */
	public List<Department> listSubDepartmentByParentId(String parentId) throws Exception;
	
	/**
	 * 获取所有数据并填充每条数据的子级列表(递归处理)
	 * @param MENU_ID
	 * @return
	 * @throws Exception
	 */
	public List<Department> listAllDepartment(String parentId) throws Exception;
	
	/**
	 * 获取所有数据并填充每条数据的子级列表(递归处理)下拉ztree用
	 * @param MENU_ID
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllDepartmentToSelect(String parentId, List<PageData> zdepartmentPdList) throws Exception;
	
	/**获取某个部门所有下级部门ID(返回拼接字符串 in的形式)
	 * @param DEPARTMENT_ID
	 * @return
	 * @throws Exception
	 */
	public String getDEPARTMENT_IDS(String DEPARTMENT_ID) throws Exception;
	
	/**
	 * 通过公司名称查找公司信息，仅适用于公司，因存在同名部门，不适合部门使用
	 */
	public PageData findDepartmentDetailByName(PageData pd)throws Exception;
	
	/**
	 * 根据名称   及上級名称查询信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findDepartmentDetailByNameAndParentName(PageData pd)throws Exception;

	/**
	 * 查找公司列表
	 * @return
	 */
	public List<PageData> findCompanyList(PageData pd)throws Exception;
	
	/**
	 * 查询顶级节点信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findHighestDepartmentDetail(PageData pd) throws Exception;

	
	
}

