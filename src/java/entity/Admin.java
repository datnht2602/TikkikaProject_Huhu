/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Derek
 */
public class Admin {
    private String email,password,fullname,hash;
    private int is_block,rulse_id;

    public Admin(String email, String password, String fullname, String hash, int is_block, int rulse_id) {
        this.email = email;
        this.password = password;
        this.fullname = fullname;
        this.hash = hash;
        this.is_block = is_block;
        this.rulse_id = rulse_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getHash() {
        return hash;
    }

    public void setHash(String hash) {
        this.hash = hash;
    }

    public int getIs_block() {
        return is_block;
    }

    public void setIs_block(int is_block) {
        this.is_block = is_block;
    }

    public int getRulse_id() {
        return rulse_id;
    }

    public void setRulse_id(int rulse_id) {
        this.rulse_id = rulse_id;
    }
    
}
