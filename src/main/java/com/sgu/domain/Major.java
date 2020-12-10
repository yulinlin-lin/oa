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
@TableName("t_major")
public class Major {
  @TableId(value = "id",type = IdType.AUTO)//指定自增策略
  private Integer id;

  @TableField(value = "major_name")
  private String majorName;

  @TableField(value = "major_time")
  private String majorTime;

  @TableField(value = "major_date")
  private String majorDate;

  @TableField(value = "major_type")
  private Integer majorType;

  @TableField(value = "major_delete")
  private Integer majorDelete;


  /**
   * 数据库不存在的数据字段
   */
  @TableField(exist = false)
  private Majortype t;




}
