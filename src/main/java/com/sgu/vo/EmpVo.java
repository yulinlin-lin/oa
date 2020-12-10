package com.sgu.vo;

import com.sgu.domain.Depart;
import com.sgu.domain.Emp;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author huang
 * @date 2020/12/3 9:31
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmpVo extends Emp {

    /**
     * 一对一    一个员工对应一个部门；  要在xml里面进行封闭
     */
    private Depart d;


    @Override
    public String toString() {
        return "EmpVo{" +super.toString()+
                "d=" + d +
                '}';
    }
}
