/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package guard;

import java.io.Serializable;

public class Staff implements Serializable {
    private int administratorAdminID;
    private int guardGuardID;
    private String icNumber;
    private String phoneNumber;

    public Staff() {}

    public int getAdministratorAdminID() {
        return administratorAdminID;
    }
    public void setAdministratorAdminID(int administratorAdminID) {
        this.administratorAdminID = administratorAdminID;
    }

    public int getGuardGuardID() {
        return guardGuardID;
    }
    public void setGuardGuardID(int guardGuardID) {
        this.guardGuardID = guardGuardID;
    }

    public String getIcNumber() {
        return icNumber;
    }
    public void setIcNumber(String icNumber) {
        this.icNumber = icNumber;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
