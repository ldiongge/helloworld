package com.ldg.tcm.po;

import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author 李东阁
 * @since 2021-04-04
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class DbOrder implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private String orderid;

    private Integer uid;

    private Double payPrice;

    private Integer isPay;

    private Date payTime;

    private Integer isShip;

    private Date shipTime;

    private Integer isReceipt;

    private Date receiptTime;

    private String shipNumber;

    private Integer state;

    private Date createtime;

    private Date updatetime;

    private String goodsname;

    private String nums;


}
