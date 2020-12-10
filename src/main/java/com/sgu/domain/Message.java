package com.sgu.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author huang
 * @date 2020/11/30 15:33
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Message {
    private Integer code;
    private String msg;

}
