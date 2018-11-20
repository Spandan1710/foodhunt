package edu.utdallas.foodhunt.dealsandoffers.servlets;

import edu.utdallas.foodhunt.dealsandoffers.businesslayer.DealService;
import edu.utdallas.foodhunt.dealsandoffers.datalayer.entity.Deal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AddDealController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String dealDescription = request.getParameter("dealDesc");
        boolean isPremium = Boolean.parseBoolean(request.getParameter("dealType"));
        String submitType = request.getParameter("submit");
        Deal deal = new Deal();
        deal.setDeal(dealDescription);
        deal.setPremium(isPremium);
        DealService dealService = new DealService();
        if (submitType.equals("addDeal") && dealService.addDeal(deal)) {
            request.setAttribute("deals", dealService.getDeals(session.getAttribute("userName").toString(), Boolean.parseBoolean(session.getAttribute("isUserPremium").toString())));
            session.setAttribute("dealMsg", "success");
            request.getRequestDispatcher("addDeals.jsp").forward(request, response);
        } else {
            session.setAttribute("dealMsg", "fail");
            request.getRequestDispatcher("addDeals.jsp").forward(request, response);
        }
    }

}
