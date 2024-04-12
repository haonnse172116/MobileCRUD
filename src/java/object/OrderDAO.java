/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package object;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class OrderDAO {

    private static final String INSERT_ORDER = "INSERT INTO tbl_Order (UserID, Total) VALUES (?, ?)";
    private static final String INSERT_ORDER_ITEM = "INSERT INTO tbl_OrderItem (OrderID, MobileID, Quantity) VALUES (?, ?, ?)";

    public boolean saveOrder(String userId, CartDTO cart, double total) throws ClassNotFoundException, SQLException {
        boolean checkInsert = false;
        Connection conn = null;
        PreparedStatement orderPtm = null;
        PreparedStatement orderItemPtm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                conn.setAutoCommit(false);
                orderPtm = conn.prepareStatement(INSERT_ORDER, Statement.RETURN_GENERATED_KEYS);
                orderPtm.setString(1, userId);
                orderPtm.setBigDecimal(2, new BigDecimal(total));
                orderPtm.executeUpdate();
                rs = orderPtm.getGeneratedKeys();
                int orderId = -1;
                if (rs.next()) {
                    orderId = rs.getInt(1);
                } else {
                    throw new SQLException("Failed to retrieve generated key for order ID");
                }
                orderItemPtm = conn.prepareStatement(INSERT_ORDER_ITEM);
                for (Map.Entry<String, MobileDTO> entry : cart.getCart().entrySet()) {
                    String mobileId = entry.getKey();
                    MobileDTO mobile = entry.getValue();
                    int quantity = mobile.getQuantity();
                    orderItemPtm.setInt(1, orderId);
                    orderItemPtm.setString(2, mobileId);
                    orderItemPtm.setInt(3, quantity);
                    orderItemPtm.addBatch();
                }
                int[] updateCounts = orderItemPtm.executeBatch();
                for (int count : updateCounts) {
                    if (count == PreparedStatement.EXECUTE_FAILED) {
                        throw new SQLException("Batch insertion of order items failed");
                    }
                }
                conn.commit();
                checkInsert = true;
            }
        } catch (SQLException ex) {
            if (conn != null) {
                conn.rollback();
            }
            throw ex;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (orderPtm != null) {
                orderPtm.close();
            }
            if (orderItemPtm != null) {
                orderItemPtm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return checkInsert;
    }
}
