/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package object;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class MobileDAO {

    private static final String SEARCH_BY_NAME_OR_ID = "SELECT * FROM tbl_Mobile WHERE mobileName like ? OR mobileId like ?";
    private static final String DELETE = "DELETE tbl_Mobile WHERE mobileId=?";
    private static final String UPDATE = "UPDATE tbl_Mobile SET price=?, description=?, quantity=?, notSale=? WHERE mobileId=?";
    private static final String INSERT="INSERT INTO tbl_Mobile(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale) "
            + "  VALUES(?,?,?,?,?,?,?)";
    private static final String CHECK_DUPPLICATE = "SELECT mobileId FROM tbl_Mobile WHERE mobileId=?  ";
    private static final String SEARCH_BY_MIN_AND_MAX = "SELECT * FROM tbl_Mobile WHERE price BETWEEN ? AND ?";
    
    public List<MobileDTO> getListMobileByNameorID(String search) throws SQLException {
        List<MobileDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_BY_NAME_OR_ID);
                ptm.setString(1, "%" + search + "%");
                ptm.setString(2, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String mobileId = rs.getString("mobileId");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    String mobileName = rs.getString("mobileName");
                    int yearOfProduction = rs.getInt("yearOfProduction");
                    int quantity = rs.getInt("quantity");
                    boolean notSale = rs.getBoolean("notSale");
                    list.add(new MobileDTO(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public boolean delete(String mobileId) throws SQLException {
        boolean checkDelete = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, mobileId);
                checkDelete = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return checkDelete;
    }

    public boolean update(MobileDTO mobile) throws SQLException {
        boolean checkUpdate = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setFloat(1, mobile.getPrice());
                ptm.setString(2, mobile.getDescription());
                ptm.setInt(3, mobile.getQuantity());
                ptm.setBoolean(4, mobile.isNotSale());
                ptm.setString(5, mobile.getMobileId());
                checkUpdate = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return checkUpdate;
    }
    
    public boolean insert(MobileDTO mobile) throws ClassNotFoundException, SQLException {
        boolean checkInsert= false;
        Connection conn= null;
        PreparedStatement ptm= null;
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(INSERT);
                ptm.setString(1, mobile.getMobileId());
                ptm.setString(2, mobile.getDescription());
                ptm.setFloat(3, mobile.getPrice());
                ptm.setString(4, mobile.getMobileName());
                ptm.setInt(5, mobile.getYearOfProduction());
                ptm.setInt(6, mobile.getQuantity());
                ptm.setBoolean(7, mobile.isNotSale());
                checkInsert= ptm.executeUpdate()>0?true:false;
            }
        } finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return checkInsert;
    }
    
    public boolean checkDuplicate(String mobileId) throws SQLException {
        boolean check= false;
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs= null;
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(CHECK_DUPPLICATE);
                ptm.setString(1, mobileId);
                rs= ptm.executeQuery();
                if(rs.next()){
                    check= true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs!= null) rs.close();
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return check;
    }
     public List<MobileDTO> getListByMinAndMax(String minPrice, String maxPrice) throws SQLException {
        List<MobileDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_BY_MIN_AND_MAX);
                ptm.setString(1,minPrice);
                ptm.setString(2,maxPrice);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String mobileId = rs.getString("mobileId");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    String mobileName = rs.getString("mobileName");
                    int yearOfProduction = rs.getInt("yearOfProduction");
                    int quantity = rs.getInt("quantity");
                    boolean notSale = rs.getBoolean("notSale");
                    list.add(new MobileDTO(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
}
