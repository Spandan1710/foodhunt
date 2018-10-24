package edu.utdallas.foodhunt.dealsandoffers.datalayer.dao;

import edu.utdallas.foodhunt.dealsandoffers.datalayer.entity.Deal;
import edu.utdallas.foodhunt.utils.db.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class DealDao {
    private Connection conn;
    private PreparedStatement ps;

    public DealDao() {
        conn = DBUtils.getDbConnection();
        ps = null;
    }

    public boolean addDeal(Deal deal){
        try{
        ps=conn.prepareStatement("insert into deal(deal,restaurant_id) values (?,?,?)");
        ps.setString(1,deal.getDeal());
        ps.setInt(2,deal.getRestaurantID());
        ps.setBoolean(3,deal.isPremium());
        return ps.execute();
        }
        catch(Exception e){
            System.out.println(e);
        }
        return false;
    }

    @Override
    protected void finalize() throws Throwable {
        conn.close();
    }
}
