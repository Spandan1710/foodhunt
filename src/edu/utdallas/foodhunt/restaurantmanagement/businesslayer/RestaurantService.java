package edu.utdallas.foodhunt.restaurantmanagement.businesslayer;

import edu.utdallas.foodhunt.restaurantmanagement.datalayer.dao.MenuDao;
import edu.utdallas.foodhunt.restaurantmanagement.datalayer.dao.RestaurantDao;
import edu.utdallas.foodhunt.restaurantmanagement.datalayer.entity.Menu;
import edu.utdallas.foodhunt.restaurantmanagement.datalayer.entity.Restaurant;

import java.util.List;

public class RestaurantService {

    private RestaurantDao restaurantDao;
    private MenuDao menuDao;

    public RestaurantService() {
        restaurantDao = new RestaurantDao();
        menuDao = new MenuDao();
    }

    public List<Restaurant> getRestaurants() {
        return restaurantDao.getRestaurants();
    }

    public boolean addRestaurant(Restaurant restaurant) {
        return restaurantDao.addRestaurant(restaurant);
    }

    public boolean deleteRestaurant(String restaurantID) {
        return restaurantDao.deleteRestaurant(restaurantID);
    }

    public Restaurant getRestaurant(String restaurantID) {
        return restaurantDao.getRestaurant(restaurantID);
    }

    public boolean modifyRestaurant(Restaurant restaurant) {
        return restaurantDao.modifyRestaurant(restaurant);
    }

    public boolean addMenuItem(Menu menu) {
        return menuDao.addMenuItem(menu);
    }

    public Menu getMenuItem(String id) {
        return menuDao.getMenuItem(id);
    }

    public List<Menu> getRestaurantMenuItems(String id) {
        return menuDao.getMenuItems(id);
    }

    public boolean deleteMenuItem(String id) {
        return menuDao.deleteMenuItem(id);
    }

    public boolean updateMenuItem(Menu menu) {
        return menuDao.updateMenuItem(menu);
    }

//    public List<Restaurant> getRestaurantList(String id) {
//        return menuDao.getRestaurantList(id);
//    }

    public List<Restaurant> searchRestaurant(String keyword) {
        return restaurantDao.searchRestaurant(keyword);
    }

    public List<Menu> getMenuItems(String id) {
        return restaurantDao.getMenuItems(id);
    }

    public boolean editMenuItemVisibility(String id, boolean flag) {
        return menuDao.editMenuItemVisibility(id, flag);
    }
}
