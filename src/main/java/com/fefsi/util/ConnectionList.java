package com.fefsi.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ConnectionList {

    public List<Employee> main() {
        List<Employee> employeesList = new ArrayList<>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tantis", "root", "admin");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select member_id,member_name,membership_no,category,address,dateofbirth,contact_no,dateofenroll,member_image from tantis.member");
            while (rs.next()) {
                Employee employee = new Employee();
                employee.setMemberid(rs.getString("member_id"));
                employee.setMembername(rs.getString("member_name"));
                employee.setMembershipno(rs.getString("membership_no"));
                employee.setCategory(rs.getString("category"));
                employee.setAddress(rs.getString("address"));
                employee.setDateofbirth(rs.getString("dateofbirth"));
                employee.setContactno(rs.getString("contact_no"));
                employee.setDateofenroll(rs.getString("dateofenroll"));
                employee.setMemberimage(rs.getString("member_image")!=null && !rs.getString("member_image").isEmpty()? rs.getString("member_image") :"asdasdasd");
                employeesList.add(employee);
            }

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return employeesList;
    }
}
