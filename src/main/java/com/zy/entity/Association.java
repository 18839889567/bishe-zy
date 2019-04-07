package com.zy.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Association {
    private Integer id;
    @Column(name = "associationName")
    private String genre;
    private String proprieterName;
    private Integer proprieterId;
    private String proprieterPhone;
    private String picture;
    private String synopsis;
    private Integer number;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date createDate;
}
