package edu.utdallas.foodhunt.dealsandoffers.datalayer.entity;

public class Deal {
    private int dealID;
    private String deal;
    private boolean isPremium;


    public int getDealID() {
        return dealID;
    }

    public void setDealID(int dealID) {
        this.dealID = dealID;
    }

    public String getDeal() {
        return deal;
    }

    public void setDeal(String deal) {
        this.deal = deal;
    }

    public boolean isPremium() {
        return isPremium;
    }

    public void setPremium(boolean premium) {
        isPremium = premium;
    }

}
