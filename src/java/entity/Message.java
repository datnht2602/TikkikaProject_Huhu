/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Derek
 */
public class Message {
    private int id,FromUser,ToUser;
    private String Message;

    public Message(int id, int FromUser, int ToUser, String Message) {
        this.id = id;
        this.FromUser = FromUser;
        this.ToUser = ToUser;
        this.Message = Message;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFromUser() {
        return FromUser;
    }

    public void setFromUser(int FromUser) {
        this.FromUser = FromUser;
    }

    public int getToUser() {
        return ToUser;
    }

    public void setToUser(int ToUser) {
        this.ToUser = ToUser;
    }

    public String getMessage() {
        return Message;
    }

    public void setMessage(String Message) {
        this.Message = Message;
    }

  
    
}
