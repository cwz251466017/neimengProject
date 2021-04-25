package com.fh.controller.app.login;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.controller.base.BaseController;
import com.fh.entity.app.AppConst;
import com.fh.entity.app.AppLoginUserVo;
import com.fh.entity.app.AppUser;
import com.fh.entity.app.AppUserDetails;
import com.fh.entity.app.AppUserPermissions;
import com.fh.service.system.user.UserManager;
import com.fh.util.DateUtil;
import com.fh.util.PageData;
import com.fh.util.myUtils;
/**
 * APP用户登录总入口
 * @author fh QQ 3 1 3 5 9 6 7 9 0[青苔]
 * 修改日期：2015/11/2
 */
/**
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value="/app/login")
public class AppLoginController extends BaseController {

	@Resource(name="userService")
	private UserManager userService;
	

	/**APP请求登录，验证用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login" ,method = RequestMethod.POST)
	@ResponseBody
	public Object login(@RequestBody AppUser loginUser)throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		PageData pd2 = new PageData();
		AppLoginUserVo appLoginUserVo = new AppLoginUserVo();
		
		try {
			//String passwd = new SimpleHash("SHA-1", loginUser.getAccount(), loginUser.getPassword()).toString();	//密码加密
			//String passwd = new SimpleHash("SHA-1", loginUser.getPassword()).toString();
			String passwd =loginUser.getPassword();
			String one= new SimpleHash("SHA-1", "1").toString();
			pd2.put("USERNAME", loginUser.getAccount());
			pd2.put("PASSWORD", passwd);
			PageData pd = userService.getAppUserByNameAndPwd(pd2);	//根据用户名和密码去读取用户信息
			if(pd != null){
				pd.put("LAST_LOGIN",DateUtil.getTime().toString());
				userService.updateLastLogin(pd);
			}
			AppUser appUser = new AppUser();
			appUser.setAccount(loginUser.getAccount());
			appUser.setUserName(pd.get("USERNAME").toString());
			appUser.setUserId(pd.get("USER_ID").toString());
			appLoginUserVo.setUser(appUser);
			appLoginUserVo.setToken("Token11111111111");
			List<AppUserPermissions> appUserPermissionsList = new ArrayList<AppUserPermissions>();
			AppUserPermissions appUserPermissions = new AppUserPermissions();
			appUserPermissions.setId("111");
			appUserPermissions.setCode("111");
			appUserPermissionsList.add(appUserPermissions);
			appUserPermissions = new AppUserPermissions();
			appUserPermissions.setId("222");
			appUserPermissions.setCode("222");
			appUserPermissionsList.add(appUserPermissions);
			appLoginUserVo.setPermissions(appUserPermissionsList);
			AppUserDetails appUserDetails = new AppUserDetails();
			
			appUserDetails.setGroupId(pd.get("DEPARTMENT_ID").toString());
			appUserDetails.setUserId(null);
			appUserDetails.setContactId(pd.get("USER_ID").toString());
			appUserDetails.setName(pd.get("NAME").toString());
			
			appUserDetails.setSex(myUtils.isObjectNullReturnNull(pd.get("SEX")));
			appUserDetails.setBorn(myUtils.isObjectNullReturnNull(pd.get("BIRTHDAY")));
			appUserDetails.setIdNo(myUtils.isObjectNullReturnNull(pd.get("ID_CARD")));
			appUserDetails.setIcon(myUtils.isObjectNullReturnNull(pd.get("HEAD_PATH")));
			
			appUserDetails.setJobState(myUtils.isObjectNullReturnNull(pd.get("JOB_STATE")));
			appUserDetails.setUnitId(myUtils.isObjectNullReturnNull(pd.get("COMPANY_ID")));
			appUserDetails.setUnit(myUtils.isObjectNullReturnNull(pd.get("COMPANY_NAME")));
			appUserDetails.setDeptId(myUtils.isObjectNullReturnNull(pd.get("DEPARTMENT_ID")));
			appUserDetails.setDept(myUtils.isObjectNullReturnNull(pd.get("DEPARTMENT_NAME")));
			//appUserDetails.setPosition(myUtils.isObjectNullReturnNull(pd.get("POST_NAME")));
			//查询用户职位信息
			PageData userPosPd = new PageData();
			userPosPd.put("USER_ID", pd.get("USER_ID").toString());
			List<PageData> userPositionListPd = userService.getUserPositionListByUserId(userPosPd);
			StringBuilder positonName=new StringBuilder();
			//根据用户名和密码去读取用户信息
			for(int i= 0;i<userPositionListPd.size();i++) {
				userPosPd=userPositionListPd.get(i);
				positonName=positonName.append(",").append(userPosPd.get("POSITION_NAME").toString());
						
			}
			
			if(userPositionListPd.size() >0) {
			   appUserDetails.setPosition(positonName.toString().substring(1));
			}else {
			   appUserDetails.setPosition("");
			}
			appUserDetails.setMobile(myUtils.isObjectNullReturnNull(pd.get("PHONE")));
			appUserDetails.setTel(myUtils.isObjectNullReturnNull(pd.get("TEL")));
			appUserDetails.setWx(myUtils.isObjectNullReturnNull(pd.get("WEIXIN")));
			appUserDetails.setEmail(myUtils.isObjectNullReturnNull(pd.get("EMAIL")));
			appUserDetails.setAddress(myUtils.isObjectNullReturnNull(pd.get("ADDRESS")));
			appLoginUserVo.setDetails(appUserDetails);
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "帐号异常，请联系管理员");
			return map;
		}
		
		return appLoginUserVo;
	}
	
}
