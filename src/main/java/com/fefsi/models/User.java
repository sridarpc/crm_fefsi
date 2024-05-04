package com.fefsi.models;

import java.util.HashSet;
import java.util.Set;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
public class User extends UserAudit {

    private static final long serialVersionUID = 1L;

    private Long id;

    @NotBlank
    @Size(max = 20)
    private String loginId;

    @NotBlank
    @Size(max = 50)
    private String password;

    private String designationId;

    private Set<Roles> roles = new HashSet<>();

    public User() {
    }

    public User(String loginId, String password) {
        this.loginId = loginId;
        this.password = password;
    }

}
