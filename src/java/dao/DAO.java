/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.AccountDTO;
import entity.Auction;
import entity.Category;
import entity.InfoAuction;
import entity.InfoCart;
import entity.InforPayment;
import entity.Items;
import entity.Message;
import entity.Notication;
import entity.Product;
import entity.bids;
import helper.DBUtils;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.management.Notification;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author Derek
 */
public class DAO {
      Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        public List<Product> getAllProduct(){
            List<Product> list = new ArrayList<>();
            String sql ="select * from PRODUCT";
            try{
                con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
              while(rs.next()){
                    int id = rs.getInt(1);
                    String name = rs.getString(2);
                    String image = rs.getString(3);
                    int price = rs.getInt(4);
                    String title = rs.getString(5);
                    String description = rs.getString(6);
                    int cateID= rs.getInt(7);
                    int sell_ID = rs.getInt(8);
                    Product dto = new Product(id, price, cateID, sell_ID, name, image, title, description);
                    list.add(dto);
            } 
            }catch(Exception e){
                
            }
            return list;
        }
                public List<Auction> getAllAuctionProduct(){
            List<Auction> list = new ArrayList<>();
            String sql ="select * from Auction";
            try{
                con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
              while(rs.next()){
                    int id = rs.getInt(1);
                    int cateID= rs.getInt(2);
                    String name = rs.getString(3);
                    String description = rs.getString(4);
                    float start_bid = rs.getFloat(5);
                    float regular_price = rs.getFloat(6);
                    String bid_end_datetime = rs.getString(7);
                    
                    String img_fname = rs.getString(8);
                    String date_created= rs.getString(9);
                    Auction dto = new Auction(id, cateID, name, description, bid_end_datetime, img_fname, date_created, start_bid, regular_price);
                    list.add(dto);
            } 
            }catch(Exception e){
                
            }
            return list;
        }
                     public List<Auction> getAllAuctionProductByID(int uid){
            List<Auction> list = new ArrayList<>();
            String sql ="select * from Auction where uid = ? ";
            try{
                con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
              stm.setInt(1,uid);
            rs = stm.executeQuery();
              while(rs.next()){
                    int id = rs.getInt(1);
                    int cateID= rs.getInt(2);
                    String name = rs.getString(3);
                    String description = rs.getString(4);
                    float start_bid = rs.getFloat(5);
                    float regular_price = rs.getFloat(6);
                    String bid_end_datetime = rs.getString(7);
                    
                    String img_fname = rs.getString(8);
                    String date_created= rs.getString(9);
                    Auction dto = new Auction(id, cateID, name, description, bid_end_datetime, img_fname, date_created, start_bid, regular_price);
                    list.add(dto);
            } 
            }catch(Exception e){
                
            }
            return list;
        }
              public List<Product> getRamdomProduct(){
            List<Product> list = new ArrayList<>();
            String sql ="SELECT TOP 4 id, name, image, price, title, description, cateID, sell_ID FROM product ORDER BY NEWID()";
            try{
                con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
              while(rs.next()){
                    int id = rs.getInt(1);
                    String name = rs.getString(2);
                    String image = rs.getString(3);
                    int price = rs.getInt(4);
                    String title = rs.getString(5);
                    String description = rs.getString(6);
                    int cateID= rs.getInt(7);
                    int sell_ID = rs.getInt(8);
                    Product dto = new Product(id, price, cateID, sell_ID, name, image, title, description);
                 
                    list.add(dto);
            } 
            }catch(Exception e){
                
            }
            return list;
        }
               public List<Category> getAllCategory(){
            List<Category> list = new ArrayList<>();
            String sql ="select * from Category";
            try{
                con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
              while(rs.next()){
                    int id = rs.getInt(1);
                    String name = rs.getString(2);
                    Category dto = new Category(id, name);
                    list.add(dto);
            } 
            }catch(Exception e){
                
            }
            return list;
        }
            public List<Product> getProductById(String cid){
            List<Product> list = new ArrayList<>();
            String sql ="select * from Product where cateID=?";
            try{
                con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1,cid);
            rs = stm.executeQuery();
              while(rs.next()){
                    int id = rs.getInt(1);
                    String name = rs.getString(2);
                    String image = rs.getString(3);
                    int price = rs.getInt(4);
                    String title = rs.getString(5);
                    String description = rs.getString(6);
                    int cateID= rs.getInt(7);
                    int sell_ID = rs.getInt(8);
                    Product dto = new Product(id, price, cateID, sell_ID, name, image, title, description);
                    list.add(dto);
            } 
            }catch(Exception e){
                
            }
            return list;
        }
             public Product getProductByPId(String pid){
            String sql ="select * from Product where id=?";
            try{
                con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1,pid);
            rs = stm.executeQuery();
              while(rs.next()){
                    int id = rs.getInt(1);
                    String name = rs.getString(2);
                    String image = rs.getString(3);
                    int price = rs.getInt(4);
                    String title = rs.getString(5);
                    String description = rs.getString(6);
                    int cateID= rs.getInt(7);
                    int sell_ID = rs.getInt(8);
                   return new Product(id, price, cateID, sell_ID, name, image, title, description);
                      
            } 
            }catch(Exception e){
                
            }
            return null;
        }
             public List<Product> getProductBySearch(String search){
            List<Product> list = new ArrayList<>();
            String sql ="select * from product where name like ?";
            try{
                con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1,"%" +search+ "%");
            rs = stm.executeQuery();
              while(rs.next()){
                    int id = rs.getInt(1);
                    String name = rs.getString(2);
                    String image = rs.getString(3);
                    int price = rs.getInt(4);
                    String title = rs.getString(5);
                    String description = rs.getString(6);
                    int cateID= rs.getInt(7);
                    int sell_ID = rs.getInt(8);
                    Product dto = new Product(id, price, cateID, sell_ID, name, image, title, description);
                    list.add(dto);
            } 
            }catch(Exception e){
                
            }
            return list;
        }
               public AccountDTO login(String user, String pass) {
        String query = " select * from ACCOUNT where [user]=? and pass=?";
        try {
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(query);
            stm.setString(1, user);
            stm.setString(2, pass);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new AccountDTO(rs.getInt("uid"), rs.getString("user"), rs.getString("name"), rs.getString("email"), rs.getString("contact"), rs.getString("address"), rs.getString("pass"), rs.getInt("isSell"), rs.getInt("isAdmin"));
               
            }
        } catch (Exception e) {
        }

        return null;
    }
         public AccountDTO checkExistAcc(String user) {
        String query = " select * from ACCOUNT where [user]=?";
        try {
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(query);
            stm.setString(1, user);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new AccountDTO(rs.getInt("uid"), rs.getString("user"), rs.getString("name"), rs.getString("email"), rs.getString("contact"), rs.getString("address"), rs.getString("pass"), rs.getInt("isSell"), rs.getInt("isAdmin"));
            }
        } catch (Exception e) {
        }

        return null;
    }
     public void signup(String user, String pass){
         String query= "insert into Account values(?,?,0,0)";
          try {
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(query);
            stm.setString(1, user);
            stm.setString(2, pass);
          stm.executeUpdate();
        } catch (Exception e) {
        }
          
}
          public List<Product> getProductBySellId(int cid){
            List<Product> list = new ArrayList<>();
            String sql ="select * from Product where sell_ID=?";
            try{
                con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setInt(1,cid);
            rs = stm.executeQuery();
              while(rs.next()){
                    int id = rs.getInt(1);
                    String name = rs.getString(2);
                    String image = rs.getString(3);
                    int price = rs.getInt(4);
                    String title = rs.getString(5);
                    String description = rs.getString(6);
                    int cateID= rs.getInt(7);
                    int sell_ID = rs.getInt(8);
                    Product dto = new Product(id, price, cateID, sell_ID, name, image, title, description);
                    list.add(dto);
            } 
            }catch(Exception e){
                
            }
            return list;
        }
          public void deleteProduct(String pk){
         String sql = "delete from PRODUCT where id = ?";
        try {
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, pk);
           stm.executeUpdate();
//                if(rs > 0){
//                    return true;
//                }
        } catch (Exception e) {
        }
//        return false;
    }
               public void deleteCart(String uid,String pid){
         String sql = "delete from Cart where AccountID = ? and ProductID=?";
        try {
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, uid);
            stm.setString(2, pid);
           stm.executeUpdate();
//                if(rs > 0){
//                    return true;
//                }
        } catch (Exception e) {
        }
//        return false;
    }
                     public void deleteCartByUID(int uid){
         String sql = "delete from Cart where AccountID = ?";
        try {
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setInt(1, uid);
           stm.executeUpdate();
//                if(rs > 0){
//                    return true;
//                }
        } catch (Exception e) {
        }
//        return false;
    }
              public void deleteAuction(String pk){
         String sql = "delete from Auction where id = ?";
        try {
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, pk);
           stm.executeUpdate();
//                if(rs > 0){
//                    return true;
//                }
        } catch (Exception e) {
        }
//        return false;
    }
       public boolean addProduct(String name, String image, int price, String title, String description,int cateId,int SellID){
        String sql = "insert into Product values(? ,? ,?,?,?,?,?)";
        try {
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, image);
            stm.setInt(3, price);
            stm.setString(4, title);
            stm.setString(5, description);
            stm.setInt(6,cateId);
            stm.setInt(7,SellID);
            int rs = stm.executeUpdate();
            System.out.println("Add Product:" + name);
                if(rs > 0){
                    return true;
                }
        } catch (Exception e) {
        }
        return false;
    }
       public void updateNotification(int uid, String notification){
               String sql = "insert into Notification(AccountID,Notification) values(? ,? )";
        try {
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setInt(1, uid);
            stm.setString(2, notification);
            int rs = stm.executeUpdate();
        } catch (Exception e) {
        }
       }
       public List<Notication> listNotif(int uid){
                  List<Notication> list = new ArrayList<>();
            String sql ="Select n.id, a.name, n.Notification\n" +
"from Account a inner join Notification n on a.uID = n.AccountID\n" +
"where a.uID = ?";
            try{
                con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setInt(1,uid);
            rs = stm.executeQuery();
              while(rs.next()){
                    int id = rs.getInt(1);
                    String name = rs.getString(2);
                    String notif = rs.getString(3);
                    Notication dto = new Notication(name, notif, id);
                    list.add(dto);
            } 
            }catch(Exception e){
                
            }
            return list;
        }
          public boolean addAuctionProduct(String name,  int cateId,  String description,  float regular_price, float start_bid, String date, String image,int uid){
        String sql = "INSERT INTO Auction (category_id, name,description,start_bid,regular_price,bid_end_datetime,img_fname,uid)\n" +
"\n" +
"VALUES (?,?,?,?,?,?,?,?)";
        try {
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setInt(1, cateId);
            stm.setString(2, name);
            stm.setString(3, description);
            stm.setFloat(4, start_bid);
            stm.setFloat(5, regular_price);
            stm.setString(6, date);
            stm.setString(7,image);
            stm.setInt(8,uid);
            int rs = stm.executeUpdate();
 System.out.println("Add Auction Product:" + name);
                if(rs > 0){
                               
                    return true;
                }
        } catch (Exception e) {
        }
        return false;
    }
            public boolean updateProduct(String name, String image, int price, String title, String description,int cateId,String id){
            String sql = "Update PRODUCT Set name = ?,image =?, price= ?, title=?, description=?,cateID=?  where id = ?";
        try {
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, name);
          stm.setString(2,image);
          stm.setInt(3, price);
          stm.setString(4, title);
          stm.setString(5,description);
          stm.setInt(6,cateId);
          stm.setString(7,id);
            int rs = stm.executeUpdate();
                if(rs > 0){
                    return true;
                }
        } catch (Exception e) {
        }
        return false;
       }
              public boolean updateProductPrice( int price,String id){
            String sql = "Update PRODUCT Set  price= ?  where id = ?";
        try {
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setInt(1, price); 
          stm.setString(2,id);
            int rs = stm.executeUpdate();
                if(rs > 0){
                    return true;
                }
        } catch (Exception e) {
        }
        return false;
       }
            public double getTotalCartPrice(List<Items> list ){
                double sum = 0;
                try{
                    if(list.size()>0){
                        for(Items item: list){
                            String sql=" select price from product where id = ?";
                            con = new DBUtils().getConnection();
                             stm = con.prepareStatement(sql);
                            stm.setInt(1, item.getProduct().getId());
                             rs = stm.executeQuery();
                            while(rs.next()){
                                sum+=rs.getDouble("price")*item.getQuantity();
                            }
                                    
                        }
                    }
                }catch(Exception e){
                    
                }
                return sum;
            }
            public List<AccountDTO> displayAccount() {
        List<AccountDTO> list = new ArrayList<>();
        String sql = "Select * from ACCOUNT";
        try {
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new AccountDTO(rs.getInt("uid"), rs.getString("user"), rs.getString("name"), rs.getString("email"), rs.getString("contact"), rs.getString("address"), rs.getString("pass"), rs.getInt("isSell"), rs.getInt("isAdmin")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public AccountDTO searchAccount(int uID) {
        String sql = "select * from ACCOUNT where uID = ?";
        try {
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setInt(1, uID);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new AccountDTO(rs.getInt("uid"), rs.getString("user"), rs.getString("name"), rs.getString("email"), rs.getString("contact"), rs.getString("address"), rs.getString("pass"), rs.getInt("isSell"), rs.getInt("isAdmin"));
            }
        } catch (Exception e) {
        }
        return null;
    }
    public boolean UpdateAccount(int Uid,String username, String password, int issell, int role){
        String sql = "update ACCOUNT set pass=?, isSell=?, isAdmin =? where uID = ?";
        try {
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, password);
            stm.setInt(2, issell);
            stm.setInt(3, role);
            stm.setInt(4, Uid);
            int rs=stm.executeUpdate();
        if(rs > 0){
                    return true;
                }
        } catch (Exception e) {
        }
        return false;
    }
    public void deleteAccount(String username){
        String sql = "delete from ACCOUNT where [user] = ?";
        try {
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, username);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }
     public List<bids> getHighestBiddingAmount(){
            List<bids> list = new ArrayList<>();
            String sql ="select b.*\n" +
"from bids b\n" +
"where b.bid_amount = (select max(b1.bid_amount) from bids b1 where b1.product_id = b.product_id );";
            try{
                con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
              while(rs.next()){
                    int id = rs.getInt(1);
                    int user_id = rs.getInt(2);
                    int product_id = rs.getInt(3);
                    float bid_amout = rs.getFloat(4);
                    int status = rs.getInt(5);
                    String date_created = rs.getString(6);
                    bids dto = new bids(id, user_id, product_id, bid_amout, status, date_created);
                    list.add(dto);
            } 
            }catch(Exception e){
                
            }
            return list;
        }
     public int getTotalBidUsers(String id){
         String sql = "SELECT COUNT(distinct(user_id)) FROM bids where product_id = ?";
         int count;
           try{
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1,id);
            rs = stm.executeQuery();
              while(rs.next()){
                    count = rs.getInt(1);            
                   return count;
                      
            } 
            }catch(Exception e){
                
            }
          return 0;
     }
                 public List<InfoAuction> getInfoAuction(){
            List<InfoAuction> list = new ArrayList<>();
            String sql ="SELECT b.*, u.[user] as uname,p.name,p.bid_end_datetime bdt FROM bids b inner join Account u on u.uID = b.user_id inner join Auction p on p.id = b.product_id";
            try{
                con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            int bdt= 0;
              while(rs.next()){
                    int id = rs.getInt(1);
                    int user_id= rs.getInt(2);
                    int product_id = rs.getInt(3);
                   float bid_amount = rs.getFloat(4);
                   int status = rs.getInt(5);
                   String date_created = rs.getString(6);
                   String uname = rs.getString(7);
                   String name = rs.getString(8);
                    Date date1 = new Date(rs.getTimestamp("bdt").getTime());
                    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                      System.out.println(dateFormat.format(date1));
                    Date date2 = new Date();
                                                          if (date1.after(date2)) {
                                    bdt=1;
                                }

                                            if (date1.before(date2)) {
                                                        bdt =0;
                                            }

                                                if (date1.equals(date2)) {
                                                                    bdt = 2;
                                                                        }
                 
                        
                  InfoAuction dto = new InfoAuction(id, user_id, product_id, status, bdt, bid_amount, date_created, uname, name);
                    list.add(dto);
            } 
            }catch(Exception e){
                
            }
            return list;
        }
          public Auction getAuctionById(String pid){
            String sql ="select * from Auction where id= ?";
            try{
                con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1,pid);
            rs = stm.executeQuery();
              while(rs.next()){
                       int id = rs.getInt(1);
                    int cateID= rs.getInt(2);
                    String name = rs.getString(3);
                    String description = rs.getString(4);
                    float start_bid = rs.getFloat(5);
                    float regular_price = rs.getFloat(6);
                    String bid_end_datetime = rs.getString(7);
                    
                    String img_fname = rs.getString(8);
                    String date_created= rs.getString(9);
                   return new Auction(id, cateID, name, description, bid_end_datetime, img_fname, date_created, start_bid, regular_price);
                      
            } 
            }catch(Exception e){
                
            }
            return null;
        }
                   public void updateAuctionPrice( int price,String id,int uid){
            String sql = "UPDATE bids set bid_amount = ?,user_id =? where  id= ?";
        try {
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setInt(1, price);
              stm.setInt(2, uid); 
          stm.setString(3,id);
            int rs = stm.executeUpdate();
//                if(rs > 0){
//                    return true;
//                }
        } catch (Exception e) {
        }
        
      
       }
         public void updateAuction( String name,String cate,String description,String regular_price,String bid_amount,String image,String bdt,String id){
            String sql = "UPDATE Auction set category_id = ?,name =?,description = ?,start_bid=?,regular_price=?,bid_end_datetime=?,img_fname=?  where  id= ?";
        try {
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
           stm.setString(1,cate);
          stm.setString(2,name);
          stm.setString(3,description);
          stm.setString(4,bid_amount);
          stm.setString(5,regular_price);
          stm.setString(6,bdt);
          stm.setString(7,image);
          stm.setString(8,id);
            int rs = stm.executeUpdate();
//                if(rs > 0){
//                    return true;
//                }
        } catch (Exception e) {
        }
        
      
       }
           public void insertAuctionPrice( int price,int id,int uid){
            String sql = "insert into bids (user_id,product_id, bid_amount) values (?,?,?)";
        try {
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setInt(1, uid);
              stm.setInt(2, id); 
          stm.setInt(3,price);
            int rs = stm.executeUpdate();
//                if(rs > 0){
//                    return true;
//                }
        } catch (Exception e) {
        }
      
       }
                          
                public List<Auction> getAllAuctionAvailable(){
            List<Auction> list = new ArrayList<>();
            String sql ="select * from Auction";
            try{
                con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            String bdt = "1";
              while(rs.next()){
                    int id = rs.getInt(1);
                    int cateID= rs.getInt(2);
                    String name = rs.getString(3);
                    String description = rs.getString(4);
                    float start_bid = rs.getFloat(5);
                    float regular_price = rs.getFloat(6);
                    String bid_end_datetime = rs.getString(7);
                    
                    String img_fname = rs.getString(8);
                    String date_created= rs.getString(9);
                       Date date1 = new Date(rs.getTimestamp("bid_end_datetime").getTime());
                    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                      System.out.println(dateFormat.format(date1));
                    Date date2 = new Date();
                                                          if (date1.after(date2)) {
                                    bdt="1";
                                }

                                            if (date1.before(date2)) {
                                                        bdt ="0";
                                            }

                                                if (date1.equals(date2)) {
                                                                    bdt = "2";
                                                                        }
                    Auction dto = new Auction(id, cateID, name, description, bid_end_datetime, img_fname, bdt, start_bid, regular_price);
                    list.add(dto);
            } 
            }catch(Exception e){
                
            }
            return list;
        }
 
              public void addCart(String uid, String pid, String price){
        String sql = "insert into Cart(AccountID,ProductID,Amount) values(? ,? ,?)";
        try {
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, uid);
            stm.setString(2, pid);
            stm.setString(3, price);
            int rs = stm.executeUpdate();
               
        } catch (Exception e) {
        }
    }
                public List<InfoCart> getCart(int pk){
            List<InfoCart> list = new ArrayList<>();
            String sql ="SELECT b.*,p.image,p.name FROM Cart b inner join Account u on u.uID = b.AccountID inner join product p on p.id = b.ProductID where b.AccountID = ?";
            try{
                con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
                stm.setInt(1, pk);
            rs = stm.executeQuery();
              while(rs.next()){
                    int uid = rs.getInt(1);
                    int pid= rs.getInt(2);
                    int price = rs.getInt(3);
                   String image = rs.getString(4);
                   String name = rs.getString(5);
                  InfoCart dto = new InfoCart(uid, pid, price, name, image);
                    list.add(dto);
            } 
            }catch(Exception e){
                
            }
            return list;
        }
                   public int getTotalCart(String id){
         String sql = "SELECT SUM(Amount) as total\n" +
"FROM Cart\n" +
"where AccountID= ?";
         int count;
           try{
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1,id);
            rs = stm.executeQuery();
              while(rs.next()){
                    count = rs.getInt(1);            
                   return count;
                      
            } 
            }catch(Exception e){
                
            }
          return 0;
     }
         public void insertOrder(int uid, int pid){
         String sql = "insert into CheckOut(AccountID,ProductID) values(?,?)";
        try {
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setInt(1, uid);
            stm.setInt(2, pid);
           stm.executeUpdate();
//                if(rs > 0){
//                    return true;
//                }
        } catch (Exception e) {
        }
//        return false;
    }
                    public void deleteNotif( String id){
            String sql = "Delete from Notification where  id= ?";
        try {
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, id);
            int rs = stm.executeUpdate();
//                if(rs > 0){
//                    return true;
//                }
        } catch (Exception e) {
        }
                    }
        public List<InforPayment> getPayment(int uid){
          List<InforPayment> list = new ArrayList<>();
            String sql ="select a.name,a.email,a.address,a.contact,p.image,p.name,p.price,c.date_created,p.id \n" +
"from ACCOUNT a inner join Product p on p.sell_ID= a.uID inner join CheckOut c on c.ProductID= p.id\n" +
"where c.AccountID = ?";
            try{
                con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
                stm.setInt(1, uid);
            rs = stm.executeQuery();
              while(rs.next()){
                    String nameUser = rs.getString(1);
                    String email = rs.getString(2);
                    String address= rs.getString(3);
                    String phone = rs.getString(4);
                    String image = rs.getString(5);
                    String nameProduct = rs.getString(6);
                    int price = rs.getInt(7);
                   String date_createdd = rs.getString(8);
                      int pid = rs.getInt(9);
                  InforPayment dto = new InforPayment(nameUser, email, address, phone, image, nameProduct, date_createdd, price,pid);
                    list.add(dto);
            } 
            }catch(Exception e){
                
            }
            return list;  
        }
          public List<Message> getMessage(int UserId1,int ToUser1,int UserId2,int ToUser2){
          List<Message> list = new ArrayList<>();
            String sql ="select * from messages where(FromUser =? and ToUser=?) or(FromUser=? and ToUser=?)";
            try{
                con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
                stm.setInt(1, UserId1);
                stm.setInt(2, ToUser1);
                stm.setInt(3, UserId2);
                stm.setInt(4, ToUser2);
            rs = stm.executeQuery();
              while(rs.next()){
                   int id = rs.getInt(1);
                   int FromUser = rs.getInt(2);
                   int ToUser = rs.getInt(3);
                   String message = rs.getString(4);
                    list.add(new Message(id, FromUser, ToUser, message));
            } 
            }catch(Exception e){
                
            }
            return list;  
        }
           public List<Message> getMessage1(String UserId1,String ToUser1,String UserId2,String ToUser2){
          List<Message> list = new ArrayList<>();
            String sql ="select * from messages where(FromUser =? and ToUser=?) or(FromUser=? and ToUser=?)";
            try{
                con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
                stm.setString(1, UserId1);
                stm.setString(2, ToUser1);
                stm.setString(3, UserId2);
                stm.setString(4, ToUser2);
            rs = stm.executeQuery();
              while(rs.next()){
                   int id = rs.getInt(1);
                   int FromUser = rs.getInt(2);
                   int ToUser = rs.getInt(3);
                   String message = rs.getString(4);
                    list.add(new Message(id, FromUser, ToUser, message));
            } 
            }catch(Exception e){
                
            }
            return list;  
        }
                public void insertMessage(String fromUser, String toUser,String message){
         String sql = "insert into messages(FromUser,ToUser,Message) values(?,?,?)";
        try {
            con = new DBUtils().getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, fromUser);
            stm.setString(2, toUser);
             stm.setString(3, message);
           stm.executeUpdate();
//                if(rs > 0){
//                    return true;
//                }
        } catch (Exception e) {
        }
//        return false;
    }
}
