package com.fefsi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.fefsi.exception.ProductBusinessException;
import com.fefsi.models.Movie;
import com.fefsi.models.CustomDTO;
import com.fefsi.models.PageRequest;
import com.fefsi.repository.MovieRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MovieService {

    @Autowired
    private MovieRepository movieRepository;

    public int saveOrUpdate(Movie movie) {
        int status = 0;
        try {
            log.info("Inside save");
            status = movieRepository.saveOrUpdateMovie(movie);
        } catch (DataIntegrityViolationException e) {
            throw new ProductBusinessException("Movie code already exist " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            throw new ProductBusinessException("Exception occurred while save Or Update the Movie");
        }
        return status;
    }

    public Movie findById(int id) {
        Movie customer = movieRepository.findMovieById(id);
        return customer;
    }

    public int deleteById(int id) {
        return movieRepository.deleteMovie(id);
    }

    public CustomDTO<Movie> findAll(PageRequest pageable) {
        try {
            List<Movie> Movie = movieRepository.findAll(pageable);
            CustomDTO<Movie> customDTO = new CustomDTO<>();
            customDTO.setData(Movie);
            customDTO.setRecordsFiltered(movieRepository.count());
            customDTO.setRecordsTotal(Movie.size());
            customDTO.setDraw(pageable.getDraw());
            return customDTO;
        } catch (Exception e) {
            throw new ProductBusinessException("FindAll Getting Exception" + e.getMessage());
        }
    }

    public List<Movie> findByList() {
        try {
            return movieRepository.findByList();
        } catch (Exception e) {
            throw new ProductBusinessException("findByList Getting Exception" + e.getMessage());
        }
    }

   

}