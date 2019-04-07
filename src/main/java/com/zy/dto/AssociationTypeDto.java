package com.zy.dto;

import com.zy.entity.Type;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AssociationTypeDto {
    private List<Type> rows;
    private Integer total;
}
