package com.ssm.entity;

/**
 * Created by Zeya Kong
 * On 2017/11/20 14:51.
 */
public class Success {
    private int successId;
    private int volunteerId;
    private int requestId;

    public int getSuccessId() {
        return successId;
    }

    public void setSuccessId(int successId) {
        this.successId = successId;
    }

    public int getVolunteerId() {
        return volunteerId;
    }

    public void setVolunteerId(int volunteerId) {
        this.volunteerId = volunteerId;
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    @Override
    public String toString() {
        return "Success{" +
                "successId=" + successId +
                ", volunteerId=" + volunteerId +
                ", requestId=" + requestId +
                '}';
    }
}
