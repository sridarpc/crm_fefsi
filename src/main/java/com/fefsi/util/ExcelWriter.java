/*
 * package com.fefsi.util;
 * 
 * import java.io.ByteArrayInputStream; import java.io.FileInputStream; import
 * java.io.FileOutputStream; import java.io.IOException; import
 * java.io.InputStream; import java.util.ArrayList; import java.util.List;
 * 
 * import org.apache.commons.codec.binary.Base64; import
 * org.apache.poi.openxml4j.exceptions.InvalidFormatException; import
 * org.apache.poi.ss.usermodel.Cell; import
 * org.apache.poi.ss.usermodel.CellStyle; import
 * org.apache.poi.ss.usermodel.CreationHelper; import
 * org.apache.poi.ss.usermodel.Font; import
 * org.apache.poi.ss.usermodel.IndexedColors; import
 * org.apache.poi.ss.usermodel.Row; import org.apache.poi.ss.usermodel.Sheet;
 * import org.apache.poi.ss.usermodel.Workbook; import
 * org.apache.poi.util.IOUtils; import
 * org.apache.poi.xssf.usermodel.XSSFClientAnchor; import
 * org.apache.poi.xssf.usermodel.XSSFDrawing; import
 * org.apache.poi.xssf.usermodel.XSSFPicture; import
 * org.apache.poi.xssf.usermodel.XSSFWorkbook;
 * 
 * public class ExcelWriter { private static String[] columns = { "S No",
 * "name", "m_no", "category", "address", "date of birth", "contact no",
 * "date of enroll", "memberimage" };
 * 
 * // Initializing employees data to insert into the excel file
 * 
 * public static void main(String[] args) throws IOException,
 * InvalidFormatException { // Create a Workbook ConnectionList connectionList =
 * new ConnectionList(); List<Employee> employees = connectionList.main();
 * Workbook workbook = new XSSFWorkbook(); // new HSSFWorkbook() for //
 * generating `.xls` file
 * 
 * 
 * CreationHelper helps us create instances of various things like DataFormat,
 * Hyperlink, RichTextString etc, in a format (HSSF, XSSF) independent way
 * 
 * CreationHelper createHelper = workbook.getCreationHelper();
 * 
 * // Create a Sheet Sheet sheet = workbook.createSheet("Tantis");
 * 
 * // Create a Font for styling header cells Font headerFont =
 * workbook.createFont(); headerFont.setFontHeightInPoints((short) 14);
 * headerFont.setColor(IndexedColors.RED.getIndex());
 * 
 * // Create a CellStyle with the font CellStyle headerCellStyle =
 * workbook.createCellStyle(); headerCellStyle.setFont(headerFont);
 * 
 * // Create a Row Row headerRow = sheet.createRow(0);
 * 
 * // Create cells for (int i = 0; i < columns.length; i++) { Cell cell =
 * headerRow.createCell(i); cell.setCellValue(columns[i]);
 * cell.setCellStyle(headerCellStyle); }
 * 
 * // Create Other rows and cells with employees data int rowNum = 1; for
 * (Employee employee : employees) { Row row = sheet.createRow(rowNum++);
 * row.setHeight((short) 1000);
 * 
 * row.createCell(0).setCellValue(employee.getMemberid());
 * row.createCell(1).setCellValue(employee.getMembername());
 * row.createCell(2).setCellValue(employee.getMembershipno());
 * row.createCell(3).setCellValue(employee.getCategory());
 * row.createCell(4).setCellValue(employee.getAddress());
 * row.createCell(5).setCellValue(employee.getDateofbirth());
 * row.createCell(6).setCellValue(employee.getContactno());
 * row.createCell(7).setCellValue(employee.getDateofenroll());
 * 
 * // ============= Inserting image - START Read input PNG / JPG Image into
 * FileInputStream Object InputStream my_banner_image =
 * getImageFromBase64String(employee.getMemberimage()); Convert picture to be
 * added into a byte array byte[] bytes = IOUtils.toByteArray(my_banner_image);
 * 
 * Add Picture to Workbook, Specify picture type as PNG and Get an Index
 * 
 * int my_picture_id = workbook.addPicture(bytes, Workbook.PICTURE_TYPE_PNG);
 * 
 * Close the InputStream. We are ready to attach the image to workbook now
 * 
 * my_banner_image.close(); Create the drawing container XSSFDrawing drawing =
 * (XSSFDrawing) sheet.createDrawingPatriarch(); Create an anchor point //
 * ============= Inserting image - END
 * 
 * // ========adding image START XSSFClientAnchor my_anchor = new
 * XSSFClientAnchor();
 * 
 * Define top left corner, and we can resize picture suitable from there
 * 
 * 
 * my_anchor.setCol1(8); // Column B my_anchor.setRow1(rowNum - 1); // Row 3
 * my_anchor.setCol2(9); // Column C my_anchor.setRow2(rowNum); // Row 4
 * 
 * Invoke createPicture and pass the anchor point and ID XSSFPicture my_picture
 * = drawing.createPicture(my_anchor, my_picture_id); // ========adding image
 * END }
 * 
 * // Resize all columns to fit the content size for (int i = 0; i <
 * columns.length; i++) { sheet.autoSizeColumn(i); }
 * 
 * // Write the output to a file FileOutputStream fileOut = new
 * FileOutputStream("tantis.xlsx"); workbook.write(fileOut); fileOut.close();
 * 
 * // Closing the workbook workbook.close();
 * 
 * System.out.println("DOne !!!"); } private static ByteArrayInputStream
 * getImageFromBase64String(String newValue) throws IOException {
 * ByteArrayInputStream inputStream = new
 * ByteArrayInputStream(Base64.decodeBase64(newValue)); return inputStream; } }
 */