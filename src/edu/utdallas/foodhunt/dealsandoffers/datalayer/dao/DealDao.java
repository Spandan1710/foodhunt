package edu.utdallas.foodhunt.dealsandoffers.datalayer.dao;

import edu.utdallas.foodhunt.dealsandoffers.datalayer.entity.Deal;
import edu.utdallas.foodhunt.utils.db.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DealDao {
    private Connection conn;
    private PreparedStatement ps;

    public DealDao() {
        conn = DBUtils.getDbConnection();
        ps = null;
    }

    public boolean addDeal(Deal deal) {
        try {
            ps = conn.prepareStatement("insert into deal(deal,isPremium) values (?,?)");
            ps.setString(1, deal.getDeal());
            ps.setBoolean(2, deal.isPremium());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Deal> getDeals(boolean isPremium, boolean isLoyal) {
        List<Deal> deals = new ArrayList<>();

        try {
            if (isPremium) {
                ps = conn.prepareStatement("select * from deal");
            } else if (isLoyal) {
                ps = conn.prepareStatement("select * from deal where isPremium=FALSE ");
            } else {
                return new ArrayList<Deal>();
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Deal deal = new Deal();
                deal.setDealID(rs.getInt("id"));
                deal.setDeal(rs.getString("deal"));
                deal.setPremium(rs.getBoolean("isPremium"));
                deals.add(deal);
            }
            return deals;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean checkLoyalty(String userName) {
        try {
            ps = conn.prepareStatement("select * from reservation where username='"+userName+"' and isCancelled=False");
            ResultSet resultSet = ps.executeQuery();
            int count=0;
            while (resultSet.next()) {
               count++;
            }
            if (count > 2) return true;
            else return false;
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
