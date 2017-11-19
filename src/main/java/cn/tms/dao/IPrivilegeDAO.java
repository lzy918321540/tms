package cn.tms.dao;

import cn.tms.entity.Privilege;

import java.util.List;
import java.util.Map;

public interface IPrivilegeDAO {
    //01.根据    用户编号  获取所有  【权限】
    public List<Privilege> getAllPrivilegesByEmpId(String id);
    //02.获取所有权限集合
    public List<Privilege> getAllPrivileges();
    //03.获取指定角色下所有权限
    public List<Privilege> getAllPrivilegesByRoldId(String rid);
    //04.删除指定角色的所有权限
    public int delPrivilegeByRoldId(String rid);
    //05.向角色权限表中添加数据
    public int addDataToRolePrivilege(Map<String, Object> map);
}
