package cn.tms.service;

import cn.tms.entity.Column;
import cn.tms.entity.News;

import java.util.List;

/**
 * Created by administered on 2017/11/6.
 */
public interface IColumnService {

    public List<Column> list();

    public List<News> listname(String columnname);

    //删除
    public int delnews(int id);

    public int insernews(News news);
}
