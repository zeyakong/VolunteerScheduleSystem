package com.ssm.entity;

/**
 * Created by Zeya Kong
 * On 2017/11/20 14:50.
 */
public class Wait {
    private int waitId;
    private int requestId;
    private int volunteerId;

    public int getWaitId() {
        return waitId;
    }

    public void setWaitId(int waitId) {
        this.waitId = waitId;
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public int getVolunteerId() {
        return volunteerId;
    }

    public void setVolunteerId(int volunteerId) {
        this.volunteerId = volunteerId;
    }

    @Override
    public String toString() {
        return "Wait{" +
                "waitListId=" + waitId +
                ", requestId=" + requestId +
                ", volunteerId=" + volunteerId +
                '}';
    }
}
