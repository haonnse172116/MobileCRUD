/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package object;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class CartDTO {

    private Map<String, MobileDTO> cart;

    public CartDTO() {
    }

    public CartDTO(Map<String, MobileDTO> cart) {
        this.cart = cart;
    }

    public Map<String, MobileDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, MobileDTO> cart) {
        this.cart = cart;
    }

    public boolean add(MobileDTO mobile) {
        boolean check = false;
        try {
            if (this.cart == null) {
                this.cart = new HashMap<>();
            }
            if (this.cart.containsKey(mobile.getMobileId())) {
                int currentQuantity = this.cart.get(mobile.getMobileId()).getQuantity();
                mobile.setQuantity(currentQuantity + mobile.getQuantity());
            }
            this.cart.put(mobile.getMobileId(), mobile);
            check = true;
        } catch (Exception e) {
        }

        return check;
    }

    public boolean change(String mobileId, MobileDTO mobile) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(mobileId)) {
                    this.cart.replace(mobileId, mobile);
                    check = true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }

    public boolean remove(String mobileId) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(mobileId)) {
                    this.cart.remove(mobileId);
                    check = true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }

}
