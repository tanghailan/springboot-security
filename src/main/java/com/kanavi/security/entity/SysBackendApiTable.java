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
@ApiModel(value="SysBackendApiTable对象", description="")
public class SysBackendApiTable implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "backend_api_id", type = IdType.AUTO)
    private String backendApiId;

    @ApiModelProperty(value = "API名称")
    private String backendApiName;

    @ApiModelProperty(value = "API请求地址")
    private String backendApiUrl;

    @ApiModelProperty(value = "API请求方式：GET、POST、PUT、DELETE")
    private String backendApiMethod;

    @ApiModelProperty(value = "父ID")
    private String pid;

    @ApiModelProperty(value = "排序")
    private Integer backendApiSort;

    @ApiModelProperty(value = "描述")
    private String description;


}
