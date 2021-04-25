package com.fh.service.fhoa.companydepartmentpostuser.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.fhoa.companydepartmentpostuser.CompanyDepartmentPostUserManager;

/** 
 * 说明： 公司职位用户关系表
 * 创建人：FH Q313596790
 * 创建时间：2019-05-30
 * @version
 */
@Service("companydepartmentpostuserService")
public class CompanyDepartmentPostUserService implements CompanyDepartmentPostUserManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("CompanyDepartmentPostUserMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("CompanyDepartmentPostUserMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("CompanyDepartmentPostUserMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("CompanyDepartmentPostUserMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("CompanyDepartmentPostUserMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("CompanyDepartmentPostUserMapper.findById", pd);
	}
	
	public PageData findByIdCOMPANYDEPARTMENTPOSTUSER_ID(PageData pd)throws Exception{
		return (PageData)dao.findForObject("CompanyDepartmentPostUserMapper.findByIdCOMPANYDEPARTMENTPOSTUSER_ID", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("CompanyDepartmentPostUserMapper.deleteAll", ArrayDATA_IDS);
	}

	/**
	 * 根据公司id，部门id，用户id，职位id去查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByComDeptPostUserId(PageData pd) throws Exception {
		
		return (PageData)dao.findForObject("CompanyDepartmentPostUserMapper.findByComDeptPostUserId", pd);
	}

	/**
	 * 根据用户id去查询
	 */
	public List<PageData> findByUserId(PageData pd) throws Exception {
		
		return (List<PageData>)dao.findForList("CompanyDepartmentPostUserMapper.findByUserId", pd);
	}

	/**
	 * 根据用户id，职位类别，删除职位信息
	 */
	public void deleteByUserIdAPosiType(PageData pd) throws Exception {
		dao.delete("CompanyDepartmentPostUserMapper.deleteByUserIdAPosiType", pd);
	}
	
}

