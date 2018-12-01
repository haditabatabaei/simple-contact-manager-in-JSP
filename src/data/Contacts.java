package data;

import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Random;

public class Contacts {
    ArrayList<Contact> contactsArrayList;
    File file;

    public Contacts(ArrayList<Contact> contactsArrayList) {
        this.contactsArrayList = contactsArrayList;
    }

    private String generatePhoneNumber() {
        StringBuilder builder = new StringBuilder();
        Random randomGen = new Random();
        builder.append("09");
        for (int i = 0; i < 9; i++) {
            builder.append(randomGen.nextInt(9));
        }
        return builder.toString();
    }

    public Contacts(File file) {
        //getting contacts from a database ( here is file which we created before )
        if (file.exists()) {
            System.out.println("contacts file exists");
        } else {
            System.out.println("contacts file doesn't exist creating now");
//            file = new File("C:\\Users\\Hadi-PC\\Desktop\\contacts.txt");
            try {
                file.createNewFile();
                System.out.println("file created");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        this.file = file;

        contactsArrayList = new ArrayList<>();
        try {
            BufferedReader reader = new BufferedReader(new FileReader(file));
            String line;
            while ((line = reader.readLine()) != null) {
                contactsArrayList.add(new Contact(line.split(":")[0], line.split(":")[1]));
            }
            reader.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public Contacts() {
        //adding test contacts to file
        file = new File("C:\\Users\\Hadi-PC\\Desktop\\contacts.txt");
        try {
            Random randomGen = new Random();
            file.createNewFile();
            System.out.println("---------------------- contact file created.");
            FileWriter writer = new FileWriter(file);
            for (int i = 0; i < 20; i++) {
                String toWrite = i + "FirstName" + randomGen.nextInt(100) + " LastName" + randomGen.nextInt(100) + ":" + generatePhoneNumber() + "\n";
                writer.append(toWrite);
            }
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        //getting contacts from a database ( here is file which we created before )
        contactsArrayList = new ArrayList<>();
        try {
            BufferedReader reader = new BufferedReader(new FileReader(file));
            String line;
            while ((line = reader.readLine()) != null) {
                contactsArrayList.add(new Contact(line.split(":")[0], line.split(":")[1]));
            }
            reader.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Contact> getContactsArrayList() {
        return contactsArrayList;
    }

    public boolean hasContact(String name, String phone) {
        for (Contact contact : contactsArrayList) {
            if (contact.getPhoneNum().equals(phone) && contact.getName().equals(name))
                return true;
        }
        return false;
    }

    public boolean addContact(String name, String phone) {
        if (hasContact(name, phone) || name.isEmpty() || phone.isEmpty()) {
            return false;
        } else {
            try {
                BufferedWriter writer = new BufferedWriter(new FileWriter(file, true));
                String toWrite = name + ":" + phone + "\n";
                contactsArrayList.add(new Contact(name, phone));
//                writer.newLine();
                writer.append(toWrite);
                writer.flush();
                writer.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return true;
        }
    }

    public boolean editContact(int index,String newName,String newPhone){
        Contact toEdit = contactsArrayList.get(index);
        toEdit.setName(newName);
        toEdit.setPhoneNum(newPhone);
        reWriteContactList();
        return true;
    }

    private void reWriteContactList(){
        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter(file));
            StringBuilder builder = new StringBuilder();
            for (Contact contact : contactsArrayList) {
                builder.append(contact.toString() + "\n");
            }
            writer.write(builder.toString());
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public boolean removeIndex(int index) {
        if (contactsArrayList.size() > 0) {
            contactsArrayList.remove(index);
            reWriteContactList();
            return true;
        } else
            return false;
    }
}
