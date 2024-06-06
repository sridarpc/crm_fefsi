package com.fefsi.repository;

import java.util.List;

import com.fefsi.models.Movie;
import com.fefsi.models.PageRequest;

public interface MovieRepository {

    int saveOrUpdateMovie(Movie movie);

    int deleteMovie(int id);

    Movie findMovieById(int id);

    List<Movie> findAll(PageRequest pageable);

    int count();

    List<Movie> findByList();


}
