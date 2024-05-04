package com.fefsi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.fefsi.exception.ProductBusinessException;
import com.fefsi.models.CustomDTO;
import com.fefsi.models.License;
import com.fefsi.models.PageRequest;
import com.fefsi.repository.LicenseRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class LicenseService {

    @Autowired
    private LicenseRepository licenseRepository;

    public int saveOrUpdate(License License) {
        int status = 0;
        try {
            log.info("Inside save");
            status = licenseRepository.saveOrUpdateLicense(License);
        } catch (DataIntegrityViolationException e) {
            throw new ProductBusinessException("License code already exist " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            throw new ProductBusinessException("Exception occurred while save Or Update the License");
        }
        return status;
    }

    public License findById(int id) {
        License license = licenseRepository.findLicenseById(id);
        return license;
    }

    public int deleteById(int id) {
        return licenseRepository.deleteLicense(id);
    }

    public CustomDTO<License> findAll(PageRequest pageable) {
        try {
            List<License> License = licenseRepository.findAll(pageable);
            CustomDTO<License> customDTO = new CustomDTO<>();
            customDTO.setData(License);
            customDTO.setRecordsFiltered(licenseRepository.count());
            customDTO.setRecordsTotal(License.size());
            customDTO.setDraw(pageable.getDraw());
            return customDTO;
        } catch (Exception e) {
            throw new ProductBusinessException("FindAll Getting Exception" + e.getMessage());
        }
    }

    public List<License> findByList() {
        try {
            return licenseRepository.findByList();
        } catch (Exception e) {
            throw new ProductBusinessException("findByList Getting Exception" + e.getMessage());
        }
    }

}