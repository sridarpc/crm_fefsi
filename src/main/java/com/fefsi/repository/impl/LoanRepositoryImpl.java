package com.fefsi.repository.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.fefsi.models.Loan;
import com.fefsi.models.LoanItem;
import com.fefsi.models.PageRequest;
import com.fefsi.repository.LoanRepository;
import com.fefsi.util.ProductUtil;

@Repository
public class LoanRepositoryImpl implements LoanRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public int saveOrUpdateLoan(Loan loan) throws DataAccessException {
        return 0;
    }

    @Override
    public int deleteLoan(int loanId) {
        return jdbcTemplate.update("DELETE FROM loan_master WHERE cust_id=?", new Object[] { loanId });
    }

    @Override
    public Loan findLoanById(int id) {
        String sql = "SELECT cust_id, cust_name, surdetails, surname, cust_type, party, religion, community, door_no, street_name, area, taluk, postal, district, state, pin_code, mobile_no, email_id, website, std_code, landline_no, birthday, anniversary, proof_name, proof_details, proof_attached, relation, relationship_cust_id, photo1, photo2, photo3, right_thumb, right_index_finger, right_middle_finger, right_ring_finger, right_little_finger, left_thumb, left_index_finger, left_middle_finger, left_ring_finger, left_little_finger, feedback, status, ent_by, ent_date, mod_by, mod_date FROM loan_master WHERE cust_id='" + id + "'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<Loan>() {
            @Override
            public Loan extractData(ResultSet rs) throws SQLException, DataAccessException {
                Loan loan = new Loan();
                int i = 1;
                while (rs.next()) {
                    loan.setSerialNumber(i++);

                }
                return loan;
            }
        });
    }

    @Override
    public int count() {
        return jdbcTemplate.queryForObject("SELECT count(*) FROM loan_master", Integer.class);
    }

    @Override
    public List<Loan> findAll(PageRequest page) {
        String sql = "SELECT * FROM loan_master where (UPPER(cust_id) like '%" + page.getSearch().toUpperCase() + "%' or UPPER(status) like '%" + page.getSearch().toUpperCase() + "%' or UPPER(cust_name) like '%" + page.getSearch().toUpperCase() + "%' or UPPER(cust_type) like '%" + page.getSearch().toUpperCase() + "%') ORDER BY cust_id " + page.getSort() + " LIMIT " + page.getSize() + " OFFSET " + page.getPage();
        return jdbcTemplate.query(sql, new ResultSetExtractor<List<Loan>>() {
            @Override
            public List<Loan> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<Loan> loanList = new ArrayList<>();
                int i = (page.getPage() / page.getSize()) * page.getSize() + 1;
                while (rs.next()) {
                    Loan loan = new Loan();
                    loan.setSerialNumber(i++);

                    loanList.add(loan);
                }
                return loanList;
            }
        });
    }

    @Override
    public List<Loan> findByList() {
        String sql = "SELECT cust_id,cust_name FROM loan_master where status='1'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<List<Loan>>() {
            @Override
            public List<Loan> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<Loan> loanList = new ArrayList<>();
                while (rs.next()) {
                    Loan loan = new Loan();

                    loanList.add(loan);
                }
                return loanList;
            }
        });
    }

    @Override
    public String getId() {
        String sql = "SELECT cust_id FROM loan_master ORDER BY cust_id DESC LIMIT 1;";
        int count = jdbcTemplate.queryForObject(sql, Integer.class);
        return String.valueOf(count + 1);
    }

    public boolean saveOrUpdate(Long id) {
        String sql = "SELECT cust_id FROM loan_master where cust_id ='" + id + "'";
        int count = jdbcTemplate.queryForObject(sql, Integer.class);
        return count > 0;
    }

    @Override
    public int saveOrUpdateItem(LoanItem loanItem) {
        int status = 0;
        if (loanItem.getLoanId() != null) {
            String sql = "UPDATE loan_item_master SET loan_no =?, metal_weight =?, net_weight =?, piece =?, purity_percentage =?, purity_weight =?, seal =?, item_no =?, item_name =?, remarks =?, status =?, mod_by =?, mod_date = NOW() WHERE loan_item_id =?";
            status = jdbcTemplate.update(sql, new Object[] { loanItem.getLoanNo(), loanItem.getMetalWeight(), loanItem.getNetWeight(), loanItem.getPiece(), loanItem.getPurityPercentage(), loanItem.getPurityWeight(), loanItem.getSeal(), loanItem.getItemNo(), loanItem.getItemName(), loanItem.getRemarks(), "1", ProductUtil.getInstance().getUserId(), loanItem.getLoanId() });
        } else {
            String sql = "INSERT INTO loan_item_master ( loan_no, metal_weight, net_weight, piece, purity_percentage, purity_weight, seal, item_no, item_name, remarks, status, ent_by, ent_date ) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW() );";
            status = jdbcTemplate.update(sql, new Object[] { loanItem.getLoanNo(), loanItem.getMetalWeight(), loanItem.getNetWeight(), loanItem.getPiece(), loanItem.getPurityPercentage(), loanItem.getPurityWeight(), loanItem.getSeal(), loanItem.getItemNo(), loanItem.getItemName(), loanItem.getRemarks(), "0", ProductUtil.getInstance().getUserId() });
        }
        return status;
    }

    @Override
    public List<LoanItem> findAllItem(PageRequest page) {
        String sql = "SELECT * FROM loan_item_master where (UPPER(metal_weight) like '%" + page.getSearch().toUpperCase() + "%'  or UPPER(net_weight) like '%" + page.getSearch().toUpperCase() + "%' or UPPER(piece) like '%" + page.getSearch().toUpperCase() + "%' or UPPER(item_name) like '%" + page.getSearch().toUpperCase() + "%' or UPPER(remarks) like '%" + page.getSearch().toUpperCase() + "%') ORDER BY loan_item_id " + page.getSort() + " LIMIT " + page.getSize() + " OFFSET " + page.getPage();
        return jdbcTemplate.query(sql, new ResultSetExtractor<List<LoanItem>>() {
            @Override
            public List<LoanItem> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<LoanItem> loanItemList = new ArrayList<>();
                int i = (page.getPage() / page.getSize()) * page.getSize() + 1;
                while (rs.next()) {
                    LoanItem loanItem = new LoanItem();
                    loanItem.setSerialNumber(i++);
                    loanItem.setLoanNo(rs.getString("loan_no"));
                    loanItem.setMetalWeight(rs.getDouble("metal_weight"));
                    loanItem.setNetWeight(rs.getDouble("net_weight"));
                    loanItem.setPiece(rs.getInt("piece"));
                    loanItem.setPurityPercentage(rs.getDouble("purity_percentage"));
                    loanItem.setPurityWeight(rs.getDouble("purity_weight"));
                    loanItem.setSeal(rs.getString("seal"));
                    loanItem.setItemNo(rs.getString("item_no"));
                    loanItem.setItemName(rs.getString("item_name"));
                    loanItem.setRemarks(rs.getString("remarks"));
                    loanItemList.add(loanItem);
                }
                return loanItemList;
            }
        });
    }

    @Override
    public int countItem() {
        return 0;
    }

}
