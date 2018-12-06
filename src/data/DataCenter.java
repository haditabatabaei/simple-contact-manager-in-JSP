package data;

import javax.xml.crypto.Data;
import java.io.*;
import java.util.ArrayList;

public class DataCenter {
    private static DataCenter instance;
    private ArrayList<Account> accountArrayList;
    File accountsFile;

    public DataCenter() {
        accountArrayList = new ArrayList<>();
        accountsFile = new File("C:\\Users\\Hadi-PC\\Desktop\\accounts.txt");
        try {
            accountsFile.createNewFile();
            BufferedReader reader = new BufferedReader(new FileReader(accountsFile));
            String line;
            while ((line = reader.readLine()) != null) {
                String currentUsername = line.split(":")[0];
                String currentPassword = line.split(":")[1];
                accountArrayList.add(new Account(currentUsername, currentPassword));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static DataCenter getInstance() {
        if (instance == null) {
            synchronized (DataCenter.class) {
                if (instance == null)
                    instance = new DataCenter();
            }
        }
        return instance;
    }

    public ArrayList<Account> getAccountArrayList() {
        return accountArrayList;
    }

    public boolean registerAccount(String username, String password) {
        for (Account account : accountArrayList) {
            if (account.getUsername().equals(username)) {
                return false;
            }
        }
        if (password.length() < 4) {
            return false;
        }
        Account accountToReg = new Account(username, password);


        try {
            FileWriter fileWriter = new FileWriter(accountsFile, true);
            String toWrite = accountToReg.getUsername() + ":" + accountToReg.getPassword() + "\n";
            fileWriter.append(toWrite);
            fileWriter.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        accountArrayList.add(accountToReg);
        return true;
    }

    public boolean login(String username, String password) {
        for (Account account : accountArrayList) {
            System.out.println("inside datacenter login block : " + account.getUsername() + " " + account.getPassword());
            if (account.getUsername().equals(username))
                if (account.getPassword().equals(password))
                    return true;
        }
        return false;
    }
}
