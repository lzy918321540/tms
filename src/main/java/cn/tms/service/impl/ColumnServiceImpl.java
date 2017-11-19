package cn.tms.service.impl;

import cn.tms.dao.IColumnDAO;
import cn.tms.entity.Column;
import cn.tms.entity.News;
import cn.tms.service.IColumnService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by administered on 2017/11/6.
 */
@Service("columnService")
public class ColumnServiceImpl implements IColumnService{
    @Resource(name = "IColumnDAO")
    IColumnDAO columnDAO;
    public List<Column> list() {
        return columnDAO.list();
    }



    public List<News> listname(String columnname) {
        return columnDAO.listname(columnname);
    }

    public int delnews(int id) {
        return columnDAO.delnews(id);
    }

    public int insernews(News news) {
        return columnDAO.insernews(news);
    }

}
