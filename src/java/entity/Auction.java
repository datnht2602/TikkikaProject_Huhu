/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Derek
 */
public class Auction {

    public Auction(int id, int category_id, String name, String description, String bid_end_datetime, String img_fname, String date_created, float start_bid, float regular_price) {
        this.id = id;
        this.category_id = category_id;
        this.name = name;
        this.description = description;
        this.bid_end_datetime = bid_end_datetime;
        this.img_fname = img_fname;
        this.date_created = date_created;
        this.start_bid = start_bid;
        this.regular_price = regular_price;
    }
    private int id,category_id;
    private String name,description,bid_end_datetime,img_fname,date_created;
    private float start_bid,regular_price;

    public Auction() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBid_end_datetime() {
        return bid_end_datetime;
    }

    public void setBid_end_datetime(String bid_end_datetime) {
        this.bid_end_datetime = bid_end_datetime;
    }

    public String getImg_fname() {
        return img_fname;
    }

    public void setImg_fname(String img_fname) {
        this.img_fname = img_fname;
    }

    public String getDate_created() {
        return date_created;
    }

    public void setDate_created(String date_created) {
        this.date_created = date_created;
    }

    public float getStart_bid() {
        return start_bid;
    }

    public void setStart_bid(float start_bid) {
        this.start_bid = start_bid;
    }

    public float getRegular_price() {
        return regular_price;
    }

    public void setRegular_price(float regular_price) {
        this.regular_price = regular_price;
    }
    
}
