package com.fefsi.util;

public final class ProductUtil {

    private static ProductUtil instance;
    private Integer userId;
    private Integer companyId;

    private ProductUtil(Integer userId, Integer companyId) {
        this.userId = userId;
        this.companyId = companyId;
    }

    public ProductUtil() {
    }

    public static ProductUtil getInstace(Integer userId, Integer companyId) {
        if (instance == null) {
            instance = new ProductUtil(userId, companyId);
        }
        return instance;
    }

    public Integer getUserId() {
        return userId;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void cleanUserSession() {
        userId = 0;
        companyId = 0;
        instance = null;
    }

    public static ProductUtil getInstance() {
        return instance;
    }

    @Override
    public String toString() {
        return "ProductUtil [userId=" + userId + ", companyId=" + companyId + "]";
    }

}
