package user;

public class Visitor {
    private int id;
    private String name;
    private String ic;
    private String address;
    private String purpose;
    private String userID; // Add this field

    // Constructors
    public Visitor() {}
    public Visitor(String name, String ic, String address, String purpose) {
        this.name = name;
        this.ic = ic;
        this.address = address;
        this.purpose = purpose;
    }

    // Getters and Setters for all fields, including userID
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getIc() { return ic; }
    public void setIc(String ic) { this.ic = ic; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getPurpose() { return purpose; }
    public void setPurpose(String purpose) { this.purpose = purpose; }

    public String getUserID() { return userID; }
    public void setUserID(String userID) { this.userID = userID; }
}