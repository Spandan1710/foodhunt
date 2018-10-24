package edu.utdallas.foodhunt.utils.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtils implements DBCon {

    public static Connection getDbConnection(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(connectionUrl,user,password);
        }catch(Exception e){
           e.printStackTrace();
        }
        return null;
    }
}
