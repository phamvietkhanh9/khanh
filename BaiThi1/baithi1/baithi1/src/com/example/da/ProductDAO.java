package com.example.da;

import com.example.entity.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private String jdbcUrl = "jdbc:mysql://127.0.0.1:3306/fdata?serverTimezone=UTC";
    private String jdbcUsername="root";
    private String jdbcPassWord="";


    private static final String SELECT_ALL_PRODUCT = "SELECT * FROM tbproduct";

    public ProductDAO(){}


    protected Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection connection = null;
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcUrl,jdbcUsername,jdbcPassWord);
        return connection;
    }


    public List<Product> selectAllProduct() throws SQLException, ClassNotFoundException {
        List<Product> products = new ArrayList<>();
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCT);
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()){
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String price = rs.getString("price");
            String amount = rs.getString("amount");
            String details = rs.getString("details");
            products.add(new Product (id,name,price,amount,details));
        }
        return products;
    }


}
