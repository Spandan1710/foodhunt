package edu.utdallas.foodhunt.restaurantmanagement.businesslayer;

import edu.utdallas.foodhunt.restaurantmanagement.datalayer.dao.RestaurantDao;
import edu.utdallas.foodhunt.restaurantmanagement.datalayer.entity.Restaurant;

import java.util.List;

public class RestaurantService {

    private RestaurantDao restaurantDao;

    public RestaurantService() {
        restaurantDao = new RestaurantDao();
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
}
