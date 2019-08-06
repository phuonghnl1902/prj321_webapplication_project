/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuong.daos;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import phuong.db.MyConnection;
import phuong.dtos.CartDTO;
import phuong.dtos.OrderDTO;

/**
 *
 * @author User
 */
public class OrderDAO implements Serializable {

    private Connection conn;
    private PreparedStatement prSt;
    private ResultSet rs;

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (prSt != null) {
            prSt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public void insert(CartDAO cart) throws Exception {
        try {
            String sql = "Insert into Cart(Username, TourID, TourName, Quantity, Price, BuyDate, Status) values (?,?,?,?,?,?,'Proceed')"
                    + " Update TourInfo set MaxSeat = MaxSeat - ? where TourID = ?"
                    + " Update TourInfo set Active = 0 where MaxSeat = 0";
            conn = MyConnection.getMyConnection();
            prSt = conn.prepareStatement(sql);

            for (CartDTO dto : cart.getCart().values()) {
                prSt.setString(1, cart.getCustormer());
                prSt.setString(2, dto.getTour().getId());
                prSt.setString(3, dto.getTour().getName());
                prSt.setInt(4, dto.getQuantity());
                prSt.setFloat(5, dto.getTour().getPrice() * dto.getQuantity());
                prSt.setDate(6, Date.valueOf(LocalDate.now()));
                prSt.setInt(7, dto.getQuantity());
                prSt.setString(8, dto.getTour().getId());
                
                prSt.executeUpdate();
       
            }
        } finally {
            closeConnection();
        }
    }

    public List<OrderDTO> showList(String username) throws Exception {
        List<OrderDTO> result = null;
        String id = null, tourid = null, status = null, name = null;
        int quan = -1;
        float price = -1;
        Date date = null;
        OrderDTO dto = null;
        try {
            String sql = "use BookingDB Select OrderID, TourID, TourName, Quantity, Price, BuyDate, Status From Cart Where Username = ?";
            conn = MyConnection.getMyConnection();
            prSt = conn.prepareStatement(sql);
            prSt.setString(1, username);
            rs = prSt.executeQuery();
            result = new ArrayList<>();

            while (rs.next()) {
                id = rs.getString("OrderID");
                tourid = rs.getString("TourID");
                name = rs.getString("TourName");
                quan = rs.getInt("Quantity");
                price = rs.getFloat("Price");
                date = rs.getDate("BuyDate");
                status = rs.getString("Status");
                dto = new OrderDTO(id, tourid, status, name, quan, price, date);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean cancel(String id, String tourid, int quan) throws Exception {
        boolean check = false;
        try {
            String sql = "Update Cart set Status = 'Cancelled' Where OrderID = ? "
                    + " Update TourInfo set MaxSeat = MaxSeat + ?, Active = 1 where TourID = ?";
            conn = MyConnection.getMyConnection();
            prSt = conn.prepareStatement(sql);
            prSt.setString(1, id);
            prSt.setInt(2, quan);
            prSt.setString(3, tourid);
            check = prSt.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<OrderDTO> findByLikeName(String search) throws Exception {
        List<OrderDTO> result = null;
        String id = null, tourid = null, status = null, name = null, username = null;
        int quan = -1;
        float price = -1;
        Date date = null;
        OrderDTO dto = null;
        try {
            String sql = "Select OrderID, Username, TourID, TourName, Quantity, Price, BuyDate, Status From Cart Where Username LIKE ?";
            conn = MyConnection.getMyConnection();
            prSt = conn.prepareStatement(sql);
            prSt.setString(1, "%" + search + "%");
            rs = prSt.executeQuery();
            result = new ArrayList<>();

            while (rs.next()) {
                id = rs.getString("OrderID");
                username = rs.getString("Username");
                tourid = rs.getString("TourID");
                name = rs.getString("TourName");
                quan = rs.getInt("Quantity");
                price = rs.getFloat("Price");
                date = rs.getDate("BuyDate");
                status = rs.getString("Status");
                dto = new OrderDTO(id, tourid, status, name, username, quan, price, date);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
}
