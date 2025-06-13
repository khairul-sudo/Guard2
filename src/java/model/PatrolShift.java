/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class PatrolShift {
    private int patrolShiftID;
    private String startTime;
    private String endTime;
    private int guardID;
    private int adminID;

    // Getters and Setters
    public int getPatrolShiftID() { return patrolShiftID; }
    public void setPatrolShiftID(int patrolShiftID) { this.patrolShiftID = patrolShiftID; }

    public String getStartTime() { return startTime; }
    public void setStartTime(String startTime) { this.startTime = startTime; }

    public String getEndTime() { return endTime; }
    public void setEndTime(String endTime) { this.endTime = endTime; }

    public int getGuardID() { return guardID; }
    public void setGuardID(int guardID) { this.guardID = guardID; }

    public int getAdminID() { return adminID; }
    public void setAdminID(int adminID) { this.adminID = adminID; }
}