package com.sgu.utils;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *      导出为Excel文件的工具类
 *
 *
 * @author huang
 * @date 2020/12/4 10:28
 */
public class ExcelUtil {

    /***
     *
     * @param sheetName   选项卡的名称
     * @param cells_names  列名  它是一个一维数组
     * @param values       每一个单元格中的数据信息；
     * @return
     */
    public static Workbook getWorkbook(String sheetName,String[] cells_names,String[][] values){
        //        创建工作book
        Workbook wb = new XSSFWorkbook();

//        创建选项卡
        Sheet sheet = wb.createSheet(sheetName);

//        创建第一行的信息
        Row first_row = sheet.createRow(0);

//        给表头写信息；
        for (int i = 0; i < cells_names.length; i++) {
            Cell cell = first_row.createCell(i);
            cell.setCellValue(cells_names[i]);
        }

//        声明一行
        Row row = null;
//        声明单元格
        Cell cell = null;

        //创建内容
        for(int i=0;i<values.length;i++){
            row = sheet.createRow(i + 1);
            for(int j=0;j<values[i].length;j++){
                //将内容按顺序赋给对应的列对象
                row.createCell(j).setCellValue(values[i][j]);
            }
        }
        return wb;
    }


}
