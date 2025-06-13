package user;

public class User {

    private String userID, name, address, roles, password, email, ICnum, contact;

    public User(String name, String address, String ICnum, String roles, String contact, String email,String password) {
        this.name = name;
        this.address = address;
        this.ICnum = ICnum;
        this.roles = roles;
        this.email = email;
        this.contact = contact;
        this.password = password;
    }

    // Getters only (you can add setters if you want)
    public String getUserID() {
        return userID;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public String getICnum() {
        return ICnum;
    }

    public String getRoles() {
        return roles;
    }

    public String getEmail() {
        return email;
    }

    public String getContact() {
        return contact;
    }

    public String getPassword() {
        return password;
    }
}
