package com.fefsi.repository;

import java.util.List;

import com.fefsi.models.License;
import com.fefsi.models.PageRequest;

public interface LicenseRepository {

    int saveOrUpdateLicense(License license);

    int deleteLicense(int id);

    License findLicenseById(int id);

    List<License> findAll(PageRequest pageable);

    int count();

    List<License> findByList();

}
