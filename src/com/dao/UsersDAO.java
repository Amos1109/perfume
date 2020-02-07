package com.dao;

import com.po.Users;

public class UsersDAO {

	public boolean userLogin(Users u)
	{
		if("Marry".equals(u.getUsername())&&"123".equals(u.getPassword())) {
			return true;
		}
		else {
			return false;
		}
	}
}
