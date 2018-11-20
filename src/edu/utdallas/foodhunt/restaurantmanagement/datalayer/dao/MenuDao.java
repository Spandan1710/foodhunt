package edu.utdallas.foodhunt.restaurantmanagement.datalayer.dao;

import edu.utdallas.foodhunt.restaurantmanagement.datalayer.entity.Menu;
import edu.utdallas.foodhunt.restaurantmanagement.datalayer.entity.Restaurant;
import edu.utdallas.foodhunt.utils.db.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MenuDao {
    private Connection conn;
    private PreparedStatement ps;

    public MenuDao() {
        conn = DBUtils.getDbConnection();
        ps = null;
    }

    public boolean addMenuItem(Menu menu) {

        try {
            ps = conn.prepareStatement("insert into menu(restaurant_id,cuisine,menuItem,menuPrice) values(?,?,?,?)");
            ps.setInt(1, menu.getRestaurantId());
            ps.setString(2, menu.getCuisine());
            ps.setString(3, menu.getMenuItem());
            ps.setDouble(4, menu.getMenuPrice());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public Menu getMenuItem(String id) {
        Menu menu = new Menu();
        try {
            ps = conn.prepareStatement("select menuId,restaurant_id,cuisine,menuItem,menuPrice,isActive from menu where menuId = ?");
            ps.setInt(1, Integer.parseInt(id));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                menu.setMenuId(rs.getInt("menuId"));
                menu.setRestaurantId(rs.getInt("restaurant_id"));
                menu.setCuisine(rs.getString("cuisine"));
                menu.setMenuItem(rs.getString("menuItem"));
                menu.setMenuPrice(rs.getDouble("menuPrice"));
                menu.setActive(rs.getBoolean("isActive"));
            }
            return menu;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Menu> getMenuItems(String id) {
        List<Menu> menuItems = new ArrayList<>();

        try {
            ps = conn.prepareStatement("select menuId,cuisine,menuItem,menuPrice,isActive from menu where isActive=TRUE and restaurant_id=?");
            ps.setInt(1, Integer.parseInt(id));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Menu menu = new Menu();
                menu.setMenuId(rs.getInt("menuId"));
                menu.setCuisine(rs.getString("cuisine"));
                menu.setMenuItem(rs.getString("menuItem"));
                menu.setMenuPrice(rs.getDouble("menuPrice"));
                menu.setActive(rs.getBoolean("isActive"));
                menuItems.add(menu);
            }
            return menuItems;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean deleteMenuItem(String id) {
        try {
            ps = conn.prepareStatement("delete from menu where menuId = ?");
            ps.setInt(1, Integer.parseInt(id));
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateMenuItem(Menu menu) {
        try {
            ps = conn.prepareStatement("update menu set cuisine = ?,menuItem=?,menuPrice = ?, isActive = ? where menuId = ?");
            ps.setString(1, menu.getCuisine());
            ps.setString(2, menu.getMenuItem());
            ps.setDouble(3, menu.getMenuPrice());
            ps.setBoolean(4, menu.isActive());
            ps.setInt(5, menu.getMenuId());
            int status = ps.executeUpdate();
            return status > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Restaurant> getRestaurantList(String itemName, RestaurantDao restaurantDao) {
        List<Restaurant> restaurantList = new ArrayList<>();
        List<Integer> restaurantIDs = new ArrayList<>();
        Restaurant restaurant;

        try {
            ps = conn.prepareStatement("select restaurant_id from menu where isActive=TRUE and menuItem like '%" + itemName + "%'");
            //ps.setString(1, itemName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                restaurantIDs.add(Integer.valueOf(rs.getInt("restaurant_id")));
            }

            for (int i = 0; i < restaurantIDs.size(); i++) {
                restaurant = restaurantDao.getRestaurant(String.valueOf(restaurantIDs.get(i)));
                restaurantList.add(restaurant);
            }

            return restaurantList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public boolean editMenuItemVisibility(String id, boolean flag) {
        try {
            ps = conn.prepareStatement("update menu set isActive=? where menuId=?");
            ps.setBoolean(1, flag);
            ps.setInt(2, Integer.parseInt(id));
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    protected void finalize() throws Throwable {
        conn.close();
    }
}
