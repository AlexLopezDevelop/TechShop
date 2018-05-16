/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aux;
/**
 *
 * @author alexlopez
 */
public class TopUser {
    String email;
    int spentMoney;

    TopUser(String email, int spentMoney) {
        this.email = email;
        this.spentMoney = spentMoney;
    }

    public TopUser() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getSpentMoney() {
        return spentMoney;
    }

    public void setSpentMoney(int spentMoney) {
        this.spentMoney = spentMoney;
    }
    
    
}
