package com.PhoenixHospital.admin.vo;

import com.PhoenixHospital.attach.vo.AttachVO;

import java.util.List;

public class AdminBoardVO {
    private int boNo;
    private String boTitle;
    private String categoryCode;
    private String boContents;
    private String boWriter;
    private int boHit;
    private String boRegDat;
    private String boModDate;
    private String boDelYn;
    private String atchNo;
    private String boPass;

    private List<AttachVO> attaches;
    private int[] delAtchNos;


    public List<AttachVO> getAttaches() {
        return attaches;
    }

    public void setAttaches(List<AttachVO> attaches) {
        this.attaches = attaches;
    }

    public int[] getDelAtchNos() {
        return delAtchNos;
    }

    public void setDelAtchNos(int[] delAtchNos) {
        this.delAtchNos = delAtchNos;
    }

    public int getBoNo() {
        return boNo;
    }

    public void setBoNo(int boNo) {
        this.boNo = boNo;
    }

    public String getBoTitle() {
        return boTitle;
    }

    public void setBoTitle(String boTitle) {
        this.boTitle = boTitle;
    }

    public String getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode;
    }

    public String getBoContents() {
        return boContents;
    }

    public void setBoContents(String boContents) {
        this.boContents = boContents;
    }

    public String getBoWriter() {
        return boWriter;
    }

    public void setBoWriter(String boWriter) {
        this.boWriter = boWriter;
    }

    public int getBoHit() {
        return boHit;
    }

    public void setBoHit(int boHit) {
        this.boHit = boHit;
    }

    public String getBoRegDat() {
        return boRegDat;
    }

    public void setBoRegDat(String boRegDat) {
        this.boRegDat = boRegDat;
    }

    public String getBoModDate() {
        return boModDate;
    }

    public void setBoModDate(String boModDate) {
        this.boModDate = boModDate;
    }

    public String getBoDelYn() {
        return boDelYn;
    }

    public void setBoDelYn(String boDelYn) {
        this.boDelYn = boDelYn;
    }

    public String getAtchNo() {
        return atchNo;
    }

    public void setAtchNo(String atchNo) {
        this.atchNo = atchNo;
    }

    public String getBoPass() {
        return boPass;
    }

    public void setBoPass(String boPass) {
        this.boPass = boPass;
    }
}
