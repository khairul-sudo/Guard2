/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package guard;

import java.sql.Timestamp;

public class PatrolSession {
    private int patrollingSessionID;
    private int guardID;
    private int locationID;
    private Timestamp checkinTime;
    private Timestamp checkoutTime;
    private String summary;
    private String incident;

    public int getPatrollingSessionID() { 
        return patrollingSessionID; 
    }
    public void setPatrollingSessionID(int id) { 
        this.patrollingSessionID = id; 
    }

    public int getGuardID() { 
        return guardID; 
    }
    public void setGuardID(int id) { 
        this.guardID = id; 
    }

    public int getLocationID() { 
        return locationID; 
    }
    public void setLocationID(int id) { 
        this.locationID = id; 
    }

    public Timestamp getCheckinTime() { 
        return checkinTime; 
    }
    public void setCheckinTime(Timestamp t) { 
        this.checkinTime = t; 
    }

    public Timestamp getCheckoutTime() { 
        return checkoutTime; 
    }
    public void setCheckoutTime(Timestamp t) { 
        this.checkoutTime = t; 
    }

    public String getSummary() { 
        return summary == null ? "" : summary; 
    }
    public void setSummary(String s) { 
        this.summary = s; 
    }

    public String getIncident() { 
        return incident == null ? "" : incident; 
    }
    public void setIncident(String s) { 
        this.incident = s; 
    }
}

