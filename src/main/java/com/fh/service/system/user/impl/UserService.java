package com.fh.service.system.user.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.service.system.user.UserManager;
import com.fh.util.PageData;


/** 系统用户
 * @author fh313596790qq(青苔)
 * 修改时间：2015.11.2
 */
@Service("userService")
public class UserService implements UserManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**登录判断
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getUserByNameAndPwd(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserMapper.getUserInfo", pd);
	}
	
	public PageData getAppUserByNameAndPwd(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserMapper.getAppUserByNameAndPwd", pd);
	}
	
	public List<PageData> findUserByCompanyId(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UserMapper.findUserByCompanyId", pd);
	}
	
	public List<PageData> findUserByDepartmentId(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UserMapper.findUserByDepartmentId", pd);
	}
	
	public List<PageData> findUserByPostId(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UserMapper.findUserByPostId", pd);
	}
	
	/**更新登录时间
	 * @param pd
	 * @throws Exception
	 */
	public void updateLastLogin(PageData pd)throws Exception{
		dao.update("UserMapper.updateLastLogin", pd);
	}
	
	/**通过用户ID获取用户信息和角色信息
	 * @param USER_ID
	 * @return
	 * @throws Exception
	 */
	public User getUserAndRoleById(String USER_ID) throws Exception {
		return (User) dao.findForObject("UserMapper.getUserAndRoleById", USER_ID);
	}
	
	/**通过USERNAEME获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByUsername(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserMapper.findByUsername", pd);
	}
	
	public PageData findByUsername(User user)throws Exception{
		return (PageData)dao.findForObject("UserMapper.findByUsernamePo", user);
	}
	
	/**列出某角色下的所有用户
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAllUserByRoldId(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UserMapper.listAllUserByRoldId", pd);
		
	}
	
	/**保存用户IP
	 * @param pd
	 * @throws Exception
	 */
	public void saveIP(PageData pd)throws Exception{
		dao.update("UserMapper.saveIP", pd);
	}
	
	/**用户列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listUsers(Page page)throws Exception{
		return (List<PageData>) dao.findForList("UserMapper.userlistPage", page);
	}
	
	public List<PageData> listUsers(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("UserMapper.listUsers", pd);
	}
	
	/**用户列表(弹窗选择用)
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listUsersBystaff(Page page)throws Exception{
		return (List<PageData>) dao.findForList("UserMapper.userBystafflistPage", page);
	}
	
	/**通过邮箱获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByUE(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserMapper.findByUE", pd);
	}
	
	/**通过手机号获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByUP(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserMapper.findByUP", pd);
	}
	
	/**通过编号获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByUN(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserMapper.findByUN", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserMapper.findById", pd);
	}
	
	public User findByIdPo(PageData pd)throws Exception{
		return (User)dao.findForObject("UserMapper.findByIdPo", pd);
	}
	
	/**保存用户
	 * @param pd
	 * @throws Exception
	 */
	public void saveU(PageData pd)throws Exception{
		dao.save("UserMapper.saveU", pd);
	}
	
	public void saveU(User user)throws Exception{
		dao.save("UserMapper.saveUPo", user);
	}
	 
	/**修改用户
	 * @param pd
	 * @throws Exception
	 */
	public void editU(PageData pd)throws Exception{
		dao.update("UserMapper.editU", pd);
	}
	
	public void editU(User user)throws Exception{
		dao.update("UserMapper.editUPo", user);
	}
	
	/**删除用户
	 * @param pd
	 * @throws Exception
	 */
	public void deleteU(PageData pd)throws Exception{
		dao.delete("UserMapper.deleteU", pd);
	}
	
	/**批量删除用户
	 * @param USER_IDS
	 * @throws Exception
	 */
	public void deleteAllU(String[] USER_IDS)throws Exception{
		dao.delete("UserMapper.deleteAllU", USER_IDS);
	}
	
	/**用户列表(全部)
	 * @param USER_IDS
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAllUser(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("UserMapper.listAllUser", pd);
	}
	
	/**获取总数
	 * @param pd
	 * @throws Exception
	 */
	public PageData getUserCount(String value)throws Exception{
		return (PageData)dao.findForObject("UserMapper.getUserCount", value);
	}

	/**
	 * 查询集团下所有用户的信息
	 */
	public List<PageData> findUserByTopCompany(PageData pd) throws Exception {
		
		return (List<PageData>) dao.findForList("UserMapper.findUserByTopCompany", pd);
	}

	/**
	 * 查询员工职位信息
	 */
	public List<PageData> getUserPositionListByUserId(PageData pd) throws Exception {
		
		return (List<PageData>) dao.findForList("UserMapper.getUserPositionListByUserId", pd);
	}

	/**
	 * 根据用户名 进行用户信息模糊查询
	 */
	public List<PageData> findUserByLikeUserName(PageData pd) throws Exception{
		
		return (List<PageData>) dao.findForList("UserMapper.findUserByLikeUserName", pd);
	}
	
}
