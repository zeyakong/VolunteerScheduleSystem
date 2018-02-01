package com.ssm.dto;

/**
 * Created by Zeya Kong
 * On 2017/12/12 2:35.
 */
public class SuccessInfo {
    private int successId;
    private String volunteerUsername;
    private String requestName;

    public int getSuccessId() {
        return successId;
    }

    public void setSuccessId(int successId) {
        this.successId = successId;
    }

    public String getVolunteerUsername() {
        return volunteerUsername;
    }

    public void setVolunteerUsername(String volunteerUsername) {
        this.volunteerUsername = volunteerUsername;
    }

    public String getRequestName() {
        return requestName;
    }

    public void setRequestName(String requestName) {
        this.requestName = requestName;
    }
}
