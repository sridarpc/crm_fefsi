package com.fefsi.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public final class ApplicationProperties {

    @Value("${ingot.app.jwtSecret}")
    private String jwtSecret;

    @Value("${ingot.app.jwtExpirationMs}")
    private int jwtExpirationMs;

    @Value("${ingot.app.jwtRefreshExpirationMs}")
    private Long refreshTokenDurationMs;

}
