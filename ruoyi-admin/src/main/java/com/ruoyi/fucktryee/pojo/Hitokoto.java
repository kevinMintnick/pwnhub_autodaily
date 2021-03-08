package com.ruoyi.fucktryee.pojo;

import lombok.Data;

@Data
public class Hitokoto {
    private int id;
    private String uuid;
    private String hitokoto;
    private String type;
    private String from;
    private String fromWho;
    private String creator;
    private int creatorUid;
    private int reviewer;
    private String commitFrom;
    private String createdAt;
    private int length;
}
