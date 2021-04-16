package com.ldg.tcm.vo;

import com.ldg.tcm.po.Admin;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Adminvo extends Admin {

    private Integer page;
    private Integer limit;
}
