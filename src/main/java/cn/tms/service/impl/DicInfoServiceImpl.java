package cn.tms.service.impl;

import cn.tms.dao.IDicInfoDAO;
import cn.tms.entity.DicInfo;
import cn.tms.service.IDicInfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("dicService")
public class DicInfoServiceImpl implements IDicInfoService {
    @Resource(name = "IDicInfoDAO")
    IDicInfoDAO dicInfoDAO;

    public List<DicInfo> findAllTeacher() {
        return dicInfoDAO.findAllTeacher();
    }

    public List<DicInfo> findAllLab() {
        return dicInfoDAO.findAllLab();
    }
}
