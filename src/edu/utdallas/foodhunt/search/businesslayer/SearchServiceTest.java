package edu.utdallas.foodhunt.search.businesslayer;

import edu.utdallas.foodhunt.restaurantmanagement.datalayer.entity.Restaurant;
import junit.framework.Assert;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;


public class SearchServiceTest {

    @Test
    public void testSearchFunctionality(){
        List<String> restaurantNames = new ArrayList<>();
        restaurantNames.add("Restaurant1");
        restaurantNames.add("Restaurant2");
        List<Restaurant> restaurants = new SearchService().searchRestaurants("Italian",36.78,36.78);
        for(Restaurant restaurant:restaurants){
            Assert.assertTrue(restaurantNames.contains(restaurant.getName()));
        }
    }

    @Test
    public void testSearchFunctionalityNegativeCase(){
        List<Restaurant> restaurants = new SearchService().searchRestaurants("ABC",36.78,36.78);
        Assert.assertEquals(0,restaurants.size());

    }

    @Test
    public void testSearchFunctionalityUsingMenuItem(){
        List<String> restaurantNames = new ArrayList<>();
        restaurantNames.add("Restaurant1");
        restaurantNames.add("Restaurant3");
        List<Restaurant> restaurants = new SearchService().searchRestaurants("Biry",36.78,36.78);
        for(Restaurant restaurant:restaurants){
            Assert.assertEquals(true,restaurantNames.contains(restaurant.getName()));
        }
    }

    @Test
    public void testSearchSimilarRestaurants(){

        List<Restaurant> restaurants = new SearchService().searchAlternateRestaurants("12",32.9796001,-96.77611619999999);
        Assert.assertEquals(6,restaurants.size());
        Assert.assertEquals("Restaurant5",restaurants.get(0).getName());
        Assert.assertEquals("Restaurant6",restaurants.get(1).getName());
        Assert.assertEquals("Restaurant4",restaurants.get(2).getName());
        Assert.assertEquals("Restaurant2",restaurants.get(3).getName());
        Assert.assertEquals("Restaurant1",restaurants.get(4).getName());
        Assert.assertEquals("Restaurant3",restaurants.get(5).getName());

    }

}