package data;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class Account {
    private String username;
    private String password;
    private ArrayList<HttpSession> sessionArrayList;

    public Account(String username, String password) {
        this.password = password;
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public ArrayList<HttpSession> getSessionArrayList() {
        return sessionArrayList;
    }

    public void setSessionArrayList(ArrayList<HttpSession> sessionArrayList) {
        this.sessionArrayList = sessionArrayList;
    }
}
