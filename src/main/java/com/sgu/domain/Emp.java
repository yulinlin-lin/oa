package com.sgu.domain;

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
@TableName("t_emp")
public class Emp {

  @TableId(value = "id",type = IdType.AUTO)//指定自增策略
  private Integer id;
  private String no;
  private String pass;
  private String name;
  private Integer did;
  private Integer flag;  //是否激活的状态；
  private String sex;
  private String email;
  private String qq;
  private String phone;
  private String createdate;
  private String photo;
  private Integer del;  //是否已经删除的状态；

}
