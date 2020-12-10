package com.sgu.controller;

import com.sgu.domain.Message;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * @author huang
 * @date 2020/12/2 9:10
 */
@Controller
public class UploadController {


    /***
     * 下面的file 这个名字一定要叫什么file; layui组件已定；
     * @param file
     * @return
     */
    @ResponseBody
    @RequestMapping("/photoupload")
    public Message photoupload(MultipartFile file, HttpSession session){
        String filename = file.getOriginalFilename();
        filename = UUID.randomUUID().toString().replace("-", "")+"_"+filename;

        System.out.println(filename);
        String path = session.getServletContext().getRealPath("/media/uploads");
        File f = new File(path);
        if (!f.exists()){
            f.mkdirs();
        }

//        把文件写到已经编译好的文件中去；
        try {
            file.transferTo(new File(f,filename));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return new Message(0,filename);
    }


    /***
     * 更改头像
     * @return
     */
    @RequestMapping("/updatephoto")
    public String updatephoto(){
        return "";
    }

}
