package com.fefsi.util;

import java.util.List;
import java.util.Random;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public final class Constants {

    public static String pageNo = "pageno";

    public static String pageSize = "pagesize";

    public static String sortDir = "sortdir";

    public static String sortBy = "sortby";

    public static String search = "search";

    public static String smith = "Smith";

    public static int status = 1;

    public static String all = "All";

    public static String getRandom(int length) {
        // It will generate 6 digit random Number.
        // from 0 to 999999
        Random rnd = new Random();
        String return_val = "";
        int number = 0;
        if (length == 7) {
            number = rnd.nextInt(999999);
            return_val = String.format("%07d", number);
        }
        if (length == 6) {
            number = rnd.nextInt(999999);
            // this will convert any number sequence into 6 character.
            return_val = String.format("%06d", number);
        }
        if (length == 5) {
            number = rnd.nextInt(99999);
            // this will convert any number sequence into 5 character.
            return_val = String.format("%05d", number);
        }
        if (length == 4) {
            number = rnd.nextInt(9999);
            // this will convert any number sequence into 4 character.
            return_val = String.format("%04d", number);
        }
        if (length == 3) {
            number = rnd.nextInt(999);
            // this will convert any number sequence into 3 character.
            return_val = String.format("%03d", number);
        }
        log.info("Constant ", return_val);
        return return_val;
    }

    public static String queryConstructor(List<String> elements, String columnName) {
        String query = "";
        if (elements.size() == 1) {
            query = " " + elements + " ='" + elements.get(0) + "'";
        } else if (elements.size() > 1) {
            StringBuffer sb = new StringBuffer(" ( ");
            for (int e = 0; e < elements.size(); e++) {
                if (e == 0) {
                    sb.append(" " + columnName + " ='" + elements.get(e) + "' ");
                } else if (e == 1) {
                    sb.append(" OR " + columnName + " ='" + elements.get(e) + "'");
                } else if (e % 2 == 0) {
                    sb.append(" OR " + columnName + " ='" + elements.get(e) + "'");
                } else {
                    sb.append(" OR " + columnName + " ='" + elements.get(e) + "'");
                }
            }
            sb.append(" )");
            query = sb.toString();
        }
        return query;
    }

    public static String status(int status) {
        return status == 1 ? "Active" : "Inactive";
    }

}
