/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Derek
 */
public class bids {
    private int id,user_id,product_id;
    private float bid_amout;
    private int status;
    private String date_created;

    public bids() {
    }

    public bids(int id, int user_id, int product_id, float bid_amout, int status, String date_created) {
        this.id = id;
        this.user_id = user_id;
        this.product_id = product_id;
        this.bid_amout = bid_amout;
        this.status = status;
        this.date_created = date_created;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public float getBid_amout() {
        return bid_amout;
    }

    public void setBid_amout(float bid_amout) {
        this.bid_amout = bid_amout;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDate_created() {
        return date_created;
    }

    public void setDate_created(String date_created) {
        this.date_created = date_created;
    }
    
}
