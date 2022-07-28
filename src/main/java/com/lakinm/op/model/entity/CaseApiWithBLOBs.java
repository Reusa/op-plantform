package com.lakinm.op.model.entity;

public class CaseApiWithBLOBs extends CaseApi {
    private String header;

    private String body;

    private String query;

    private String rest;

    private String assertion;

    private String relation;

    private String controller;

    public String getHeader() {
        return header;
    }

    public void setHeader(String header) {
        this.header = header == null ? null : header.trim();
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body == null ? null : body.trim();
    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query == null ? null : query.trim();
    }

    public String getRest() {
        return rest;
    }

    public void setRest(String rest) {
        this.rest = rest == null ? null : rest.trim();
    }

    public String getAssertion() {
        return assertion;
    }

    public void setAssertion(String assertion) {
        this.assertion = assertion == null ? null : assertion.trim();
    }

    public String getRelation() {
        return relation;
    }

    public void setRelation(String relation) {
        this.relation = relation == null ? null : relation.trim();
    }

    public String getController() {
        return controller;
    }

    public void setController(String controller) {
        this.controller = controller == null ? null : controller.trim();
    }
}