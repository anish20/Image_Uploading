/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;
import java.sql.*;
/**
 *
 * @author ANISH
 */
public class dbconnect {
    static{
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
        }
    }
    
    public static Connection myCon(){
        Connection con=null;
        try {
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imagedb","root","");
            System.err.println("Connection created..");
        } catch (Exception e) {
            System.err.println(e);
        }
        return con;
    }
}
