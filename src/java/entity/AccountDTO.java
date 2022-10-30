
package entity;

/**
 *
 * @author Admin
 */
public class AccountDTO {
    public int uID;
    public String Username,name,email,contact,address;
    public String password;
    public int isSell;
    public int isAdmin;
//    public String     
    
    public AccountDTO(){
        
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public AccountDTO(int uID, String Username, String name, String email, String contact, String address, String password, int isSell, int isAdmin) {
        this.uID = uID;
        this.Username = Username;
        this.name = name;
        this.email = email;
        this.contact = contact;
        this.address = address;
        this.password = password;
        this.isSell = isSell;
        this.isAdmin = isAdmin;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public int getIsSell() {
        return isSell;
    }

    public void setIsSell(int isSell) {
        this.isSell = isSell;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public String toString() {
        return "AccountDTO{" + "uID=" + uID + ", Username=" + Username + ", password=" + password + ", isSell=" + isSell + ", isAdmin=" + isAdmin + '}';
    }


}