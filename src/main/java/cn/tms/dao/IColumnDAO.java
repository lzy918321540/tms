package cn.tms.dao;

import cn.tms.entity.Column;
import cn.tms.entity.News;

import java.util.List;

/**
 * Created by administered on 2017/11/6.
 */
public interface IColumnDAO {
    public List<Column> list();

    public List<News> listname(String columnname);

    //删除
    public int delnews(int id);

    //添加
    public int insernews(News news);
}
