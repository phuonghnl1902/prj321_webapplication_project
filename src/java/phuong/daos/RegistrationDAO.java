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
import java.util.List;
import phuong.db.MyConnection;
import phuong.dtos.RegistrationDTO;

/**
 *
 * @author User
 */
public class RegistrationDAO implements Serializable {

    private Connection conn;
    private PreparedStatement prSt;
    private ResultSet rs;

    public RegistrationDAO() {
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

    public String checkLogin(String username, String password) throws Exception {
        String role = "failed";
        try {
            String sql = "Select Role From Registration Where Username = ? and Password = ?";
            conn = MyConnection.getMyConnection();
            prSt = conn.prepareStatement(sql);
            prSt.setString(1, username);
            prSt.setString(2, password);
            rs = prSt.executeQuery();

            if (rs.next()) {
                role = rs.getString("Role");
            }
        } finally {
            closeConnection();
        }
        return role;
    }

    public boolean register(RegistrationDTO dto) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert Into Registration(Username, Password, Fullname, Address, Phone, Role, Active) values(?,?,?,?,?,'user',1)";
            conn = MyConnection.getMyConnection();
            prSt = conn.prepareStatement(sql);
            prSt.setString(1, dto.getUsername());
            prSt.setString(2, dto.getPassword());
            prSt.setString(3, dto.getFullname());
            prSt.setString(4, dto.getAddress());
            prSt.setString(5, dto.getPhone());
            check = prSt.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<RegistrationDTO> findByLikeName(String search) throws Exception {
        List<RegistrationDTO> result = null;
        String username = null;
        String fullname = null;
        String address = null;
        String phone = null;
        String role = null;
        RegistrationDTO dto = null;

        try {
            String sql = "Select Username, Fullname, Address, Phone, Role From Registration Where Fullname LIKE ? and Active = 1 and Role = 'user'";
            conn = MyConnection.getMyConnection();
            prSt = conn.prepareStatement(sql);
            prSt.setString(1, "%" + search + "%");
            rs = prSt.executeQuery();
            result = new ArrayList<>();

            while (rs.next()) {
                username = rs.getString("Username");
                fullname = rs.getString("Fullname");
                address = rs.getString("Address");
                phone = rs.getString("Phone");
                role = rs.getString("Role");
                dto = new RegistrationDTO(username, fullname, address, phone, role);
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
            String sql = "Update Registration set Active = 0 Where Username = ?";
            conn = MyConnection.getMyConnection();
            prSt = conn.prepareStatement(sql);
            prSt.setString(1, id);
            check = prSt.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public RegistrationDTO findByPrimaryKey(String key) throws Exception {
        RegistrationDTO dto = null;
        try {
            String sql = "Select Fullname, Address, Phone From Registration Where Username = ?";
            conn = MyConnection.getMyConnection();
            prSt = conn.prepareStatement(sql);
            prSt.setString(1, key);
            rs = prSt.executeQuery();
            if (rs.next()) {
                String fullname = rs.getString("Fullname");
                String address = rs.getString("Address");
                String phone = rs.getString("Phone");
                dto = new RegistrationDTO(key, fullname, address, phone);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public boolean update(RegistrationDTO dto) throws Exception {
        boolean check = false;
        try {
            String sql = "Update Registration set Fullname = ?, Address = ?, Phone = ? Where Username = ?";
            conn = MyConnection.getMyConnection();
            prSt = conn.prepareStatement(sql);
            prSt.setString(1, dto.getFullname());
            prSt.setString(2, dto.getAddress());
            prSt.setString(3, dto.getPhone());
            prSt.setString(4, dto.getUsername());
            check = prSt.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
}
