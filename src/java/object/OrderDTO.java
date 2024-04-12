/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package object;

/**
 *
 * @author Admin
 */
public class OrderDTO {
    private String userId;
    private String mobileId;

    public OrderDTO() {
    }

    public OrderDTO(String userId, String mobileId) {
        this.userId = userId;
        this.mobileId = mobileId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getMobileId() {
        return mobileId;
    }

    public void setMobileId(String mobileId) {
        this.mobileId = mobileId;
    }
    
    
}
