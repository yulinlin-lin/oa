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
@TableName("t_majortype")
public class Majortype {
  @TableId(value = "id",type = IdType.AUTO)//指定自增策略
  private Integer id;

  @TableField(value = "majortype")
  private String majortype;




}
