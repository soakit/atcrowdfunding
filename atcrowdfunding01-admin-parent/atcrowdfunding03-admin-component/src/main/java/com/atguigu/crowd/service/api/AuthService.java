package com.atguigu.crowd.service.api;

import com.atguigu.crowd.entity.Auth;

import java.util.List;
import java.util.Map;

public interface AuthService {
    List<Auth> getAll();

    List<Integer> getAssignedAuthIdByRoleId(Integer roleId);

    List<String> getAssignedAuthNameByAdminId(Integer adminId);

    void saveRoleAuthRelationship(Map<String, List<Integer>> map);
}
