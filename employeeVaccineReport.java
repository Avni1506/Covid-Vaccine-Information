package com.reports;

import java.sql.*;
import com.covid.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itextpdf.text.Rectangle;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
/**
 * Servlet implementation class employeeVaccineReport
 */
@WebServlet("/employeeVaccineReport")
public class employeeVaccineReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Font TIME_ROMAN = new Font(Font.FontFamily.TIMES_ROMAN, 28, Font.BOLD);
	private static Font TIME_ROMAN_SMALL = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/pdf");
		Rectangle pageSize=new Rectangle(1000,550);
		Document document = new Document(pageSize);
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("user");
		try
		{
			
			Connection c=DatabaseConnection.getConnection();
			Statement s=c.createStatement();
			ResultSet r=s.executeQuery("select * from dependent_details D inner join vaccine_details V where (D.RID=V.P_ID) and D.E_ID='"+id+"'");
			PdfWriter writer=PdfWriter.getInstance(document, response.getOutputStream());
		    document.open();
		    Paragraph para=new Paragraph("Covid / Vaccine Information",TIME_ROMAN);
		    para.setAlignment(Element.ALIGN_CENTER);
		    document.add(para);
		    Paragraph para1=new Paragraph("");
		    document.add(para1);
		    Paragraph para2=new Paragraph("");
		    document.add(para2);
		    Paragraph para3=new Paragraph("Vaccine Details",TIME_ROMAN_SMALL);
		    para3.setAlignment(Element.ALIGN_CENTER);
		    document.add(para3);
		    Paragraph para4=new Paragraph("");
		    document.add(para4);
		    Paragraph para5=new Paragraph("");
		    document.add(para5);
		    Paragraph para6=new Paragraph("Date: "+java.time.LocalDate.now(),TIME_ROMAN_SMALL);
		    document.add(para6);
		    Paragraph para7=new Paragraph("");
		    document.add(para7);
		    Paragraph para8=new Paragraph("");
		    document.add(para8);
		    Paragraph para9=new Paragraph("");
		    document.add(para9);
		    Paragraph para10=new Paragraph("");
		    document.add(para10);
		    PdfPTable table = new PdfPTable(11); // 11 columns.
		    table.setWidthPercentage(100); //Width 100%
		    table.setSpacingBefore(5); //Space before table
		    table.setSpacingAfter(5); //Space after table

		   //Set Column widths
		    float[] columnWidths = {15f,30f,30f,30f,20f,25f,30f,25f,20f,25f,20f};
		    table.setWidths(columnWidths); 

		    

		    PdfPCell cell2 = new PdfPCell(new Paragraph("EID"));
		    cell2.setBorderColor(BaseColor.BLACK);
		    cell2.setPaddingLeft(10);
		    cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
		    cell2.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    table.addCell(cell2);
		    
		    
		    
		    PdfPCell cell4 = new PdfPCell(new Paragraph("Relation"));
		    cell4.setBorderColor(BaseColor.BLACK);
		    cell4.setPaddingLeft(10);
		    cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
		    cell4.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    table.addCell(cell4);
		    
		    PdfPCell cell5 = new PdfPCell(new Paragraph("First Name"));
		    cell5.setBorderColor(BaseColor.BLACK);
		    cell5.setPaddingLeft(10);
		    cell5.setHorizontalAlignment(Element.ALIGN_CENTER);
		    cell5.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    table.addCell(cell5);
		    
		    PdfPCell cell6 = new PdfPCell(new Paragraph("Last Name"));
		    cell6.setBorderColor(BaseColor.BLACK);
		    cell6.setPaddingLeft(10);
		    cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		    cell6.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    table.addCell(cell6);
		    
		    PdfPCell cell7 = new PdfPCell(new Paragraph("Gender"));
		    cell7.setBorderColor(BaseColor.BLACK);
		    cell7.setPaddingLeft(10);
		    cell7.setHorizontalAlignment(Element.ALIGN_CENTER);
		    cell7.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    table.addCell(cell7);
		    
		    
		    PdfPCell cell8 = new PdfPCell(new Paragraph("DOB"));
		    cell8.setBorderColor(BaseColor.BLACK);
		    cell8.setPaddingLeft(10);
		    cell8.setHorizontalAlignment(Element.ALIGN_CENTER);
		    cell8.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    table.addCell(cell8);
		    
		    PdfPCell cell9 = new PdfPCell(new Paragraph("Vaccine Name"));
		    cell9.setBorderColor(BaseColor.BLACK);
		    cell9.setPaddingLeft(10);
		    cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
		    cell9.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    table.addCell(cell9);
		    
		    
		    PdfPCell cell10 = new PdfPCell(new Paragraph("Dose1 Date"));
		    cell10.setBorderColor(BaseColor.BLACK);
		    cell10.setPaddingLeft(10);
		    cell10.setHorizontalAlignment(Element.ALIGN_CENTER);
		    cell10.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    table.addCell(cell10);
		    
		    PdfPCell cell11 = new PdfPCell(new Paragraph("Dose1 Place Code"));
		    cell11.setBorderColor(BaseColor.BLACK);
		    cell11.setPaddingLeft(10);
		    cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		    cell11.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    table.addCell(cell11);
		    
		    PdfPCell cell12 = new PdfPCell(new Paragraph("Dose2 Date"));
		    cell12.setBorderColor(BaseColor.BLACK);
		    cell12.setPaddingLeft(10);
		    cell12.setHorizontalAlignment(Element.ALIGN_CENTER);
		    cell12.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    table.addCell(cell12);
		    
		    PdfPCell cell13 = new PdfPCell(new Paragraph("Dose2 Place Code"));
		    cell13.setBorderColor(BaseColor.BLACK);
		    cell13.setPaddingLeft(10);
		    cell13.setHorizontalAlignment(Element.ALIGN_CENTER);
		    cell13.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    table.addCell(cell13);
		    
		    
		    table.setHeaderRows(1);
		   
		    while(r.next()){
		    	table.addCell(r.getString(2));
		    	table.addCell(r.getString(3));
		    	table.addCell(r.getString(4));
		    	table.addCell(r.getString(5));
		    	table.addCell(r.getString(6));
		    	table.addCell(r.getString(7));
		    	table.addCell(r.getString(10));
		    	table.addCell(r.getString(11));
		    	table.addCell(r.getString(12));
		    	table.addCell(r.getString(13));
		    	table.addCell(r.getString(14));
		    	
		    }
		    document.add(table);

		    document.close();
		    writer.close();
		} catch (Exception e)
		{
		    e.printStackTrace();
		}
	}

}
