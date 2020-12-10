package com.sgu.domain;


import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@TableName(value = "sys_user")
public class SysUser {

  @TableId(value = "id",type = IdType.AUTO)
  private Integer id;

  @TableField("departmentId")
  private Integer departmentId;
  @TableField("positionId")
  private Integer positionId;
  @TableField("insideId")
  private Integer insideId;


  private String name;
  private String cornet;
  private String phone;
  private String landline;
  private String imgsrc;


//  @TableField("userName")
  private String userName;
  private String password;
  private Integer state;

  @TableField("createTime")
  private String createTime;

  @TableField("updateTime")
  private String updateTime;
  private String number;
  private String power;




}
