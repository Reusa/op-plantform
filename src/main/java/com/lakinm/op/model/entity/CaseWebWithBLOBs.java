package com.lakinm.op.model.entity;

public class CaseWebWithBLOBs extends CaseWeb {
    private String element;

    private String data;

    public String getElement() {
        return element;
    }

    public void setElement(String element) {
        this.element = element == null ? null : element.trim();
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data == null ? null : data.trim();
    }
}