package com.kanavi.security.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author My
 * @since 2020-09-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="SysFrontendMenuTable对象", description="")
public class SysFrontendMenuTable implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "frontend_menu_id", type = IdType.AUTO)
    private String frontendMenuId;

    @ApiModelProperty(value = "前端菜单名称")
    private String frontendMenuName;

    @ApiModelProperty(value = "前端菜单访问HTML地址")
    private String frontendMenuUrl;

    @ApiModelProperty(value = "父ID")
    private String pid;

    @ApiModelProperty(value = "排序")
    private Integer frontendMenuSort;

    @ApiModelProperty(value = "描述")
    private String description;


}
