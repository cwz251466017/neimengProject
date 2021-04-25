package com.fh.service.fhoa.companydepartmentpostuser;

import java.util.List;
import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明： 公司职位用户关系表接口
 * 创建人：FH Q313596790
 * 创建时间：2019-05-30
 * @version
 */
public interface CompanyDepartmentPostUserManager{

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
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	PageData findByIdCOMPANYDEPARTMENTPOSTUSER_ID(PageData pd)throws Exception;
	
	/**
	 * 根据公司id，部门id，用户id，职位id去查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByComDeptPostUserId(PageData pd)throws Exception;
	
	/**
	 * 根据用户id去查询
	 */
	public List<PageData> findByUserId(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;

	/**
	 * 根据用户id，职位类型，删除职务信息
	 * @param delCompanyDepartmentPostUser
	 */
	public void deleteByUserIdAPosiType(PageData delCompanyDepartmentPostUser) throws Exception;
	
}

