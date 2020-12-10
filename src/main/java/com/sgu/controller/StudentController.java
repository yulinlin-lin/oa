package com.sgu.controller;

import com.sgu.domain.Class;
import com.sgu.domain.PageBean;
import com.sgu.domain.Student;
import com.sgu.service.ClassService;
import com.sgu.service.StudentService;
import com.sgu.utils.ExcelUtil;
import com.sgu.utils.TypeUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.aspectj.weaver.ast.Var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @author huang
 * @date 2020/12/3 21:05
 */
@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;

    @RequestMapping("/studentadd")
    public String studentadd(){

//        studentService.in

        return "studentadd";
    }





    @RequestMapping("/queryStudentsPage/{pageNo}/{pageSize}")
    public String queryStudentByPageAndCondition(@PathVariable("pageNo") Integer pageNo,
                                                 @PathVariable("pageSize") Integer pageSize,
                                                 @RequestParam(value = "name",defaultValue = "") String name,
                                                 @RequestParam(value = "classId",defaultValue = "0") int classId,
                                                 Model m){

        HashMap<String, Object> map = new HashMap<>();
        map.put("name",name);
        map.put("classId",classId);
        map.put("pageNo",( pageNo - 1 )* pageSize);
        map.put("pageSize",pageSize);
        List<Student> students =  studentService.queryStudentByPageAndCondition(map);

        HashMap<String, Object> map1 = new HashMap<>();
        map1.put("name",name);
        map1.put("classId",classId);
        int totalCount =  studentService.getTotalPage(map1);

//        查询所有的班级回到页面；

//        把数据封装好返回到页面；
        PageBean<Student> pageBean = new PageBean<>(pageNo,pageSize,totalCount,students);
        m.addAttribute("pb3",pageBean);
        m.addAttribute("name", name);
        m.addAttribute("classId", classId);
        return "studentlist";
    }


    @RequestMapping("/excelImportToDB")
    public String excelImportToDB(MultipartFile file) throws IOException {
        System.out.println(file.getOriginalFilename());

        InputStream is = file.getInputStream();

//        创建工作book;
        Workbook wb = new XSSFWorkbook(is);

//        获得第一个工作表；
        Sheet sheetAt0 = wb.getSheetAt(0);
        ArrayList<Student> list = new ArrayList<>();
        Student student = null;

//        表头不处理，所以从第二行开始；
        for (int i = 1; i <= sheetAt0.getLastRowNum(); i++) {
            student = new Student();
            Row row = sheetAt0.getRow(i);

            if (row == null) {
                continue;
            }
            for (int j = 0; j < row.getLastCellNum(); j++) {
                Cell cell = row.getCell(j);
                String v = TypeUtil.getValue(cell) + "";
                if (j == 0){
                    student.setId(Integer.parseInt(v));
                }else if(j == 1){
                    student.setNo(v);
                }else if(j == 2){
                    student.setName(v);
                }else if(j == 3){
                    student.setSex(v);
                }else if(j == 4){
                    student.setBirthday(v);
                }else if(j == 5){
                    student.setCardno(v);
                }else if(j == 6){
                    student.setSchool(v);
                }else if(j == 7){
                    student.setEducation(v);
                }else if(j == 8){
                    student.setClassId(Integer.parseInt(v));
                }else if(j == 9){
                    student.setFlag(Integer.parseInt(v));
                }else if(j == 10){
                    student.setEmail(v);
                }else if(j == 11){
                    student.setQq(v);
                }else if(j == 12){
                    student.setPhone(v);
                }else if(j == 13){
                    student.setCreatedate(v);
                }else if(j == 14){
                    student.setPhoto(v);
                }else if(j == 15){
                    student.setDel(Integer.parseInt(v));
                }
            }
            System.out.println(student);
            list.add(student);
        }
        System.out.println("list的size:   "+list.size());
        boolean flag = studentService.insertBatch(list);

        System.out.println("批量插入￥￥￥￥￥￥￥￥￥￥￥￥￥￥"+flag);
        return "forward:/queryStudentsPage/1/5";
    }


 /***
     * 导出数据到excel表格
     * @param name
     * @param classId
     * @param m
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping("/dbExportToExcel")
    public List<Student> dbExportToExcel(@RequestParam(value = "name",defaultValue = "") String name,
                                  @RequestParam(value = "classId",defaultValue = "0") int classId,
                                  Model m,
                                  HttpServletResponse response){

        HashMap<String, Object> map1 = new HashMap<>();
        map1.put("name",name);
        map1.put("classId",classId);
        List<Student> students = studentService.dbExportToExcel(map1);

        /*
        拿到数据后
        创建工作薄 - 创建sheet工作选项卡 - 创建行 - 创建表格 - 填充数据；
      */

//        表头信息；
        String[] cells_names = {"id","学号","姓名","性别","生日","身份证号",
                "毕业院校","教育程度","班级ID",
                "激活状态","邮箱","QQ","电话","创建日期","头像","是否删除"};

        String[][] values = new String[students.size()][16];

        for (int i = 0; i < students.size(); i++) {
            Student s = students.get(i);
            values[i][0] = s.getId() + "";
            values[i][1] = s.getNo();
            values[i][2] = s.getName();
            values[i][3] = s.getSex();
            values[i][4] = s.getBirthday();
            values[i][5] = s.getCardno();
            values[i][6] = s.getSchool();
            values[i][7] = s.getEducation();
            values[i][8] = s.getClassId()+"";
            values[i][9] = s.getFlag()+"";
            values[i][10] = s.getEmail();
            values[i][11] = s.getQq();
            values[i][12] = s.getPhone();
            values[i][13] = s.getCreatedate();
            values[i][14] = s.getPhoto();
            values[i][15] = s.getDel()+"";
        }

        Workbook wb = ExcelUtil.getWorkbook("学生信息汇总", cells_names, values);
        try {
            //excel文件名
            String fileName = "学生信息表" + System.currentTimeMillis() + ".xlsx";
            this.setResponseHeader(response, fileName);
            OutputStream os = response.getOutputStream();
            wb.write(os);//响应给客户端
            os.flush();
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return students;
    }



    /**
     * 发送响应流方法
     */
    public void setResponseHeader(HttpServletResponse response, String fileName) {
        try {
            try {
                fileName = new String(fileName.getBytes(), "ISO8859-1");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            //1 、只能提交二进制，而且只能提交一个二进制，如果提交文件的话，只能提交一个文件,后台接收参数只能有一个，而且只能是流（或者字节数组）
            //2、属于HTTP规范中Content-Type的一种
            response.setContentType("application/octet-stream;charset=ISO8859-1");
            //Content-Disposition是以什么方式下载，如attachment为以附件方式下载
            response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
            response.addHeader("Pargam", "no-cache");//设置网页不要存于缓存中
            response.addHeader("Cache-Control", "no-cache");//告知服务器不直接使用缓存，要求向原服务器发起请求
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
