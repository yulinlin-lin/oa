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
@TableName("t_class")
public class Class {
  @TableId(value = "id",type = IdType.AUTO)//指定自增策略
  private Integer id;

  @TableField(value = "major_id")
  private Integer majorId;

  @TableField("class_name")
  private String className;

  /**
   * 开班日期
   */
  @TableField("class_date")
  private String classDate;

  /**
   * 班级周期
   */
  @TableField("class_time")
  private String classTime;

  @TableField("class_address")
  private String classAddress;

  @TableField("class_delete")
  private Integer classDelete;


  @TableField(exist = false)
  private String majorName;
  @TableField(exist = false)
  private int classSize;


}
