/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Derek
 */
public class InfoAuction {
    private int id,user_id,product_id,status,bdt;
    private float bid_amount;
    private String date_created,uname,name;

    public InfoAuction() {
    }

    public InfoAuction(int id, int user_id, int product_id, int status, int bdt, float bid_amount, String date_created, String uname, String name) {
        this.id = id;
        this.user_id = user_id;
        this.product_id = product_id;
        this.status = status;
        this.bdt = bdt;
        this.bid_amount = bid_amount;
        this.date_created = date_created;
        this.uname = uname;
        this.name = name;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getBdt() {
        return bdt;
    }

    public void setBdt(int bdt) {
        this.bdt = bdt;
    }

    public float getBid_amount() {
        return bid_amount;
    }

    public void setBid_amount(float bid_amount) {
        this.bid_amount = bid_amount;
    }

    public String getDate_created() {
        return date_created;
    }

    public void setDate_created(String date_created) {
        this.date_created = date_created;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    

}
