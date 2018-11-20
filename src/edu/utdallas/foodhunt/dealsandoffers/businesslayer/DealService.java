package edu.utdallas.foodhunt.dealsandoffers.businesslayer;

import edu.utdallas.foodhunt.dealsandoffers.datalayer.dao.DealDao;
import edu.utdallas.foodhunt.dealsandoffers.datalayer.entity.Deal;

import java.util.List;

public class DealService {
    private DealDao dealDao;


    public DealService() {

        dealDao = new DealDao();
    }

    public boolean addDeal(Deal deal) {
        return (dealDao.addDeal(deal));
    }

    public List<Deal> getDeals(String userName, boolean isPremium) {
        boolean isLoyal = dealDao.checkLoyalty(userName);
        return (dealDao.getDeals(isPremium, isLoyal));
    }
}
