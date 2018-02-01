package com.ssm.entity;

import java.util.Date;

/**
 * Created by Zeya Kong
 * On 2017/11/20 14:50.
 */
public class Request {
    private int requestId;
    private int managerId;
    private String requestName;
    private String requestDetails;
    private String requestLocation;
    private int requestNeedNumber;
    private String requestStartTime;
    private String requestEndTime;

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public int getManagerId() {
        return managerId;
    }

    public void setManagerId(int managerId) {
        this.managerId = managerId;
    }

    public String getRequestName() {
        return requestName;
    }

    public void setRequestName(String requestName) {
        this.requestName = requestName;
    }

    public String getRequestDetails() {
        return requestDetails;
    }

    public void setRequestDetails(String requestDetails) {
        this.requestDetails = requestDetails;
    }

    public String getRequestLocation() {
        return requestLocation;
    }

    public void setRequestLocation(String requestLocation) {
        this.requestLocation = requestLocation;
    }

    public int getRequestNeedNumber() {
        return requestNeedNumber;
    }

    public void setRequestNeedNumber(int requestNeedNumber) {
        this.requestNeedNumber = requestNeedNumber;
    }

    public String getRequestStartTime() {
        return requestStartTime;
    }

    public void setRequestStartTime(String requestStartTime) {
        this.requestStartTime = requestStartTime;
    }

    public String getRequestEndTime() {
        return requestEndTime;
    }

    public void setRequestEndTime(String requestEndTime) {
        this.requestEndTime = requestEndTime;
    }

    @Override
    public String toString() {
        return "Request{" +
                "requestId=" + requestId +
                ", managerId=" + managerId +
                ", requestName='" + requestName + '\'' +
                ", requestDetails='" + requestDetails + '\'' +
                ", requestLocation='" + requestLocation + '\'' +
                ", requestNeedNumber=" + requestNeedNumber +
                ", requestStartTime=" + requestStartTime +
                ", requestEndTime=" + requestEndTime +
                '}';
    }
}
