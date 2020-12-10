package com.sgu.domain;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.beans.Transient;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@TableName("t_student")
public class Student {
  @TableId(value = "id",type = IdType.AUTO)//指定自增策略
  private Integer id;
  private String no;
  private String name;
  private String sex;
  private String birthday;
  private String cardno;
  private String school;
  private String education;
  @TableField("class_id")
  private Integer classId;
  private Integer flag;
  private String email;
  private String qq;
  private String phone;
  private String createdate;
  private String photo;
  private Integer del;

  @TableField(exist = false)
  private Class c;
}
