package cn.tms.dao;

import cn.tms.entity.DicInfo;

import java.util.List;


public interface IDicInfoDAO {
    //1.获取所有教师集合
    public List<DicInfo> findAllTeacher();
    //2.获取所有机房集合
    public List<DicInfo> findAllLab();
}
