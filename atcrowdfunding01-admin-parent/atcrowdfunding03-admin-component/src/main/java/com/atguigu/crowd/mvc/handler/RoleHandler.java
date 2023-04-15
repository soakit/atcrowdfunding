package com.atguigu.crowd.mvc.handler;

import com.atguigu.crowd.entity.Role;
import com.atguigu.crowd.service.api.RoleService;
import com.atguigu.crowd.util.ResultEntity;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class RoleHandler {

    @Autowired
    private RoleService roleService;

    // 返回json
    @PreAuthorize("hasRole('部门助理') OR hasAuthority('role:get')")
    @RequestMapping("/role/get/page/info.do")
    public ResultEntity<PageInfo<Role>> getPageInfo(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                                    @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
                                                    @RequestParam(value = "keyword", defaultValue = "") String keyword) {
        // 调用service获取分页数据
        PageInfo<Role> pageInfo = roleService.getPageInfo(pageNum, pageSize, keyword);
        return ResultEntity.successWithData(pageInfo);
    }

    @PreAuthorize("hasRole('部门负责人') OR hasAuthority('role:save')")
    @RequestMapping("/role/save.do")
    public ResultEntity<String> saveRole(@RequestParam("roleName") String roleName) {

        roleService.saveRole(new Role(null, roleName));

        return ResultEntity.successWithoutData();
    }

    @PreAuthorize("hasRole('部门负责人') OR hasAuthority('role:save')")
    @RequestMapping("/role/update.do")
    public ResultEntity<String> updateRole(Role role) {

        roleService.updateRole(role);
        return ResultEntity.successWithoutData();
    }

    @PreAuthorize("hasRole('部门负责人') OR hasAuthority('role:delete')")
    @RequestMapping("/role/remove/by/role/id/array.do")
    public ResultEntity<String> removeByRoleIdArray(@RequestBody List<Integer> roleIdList) {

        roleService.removeRole(roleIdList);

        return ResultEntity.successWithoutData();
    }
}