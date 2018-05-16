/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author alexlopez
 */

public class Transaction {

    private Integer idtransaction;
    private User user;
    private Product product;

    public Transaction() {
    }

    public Transaction(Integer idtransaction) {
        this.idtransaction = idtransaction;
    }

    public Integer getIdtransaction() {
        return idtransaction;
    }

    public void setIdtransaction(Integer idtransaction) {
        this.idtransaction = idtransaction;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
