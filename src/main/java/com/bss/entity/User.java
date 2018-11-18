package com.bss.entity;

import java.util.Date;

public class User {
    private String userId;

    private String user_name;

    private String user_passwd;

    private Date passwd_modify_date;

    private String phone;

    private String email;

    private Date create_date;

    private String status;

    private String is_super_admin;

    private String note;

    private String operator_code;

    private String errInfo;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_passwd() {
        return user_passwd;
    }

    public void setUser_passwd(String user_passwd) {
        this.user_passwd = user_passwd;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public String getIs_super_admin() {
        return is_super_admin;
    }

    public void setIs_super_admin(String is_super_admin) {
        this.is_super_admin = is_super_admin;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getOperator_code() {
        return operator_code;
    }

    public void setOperator_code(String operator_code) {
        this.operator_code = operator_code;
    }

    public String getErrInfo() {
        return errInfo;
    }

    public void setErrInfo(String errInfo) {
        this.errInfo = errInfo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getPasswd_modify_date() {
        return passwd_modify_date;
    }

    public void setPasswd_modify_date(Date passwd_modify_date) {
        this.passwd_modify_date = passwd_modify_date;
    }
}