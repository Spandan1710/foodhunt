package edu.utdallas.foodhunt.usermanagement.businesslayer;

        import edu.utdallas.foodhunt.usermanagement.datalayer.dao.UserDao;

public class UserService {
    private UserDao userDao;

    public UserService() {
        userDao = new UserDao();
    }

    public boolean setPremiumMembership(String username) {
        return userDao.setPremiumMembership(username);
    }
}
