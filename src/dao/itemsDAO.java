package dao;

import java.sql.Connection;


import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;



import entity.items;

import util.JDBCTools;

public class itemsDAO {
	public ArrayList<items> getAllitems() {
		Connection connection = null;
		ArrayList<items> list=null;
		try {
			connection=JDBCTools.getConnection();
			String sql = "select*from perfume;";
			QueryRunner queryRunner =new QueryRunner();
			list=(ArrayList<items>)queryRunner.query(connection, sql,new BeanListHandler<>(items.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	
	
	public items getitemsById(int id) {
		Connection connection=null;
		items item=null;
		try {
			connection=JDBCTools.getConnection();
			String sql="select*from perfume where id=?;";
			QueryRunner queryRunner=new QueryRunner();
			item = queryRunner.query(connection,sql,new BeanHandler<>(items.class),id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return item;
	}

}
