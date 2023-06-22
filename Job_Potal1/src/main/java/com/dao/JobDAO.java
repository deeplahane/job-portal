package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entities.Jobs;

public class JobDAO {
	private Connection conn;

	public JobDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addJob(Jobs j) {
		boolean f = false;

		try {

			String query = "INSERT INTO jobs(title,description,location,category,status) VALUES(?,?,?,?,?);";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, j.getTitle());
			pst.setString(2, j.getDescription());
			pst.setString(3, j.getLocation());
			pst.setString(4, j.getCategory());
			pst.setString(5, j.getStatus());

			int v = pst.executeUpdate();

			if (v == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Jobs> getAllJobs() {
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;
		
		try {
			
			String query="SELECT * FROM jobs ORDER BY id desc";
			PreparedStatement pst=conn.prepareStatement(query);
			
			ResultSet rs= pst.executeQuery();
			
			while(rs.next()) {
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setLocation(rs.getString(4));
				j.setCategory(rs.getString(5));
				j.setStatus(rs.getString(6));
				j.setPdate(rs.getString(7)+"");
				list.add(j);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public Jobs getJobById(int id) {
		Jobs j = null;
		
		try {
			
			String query="SELECT * FROM jobs WHERE id=?";
			PreparedStatement pst=conn.prepareStatement(query);
			pst.setInt(1, id);
			ResultSet rs= pst.executeQuery();
			
			while(rs.next()) {
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setLocation(rs.getString(4));
				j.setCategory(rs.getString(5));
				j.setStatus(rs.getString(6));
				j.setPdate(rs.getString(7)+"");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}

		return j;
	}
	
	public boolean updateJob(Jobs j) {
		boolean f = false;
		try {

			String query = "UPDATE jobs set title=?,description=?,location=?,category=?,status=? WHERE id=?;";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, j.getTitle());
			pst.setString(2, j.getDescription());
			pst.setString(3, j.getLocation());
			pst.setString(4, j.getCategory());
			pst.setString(5, j.getStatus());
			pst.setInt(6, j.getId());

			int v = pst.executeUpdate();

			if (v == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	public boolean deleteTask(int i) {
		boolean f=false;
		
		try {
			
			String q="DELETE FROM jobs WHERE id=? ;";
			PreparedStatement pst=conn.prepareStatement(q);
			pst.setInt(1,i);
			int v=pst.executeUpdate();
			
			if(v==1) {
				f=true;	
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public List<Jobs> getAllJobsForUser() {
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;
		
		try {
			
			String query="SELECT * FROM jobs WHERE status=? ORDER BY id desc";
			PreparedStatement pst=conn.prepareStatement(query);
			pst.setString(1, "Active");
			ResultSet rs= pst.executeQuery();
			
			while(rs.next()) {
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setLocation(rs.getString(4));
				j.setCategory(rs.getString(5));
				j.setStatus(rs.getString(6));
				j.setPdate(rs.getString(7)+"");
				list.add(j);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public List<Jobs> getJobsOrLocationAndCate(String category,String location) {
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;
		
		try {
			
			String query="SELECT * FROM jobs WHERE category=? OR location=? ORDER BY id desc;";
			PreparedStatement pst=conn.prepareStatement(query);
			pst.setString(1, category);
			pst.setString(2, location);
			ResultSet rs= pst.executeQuery();
			
			while(rs.next()) {
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setLocation(rs.getString(4));
				j.setCategory(rs.getString(5));
				j.setStatus(rs.getString(6));
				j.setPdate(rs.getString(7)+"");
				list.add(j);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public List<Jobs> getJobsAndLocationAndCate(String category,String location) {
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;
		
		try {
			
			String query="SELECT * FROM jobs WHERE category=? AND location=? ORDER BY id desc;";
			PreparedStatement pst=conn.prepareStatement(query);
			pst.setString(1, category);
			pst.setString(2, location);
			ResultSet rs= pst.executeQuery();
			
			while(rs.next()) {
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setLocation(rs.getString(4));
				j.setCategory(rs.getString(5));
				j.setStatus(rs.getString(6));
				j.setPdate(rs.getString(7)+"");
				list.add(j);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}
