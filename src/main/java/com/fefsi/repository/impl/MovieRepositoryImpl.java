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

import com.fefsi.models.Movie;
import com.fefsi.models.PageRequest;
import com.fefsi.repository.MovieRepository;
import com.fefsi.util.ProductUtil;

@Repository
public class MovieRepositoryImpl implements MovieRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public int saveOrUpdateMovie(Movie movie) throws DataAccessException {
        if (saveOrUpdate(movie.getMovieId())) {
            return jdbcTemplate.update("UPDATE movie_master SET id =?, company_name =?, movie_name =?, agent_name =?, agentcontact_no =?, manager_name =?, managercontact_no =?, junior_artist =?, gym_boys =?, rich_model =?, location =?, conveyance =?, tiffin =?, meals =?, untime_conveyance =?, midnight_snacks =?, journey_conveyance =?, models_rich_conveyance =?, agents_assistant_batta =?, sub_agent_name =?, others =?, total_amount =?, amount_status =?, image_movie =?, status =?, mod_by =?, mod_date = NOW() WHERE id =?", new Object[] { movie.getMovieId(), movie.getCompanyName(), movie.getMovieName(), movie.getAgentName(), movie.getAgentContactNo(),movie.getManagerName(), movie.getManagerContactNo(), movie.getJuniorArtist(), movie.getGymBoys(), movie.getRichModel(), movie.getLocation(), movie.getConveyance(), movie.getTiffin(), movie.getMeals(), movie.getUntimeConveyance(), movie.getMidnightSnacks(), movie.getJourneyConveyance(), movie.getModelsrichConveyance(), movie.getAgentsassistantBatta(), movie.getSubagentName(), movie.getOthers(), movie.getTotalAmount(), movie.getAmountStatus(), movie.getImageMovie(), movie.getStatus(), movie.getModBy() });
        } else {
            return jdbcTemplate.update("INSERT INTO movie_master (id, company_name, movie_name, agent_name, agentcontact_no, manager_name, managercontact_no, junior_artist, gym_boys, rich_model, location, conveyance, tiffin, meals, untime_conveyance, midnight_snacks, journey_conveyance, models_rich_conveyance, agents_assistant_batta, sub_agent_name, others, total_amount, amount_status, image_movie, status, mod_by, mod_date ) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW() );", new Object[] { movie.getMovieId(), movie.getCompanyName(), movie.getMovieName(), movie.getAgentName(), movie.getAgentContactNo(),movie.getManagerName(), movie.getManagerContactNo(), movie.getJuniorArtist(), movie.getGymBoys(), movie.getRichModel(), movie.getLocation(), movie.getConveyance(), movie.getTiffin(), movie.getMeals(), movie.getUntimeConveyance(), movie.getMidnightSnacks(), movie.getJourneyConveyance(), movie.getModelsrichConveyance(), movie.getAgentsassistantBatta(), movie.getSubagentName(), movie.getOthers(), movie.getTotalAmount(), movie.getAmountStatus(), movie.getImageMovie(), movie.getStatus(), ProductUtil.getInstance().getUserId() });
        }
    }

    @Override
    public int deleteMovie(int movieId) {
        return jdbcTemplate.update("DELETE FROM movie_master WHERE id=?", new Object[] { movieId });
    }

    @Override
    public Movie findMovieById(int id) {
        String sql = "SELECT id, company_name, movie_name, agent_name, agentcontact_no, manager_name, managercontact_no, junior_artist, gym_boys, rich_model, location, conveyance, tiffin, meals, untime_conveyance, midnight_snacks, journey_conveyance, models_rich_conveyance, agents_assistant_batta, sub_agent_name, others, total_amount, amount_status, image_movie, status, ent_by, ent_date FROM movie_master WHERE id='" + id + "'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<Movie>() {
            @Override
            public Movie extractData(ResultSet rs) throws SQLException, DataAccessException {
                Movie movie = new Movie();
                int i = 1;
                while (rs.next()) {
                    movie.setSerialNumber(i++);
                    movie.setMovieId(rs.getLong("id"));
                    movie.setCompanyName(rs.getString("companyname"));
                    movie.setMovieName(rs.getString("moviename"));
                    movie.setAgentName(rs.getString("agentname"));
                    movie.setAgentContactNo(rs.getString("agentcontact"));
                    movie.setManagerName(rs.getString("managername"));
                    movie.setManagerContactNo(rs.getString("managercontactno"));
                    movie.setJuniorArtist(rs.getString("juniorartist"));
                    movie.setGymBoys(rs.getString("gymboys"));
                    movie.setRichModel(rs.getString("richmodel"));
                    movie.setLocation(rs.getString("location"));
                    movie.setConveyance(rs.getString("conveyance"));
                    movie.setTiffin(rs.getString("tiffin"));
                    movie.setMeals(rs.getString("meals"));
                    movie.setUntimeConveyance(rs.getString("untimeconveyance"));
                    movie.setMidnightSnacks(rs.getString("midnightsnacks"));
                    movie.setJourneyConveyance(rs.getString("journeyconveyance"));
                    movie.setModelsrichConveyance(rs.getString("modelsrichconveyance"));
                    movie.setAgentsassistantBatta(rs.getString("agentassistantbatta"));
                    movie.setSubagentName(rs.getString("subagentname"));
                    movie.setOthers(rs.getString("others"));
                    movie.setTotalAmount(rs.getString("totalamount"));
                    movie.setAmountStatus(rs.getString("amountstatus"));
                    movie.setImageMovie(rs.getString("imagemovie"));                    
                    movie.setStatus(rs.getString("status"));
                }
                return movie;
            }
        });
    }

    @Override
    public int count() {
        return jdbcTemplate.queryForObject("SELECT count(*) FROM movie_master", Integer.class);
    }

    @Override
    public List<Movie> findAll(PageRequest page) {
        String sql = "SELECT * FROM movie_master where (UPPER(cust_id) like '%" + page.getSearch().toUpperCase() + "%' or UPPER(status) like '%" + page.getSearch().toUpperCase() + "%' or UPPER(cust_name) like '%" + page.getSearch().toUpperCase() + "%' or UPPER(cust_type) like '%" + page.getSearch().toUpperCase() + "%') ORDER BY cust_id " + page.getSort() + " LIMIT " + page.getSize() + " OFFSET " + page.getPage();
        return jdbcTemplate.query(sql, new ResultSetExtractor<List<Movie>>() {
            @Override
            public List<Movie> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<Movie> movieList = new ArrayList<>();
                int i = (page.getPage() / page.getSize()) * page.getSize() + 1;
                while (rs.next()) {
                    Movie movie = new Movie();
                    movie.setMovieId(rs.getLong("id"));
                    movie.setCompanyName(rs.getString("companyname"));
                    movie.setMovieName(rs.getString("moviename"));
                    movie.setAgentName(rs.getString("agentname"));
                    movie.setAgentContactNo(rs.getString("agentcontact"));
                    movie.setManagerName(rs.getString("managername"));
                    movie.setManagerContactNo(rs.getString("managercontactno"));
                    movie.setJuniorArtist(rs.getString("juniorartist"));
                    movie.setGymBoys(rs.getString("gymboys"));
                    movie.setRichModel(rs.getString("richmodel"));
                    movie.setLocation(rs.getString("location"));
                    movie.setConveyance(rs.getString("conveyance"));
                    movie.setTiffin(rs.getString("tiffin"));
                    movie.setMeals(rs.getString("meals"));
                    movie.setUntimeConveyance(rs.getString("untimeconveyance"));
                    movie.setMidnightSnacks(rs.getString("midnightsnacks"));
                    movie.setJourneyConveyance(rs.getString("journeyconveyance"));
                    movie.setModelsrichConveyance(rs.getString("modelsrichconveyance"));
                    movie.setAgentassistantBatta(rs.getString("agentassistantbatta"));
                    movie.setSubagentName(rs.getString("subagentname"));
                    movie.setOthers(rs.getString("others"));
                    movie.setTotalAmount(rs.getString("totalamount"));
                    movie.setAmountStatus(rs.getString("amountstatus"));
                    movie.setImageMovie(rs.getString("imagemovie"));                    
                    movie.setStatus(rs.getString("status"));
                }
                return movieList;
            }
        });
    }

    @Override
    public List<Movie> findByList() {
        String sql = "SELECT id, company_name, movie_name, agent_name, agentcontact_no, manager_name, managercontact_no, junior_artist, gym_boys, rich_model, location, conveyance, tiffin, meals, untime_conveyance, midnight_snacks, journey_conveyance, models_rich_conveyance, agents_assistant_batta, sub_agent_name, others, total_amount, amount_status, image_movie, status, ent_by, ent_date, mod_date, mod_by FROM movie_master where status='1'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<List<Movie>>() {
            @Override
            public List<Movie> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<Movie> movieList = new ArrayList<>();
                while (rs.next()) {
                    Movie movie = new Movie();
                    movie.setMovieId(rs.getLong("id"));
                    movie.setCompanyName(rs.getString("companyname"));
                    movie.setMovieName(rs.getString("moviename"));
                    movie.setAgentName(rs.getString("agentname"));
                    movie.setAgentContactNo(rs.getString("agentcontact"));
                    movie.setManagerName(rs.getString("managername"));
                    movie.setManagerContactNo(rs.getString("managercontactno"));
                    movie.setJuniorArtist(rs.getString("juniorartist"));
                    movie.setGymBoys(rs.getString("gymboys"));
                    movie.setRichModel(rs.getString("richmodel"));
                    movie.setLocation(rs.getString("location"));
                    movie.setConveyance(rs.getString("conveyance"));
                    movie.setTiffin(rs.getString("tiffin"));
                    movie.setMeals(rs.getString("meals"));
                    movie.setUntimeConveyance(rs.getString("untimeconveyance"));
                    movie.setMidnightSnacks(rs.getString("midnightsnacks"));
                    movie.setJourneyConveyance(rs.getString("journeyconveyance"));
                    movie.setModelsrichConveyance(rs.getString("modelsrichconveyance"));
                    movie.setAgentsassistantBatta(rs.getString("agentassistantbatta"));
                    movie.setSubagentName(rs.getString("subagentname"));
                    movie.setOthers(rs.getString("others"));
                    movie.setTotalAmount(rs.getString("totalamount"));
                    movie.setAmountStatus(rs.getString("amountstatus"));
                    movie.setImageMovie(rs.getString("imagemovie"));                    
                    movie.setStatus(rs.getString("status"));
                    movieList.add(movie);
                }
                return movieList;
            }
        });
    }

    public boolean saveOrUpdate(Long id) {
        String sql = "SELECT cust_id FROM movie_master where cust_id ='" + id + "'";
        int count = jdbcTemplate.queryForObject(sql, Integer.class);
        return count > 0;
    }

}
