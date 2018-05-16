/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.mysql.jdbc.Connection;
import entities.Product;
import entities.Transaction;
import entities.User;
import aux.TopUser;
import exceptions.ExceptionsTechShop;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author alexlopez
 */
public class TechShopDAO {
    Connection conn;
    
    // ----------------------------- Delete ----------------------------->
    
    public void deteleUser(int id) throws SQLException, ClassNotFoundException {
        conect();
        String update = "delete from user where iduser='" + id + "'" ;
        PreparedStatement ps = conn.prepareStatement(update);
        ps.executeUpdate();
        ps.close();
        desconect();
    }
    
    // ----------------------------- Update ----------------------------->
    
    public void updateUser(User user) throws SQLException, ExceptionsTechShop, ClassNotFoundException{
        conect();
        if(!existsUser(user)){
            throw new ExceptionsTechShop("ERROR: No exists user with these username");
        }
        String update = "update user set password='" + user.getPassword() + "' where email = '" + user.getEmail() + "'";
        PreparedStatement ps = conn.prepareStatement(update);
        ps.executeUpdate();
        ps.close();
        desconect();
    }
    
     // ----------------------------- Insert ----------------------------->
    
    public void addProduct(Product product) throws SQLException, ClassNotFoundException, ExceptionsTechShop {
        conect();
        if (existsProduct(product)) {
            throw new ExceptionsTechShop("ERROR: Product exist");
        }
        String insert = "insert into product values (null, ?, ?, ?, ?);";
        PreparedStatement ps = conn.prepareStatement(insert);
        ps.setString(1, product.getName());
        ps.setString(2, product.getCategory());
        ps.setString(3, product.getDescription());
        ps.setInt(4, product.getPrice());
        ps.executeUpdate();
        ps.close();
        desconect();    
    }
    
    public void buyProduct(Transaction transaction) throws SQLException, ClassNotFoundException, ExceptionsTechShop {
        conect();
        if (!existsProduct(transaction.getProduct())) {
            throw new ExceptionsTechShop("ERROR: Product dosen't exist");
        }
        String insert = "insert into transaction values (null, ?, ?);";
        PreparedStatement ps = conn.prepareStatement(insert);
        ps.setString(1, transaction.getUser().getIduser().toString());
        ps.setString(2, transaction.getProduct().getIdproduct().toString());
        ps.executeUpdate();
        ps.close();
        desconect();    
    }
    
     public void signInUser(User user) throws ExceptionsTechShop, SQLException, ClassNotFoundException {//Insert user
        conect();
        if (existsUser(user)) {
            throw new ExceptionsTechShop("ERROR: User alredy exists with these email");
        }
        String insert = "insert into user values (null, ?, ?, null, null);";
        PreparedStatement ps = conn.prepareStatement(insert);
        ps.setString(1, user.getEmail());
        ps.setString(2, user.getPassword());
        ps.executeUpdate();
        ps.close();
        desconect();
    }
     
     // ----------------------------- Select ----------------------------->
     
     public List<TopUser> topUsers() throws SQLException, ClassNotFoundException{
        conect();
        String query = "select email, sum(product.price) from transaction inner join user on user = iduser inner join product on product = idproduct group by user order by sum(product.price) desc";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);
        List <TopUser> users = new ArrayList<>();
        while(rs.next()){
            TopUser user = new TopUser();
            user.setEmail(rs.getString("email"));
            user.setSpentMoney(rs.getInt("sum(product.price)"));
            users.add(user);
        }
        rs.close();
        st.close();
        desconect();
        return users;
     }
     
     public List<User> allUsers() throws SQLException, ClassNotFoundException{
        conect();
        String query = "select * from user";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);
        List <User> users = new ArrayList<>();
        while(rs.next()){
            User user = new User();
            user.setIduser(rs.getInt("iduser"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setPremium(rs.getInt("premium"));
            user.setAdmin(rs.getInt("admin"));
            users.add(user);
        }
        rs.close();
        st.close();
        desconect();
        return users;
     }
     
     public List <Product> filterTable(String categories, String order) throws SQLException, ClassNotFoundException {
        conect();
        String orderAux = "ASC";
        String select;
        if (categories != null || order != null) {
            
            if (order == "low") {
                orderAux = "ASC";
            } else if (order == "highest") {
                orderAux = "DESC";
            }
            
            select = "select * from product where category='" + categories + "' order by price "+ orderAux +"";
        } else if (categories != null) {
            select = "select * from product where category='" + categories + "'";
        } else if (order != null) {
            
            if (order == "low") {
                orderAux = "ASC";
            } else if (order == "highest") {
                orderAux = "DESC";
            }
            select = "select * from product order by price " + orderAux + "";
        } else return null;
        
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(select);
        List <Product> products = new ArrayList<>();
        
        while (rs.next()){
            Product product = new Product();
            product.setIdproduct(rs.getInt("idproduct"));
            product.setName(rs.getString("name"));
            product.setCategory(rs.getString("category"));
            product.setDescription(rs.getString("description"));
            product.setPrice(rs.getInt("price"));
            products.add(product);
        }
        rs.close();
        st.close();
        desconect();
        
        return products;
     }
          
     public Product allProductData(String idProduct) throws SQLException, ClassNotFoundException {
        conect();
        String select = "select * from product where idproduct='" + idProduct + "'";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(select);
        Product aux = new Product();
        while (rs.next()){
            aux.setIdproduct(rs.getInt("idproduct"));
            aux.setName(rs.getString("name"));
            aux.setCategory(rs.getString("category"));
            aux.setDescription(rs.getString("description"));
            aux.setPrice(rs.getInt("price"));
        }
        rs.close();
        st.close();
        desconect();
        return aux;
    }
     
     public List <Product> allProducts() throws SQLException, ClassNotFoundException{
        conect();
        String query = "select * from product";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);
        List <Product> products = new ArrayList<>();
        while(rs.next()){
            Product product = new Product();
            product.setIdproduct(rs.getInt("idproduct"));
            product.setName(rs.getString("name"));
            product.setCategory(rs.getString("category"));
            product.setDescription(rs.getString("description"));
            product.setPrice(rs.getInt("price"));
            products.add(product);
        }
        rs.close();
        st.close();
        desconect();
        return products;
     }
     
     public User allUserData(String email) throws SQLException, ClassNotFoundException {
        conect();
        String select = "select * from user where email='" + email + "'";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(select);
        User aux = new User();
        while (rs.next()){
            aux.setIduser(rs.getInt("iduser"));
            aux.setEmail(rs.getString("email"));
            aux.setPassword(rs.getString("password"));
            aux.setPremium(rs.getInt("admin"));
            aux.setAdmin(rs.getInt("admin"));
        }
        rs.close();
        st.close();
        desconect();
        return aux;
    }
          
     public boolean logInUser(User user) throws SQLException, ClassNotFoundException {
        conect();
        String select = "select * from user where email='" + user.getEmail()+ "' and password='" + user.getPassword() + "'";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(select);
        boolean exists = false;
        if (rs.next()) {
            exists = true;
        }
        rs.close();
        st.close();
        desconect();
        return exists;
    }
     
     //Verificate product exists
     private boolean existsProduct(Product product) throws SQLException, ClassNotFoundException {
        String select = "select * from product where idproduct ='" + product.getIdproduct() + "'";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(select);
        boolean exists = false;
        if (rs.next()) {
            exists = true;
        }
        rs.close();
        st.close();
        return exists;
    }
     
     //Verificate user exists
     private boolean existsUser(User user) throws SQLException, ClassNotFoundException {
        String select = "select * from user where email='" + user.getEmail()+ "'";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(select);
        boolean exists = false;
        if (rs.next()) {
            exists = true;
        }
        rs.close();
        st.close();
        return exists;
    }
    
    // ----------------------------- Conectar / Desconectar ----------------------------->
    public void conect() throws SQLException, ClassNotFoundException {
        String url = "jdbc:mysql://localhost:3306/techShop";
        String user = "root";
        String pass = "root";
            Class.forName("com.mysql.jdbc.Driver");
        conn = (Connection) DriverManager.getConnection(url, user, pass);
    }

    public void desconect() throws SQLException {
        if (conn != null) {
            conn.close();
        }
    }
    //---------------------------------------------------------------------------------->
}
