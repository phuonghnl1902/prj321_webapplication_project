/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuong.daos;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import phuong.db.MyConnection;
import phuong.dtos.TourDTO;

/**
 *
 * @author User
 */
public class TourDAO implements Serializable {

    private Connection conn;
    private PreparedStatement prSt;
    private ResultSet rs;

    public TourDAO() {
    }

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

    public boolean updateActive() throws Exception {
        boolean check = false;
        try {
            String sql = "Update TourInfo set Active = 0 Where DateStart <= CAST(GETDATE() AS DATE)";
            conn = MyConnection.getMyConnection();
            prSt = conn.prepareStatement(sql);
            check = prSt.executeUpdate() >= 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public List<TourDTO> showList() throws Exception {
        List<TourDTO> result = null;
        String id = null, name = null, des = null;
        Date dateStart = null, dateEnd = null;
        int maxSeat = 0;
        float price = 0;
        TourDTO dto = null;

        try {
            String sql = "Select TourID, TourName, DateStart, DateEnd, Description, MaxSeat, Price From TourInfo Where Active = 1";
            conn = MyConnection.getMyConnection();
            prSt = conn.prepareStatement(sql);
            rs = prSt.executeQuery();
            result = new ArrayList<>();

            while (rs.next()) {
                id = rs.getString("TourID");
                name = rs.getString("TourName");
                dateStart = rs.getDate("DateStart");
                dateEnd = rs.getDate("DateEnd");
                des = rs.getString("Description");
                maxSeat = rs.getInt("MaxSeat");
                price = rs.getFloat("Price");
                dto = new TourDTO(id, name, des, dateStart, dateEnd, maxSeat, price);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<TourDTO> findByLikeName(String search) throws Exception {
        List<TourDTO> result = null;
        String id = null, name = null, des = null;
        Date dateStart = null, dateEnd = null;
        int maxSeat = 0;
        float price = 0;
        TourDTO dto = null;

        try {
            String sql = "Select TourID, TourName, DateStart, DateEnd, MaxSeat, Price, Active From TourInfo Where TourName LIKE ? and Active = 1";
            conn = MyConnection.getMyConnection();
            prSt = conn.prepareStatement(sql);
            prSt.setString(1, "%" + search + "%");
            rs = prSt.executeQuery();
            result = new ArrayList<>();

            while (rs.next()) {
                id = rs.getString("TourID");
                name = rs.getString("TourName");
                dateStart = rs.getDate("DateStart");
                dateEnd = rs.getDate("DateEnd");
                maxSeat = rs.getInt("MaxSeat");
                price = rs.getFloat("Price");
                dto = new TourDTO(id, name, dateStart, dateEnd, maxSeat, price);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean delete(String id) throws Exception {
        boolean check = false;
        try {
            String sql = "Update TourInfo set Active = 0 Where TourID = ?";
            conn = MyConnection.getMyConnection();
            prSt = conn.prepareStatement(sql);
            prSt.setString(1, id);
            check = prSt.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public TourDTO findByPrimaryKey(String key) throws Exception {
        TourDTO dto = null;
        try {
            String sql = "Select TourID, TourName, DateStart, DateEnd, Description, MaxSeat, Price, Active From TourInfo Where TourID = ?";
            conn = MyConnection.getMyConnection();
            prSt = conn.prepareStatement(sql);
            prSt.setString(1, key);
            rs = prSt.executeQuery();

            if (rs.next()) {
                String name = rs.getString("TourName");
                Date dateStart = rs.getDate("DateStart");
                Date dateEnd = rs.getDate("DateEnd");
                String des = rs.getString("Description");
                int maxSeat = rs.getInt("MaxSeat");
                float price = rs.getFloat("Price");
                boolean active = rs.getBoolean("Active");
                dto = new TourDTO(key, name, des, dateStart, dateEnd, maxSeat, price, active);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }

    public boolean update(TourDTO dto) throws Exception {
        boolean check = false;
        try {
            String sql = "Update TourInfo set TourName = ?, DateStart = ?, DateEnd = ?, Description = ?, MaxSeat = ?, Price = ?, Active = 1 Where TourID = ?";
            conn = MyConnection.getMyConnection();
            prSt = conn.prepareStatement(sql);
            prSt.setString(1, dto.getName());
            prSt.setDate(2, dto.getDateStart());
            prSt.setDate(3, dto.getDateEnd());
            prSt.setString(4, dto.getDes());
            prSt.setInt(5, dto.getMaxSeat());
            prSt.setFloat(6, dto.getPrice());
            prSt.setString(7, dto.getId());

            check = prSt.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean insert(TourDTO dto) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert into TourInfo(TourID, TourName, DateStart, DateEnd, Description, MaxSeat, Price, Active) values(?,?,?,?,?,?,?,1)";
            conn = MyConnection.getMyConnection();
            prSt = conn.prepareStatement(sql);
            prSt = conn.prepareStatement(sql);
            prSt.setString(2, dto.getName());
            prSt.setDate(3, dto.getDateStart());
            prSt.setDate(4, dto.getDateEnd());
            prSt.setString(5, dto.getDes());
            prSt.setInt(6, dto.getMaxSeat());
            prSt.setFloat(7, dto.getPrice());
            prSt.setString(1, dto.getId());

            check = prSt.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public int getSeat(String id) throws Exception {
        int seat = 0;
        try {
            String sql = "Select MaxSeat From TourInfo Where TourID = ?";
            conn = MyConnection.getMyConnection();
            prSt = conn.prepareStatement(sql);
            prSt.setString(1, id);
            rs = prSt.executeQuery();
            
            if (rs.next()) {
                seat = rs.getInt("MaxSeat");
            }
        } finally {
            closeConnection();
        }
        return seat;
    }
}
