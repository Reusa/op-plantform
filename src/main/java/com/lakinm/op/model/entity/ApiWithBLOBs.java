package com.lakinm.op.model.entity;

public class ApiWithBLOBs extends Api {
    private String header;

    private String body;

    private String query;

    private String rest;

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
}