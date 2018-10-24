package edu.utdallas.foodhunt.usermanagement.datalayer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import edu.utdallas.foodhunt.usermanagement.datalayer.entity.User;
import edu.utdallas.foodhunt.utils.db.DBUtils;

public class UserDao {

    private Connection conn;
    private PreparedStatement ps;

    public  UserDao(){
        conn = DBUtils.getDbConnection();
        ps=null;
    }
    public User validateUser(User checkUser) {
        User user = new User();
        try {
            ps = conn.prepareStatement("select * from user where username=? and password=?");
            ps.setString(1, checkUser.getUsername());
            ps.setString(2, checkUser.getPassword());

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user.setUsername(rs.getString(1));
                user.setPassword(rs.getString(2));
                user.setAdmin(rs.getBoolean(3));
                user.setFirstName(rs.getString(4));
                user.setLastName(rs.getString(5));
                user.setEmailAddress(rs.getString(6));
                user.setPhone(rs.getString(7));
                user.setAddress(rs.getString(8));
                user.setCity(rs.getString(9));
                user.setState(rs.getString(10));
                user.setZipCode(rs.getInt(11));
                user.setCountry(rs.getString(12));
                user.setInterests(rs.getString(13));
                user.setVeg(rs.getBoolean(14));
                user.setPremiumMember(rs.getBoolean(15));
                user.setActive(rs.getBoolean(16));
            }
            return user;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public int register(User newUser) {
        int status;
        try {
            ps = conn.prepareStatement("insert into user (username,password,isAdmin) values(?,?,?)");
            ps.setString(1, newUser.getUsername());
            ps.setString(2, newUser.getPassword());
            ps.setBoolean(3, newUser.getAdmin());
            status = ps.execute()?1:0;
        } catch (Exception e) {
            status = -1;// if username already exists
            System.out.println(e);
        }
        return status;
    }

    @Override
    protected void finalize() throws Throwable {
        conn.close();
    }
}
