package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entity.items;
import util.DBHelper;

public class itemsDAO {
	public ArrayList<items> getAllitems() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<items> list = new ArrayList<items>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select*from perfume;";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				items item = new items();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setEngname(rs.getString("engname"));
				item.setBrand(rs.getString("brand"));
				item.setPrice(rs.getInt("price"));
				item.setPhoto(rs.getString("photo"));
				item.setDesc(rs.getString("desc"));
				item.setStock(rs.getInt("stock"));
				list.add(item);
			}
			return list;
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
	
	public items getitemsById(int id) {
		
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			conn=DBHelper.getConnection();
			String sql="select*from perfume where id=?;";
			stmt=conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs=stmt.executeQuery();
			if(rs.next()) {
				items item = new items();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setEngname(rs.getString("engname"));
				item.setBrand(rs.getString("brand"));
				item.setPrice(rs.getInt("price"));
				item.setPhoto(rs.getString("photo"));
				item.setDesc(rs.getString("desc"));
				item.setStock(rs.getInt("stock"));
				return item;
			}
			else {
				return null;
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
		finally {
			if(rs!=null) {
				try {
					rs.close();
					rs=null;
				}
				catch (Exception ex) {
				ex.printStackTrace();
				}
			}
			if(stmt!=null) {
				try {
					stmt.close();
					stmt=null;
				}
				catch (Exception ex) {
				ex.printStackTrace();
				}
			}
		}
	}
}
