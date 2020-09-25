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
@ApiModel(value="SysRoleTable对象", description="")
public class SysRoleTable implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "role_id", type = IdType.AUTO)
    private String roleId;

    @ApiModelProperty(value = "角色ID")
    private String roleName;

    @ApiModelProperty(value = "描述")
    private String description;


}
