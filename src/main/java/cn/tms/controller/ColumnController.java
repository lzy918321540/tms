package cn.tms.controller;

import cn.tms.entity.Column;
import cn.tms.entity.News;
import cn.tms.entity.Privilege;
import cn.tms.entity.UserInfo;
import cn.tms.service.IColumnService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.swing.*;
import javax.xml.ws.*;
import javax.xml.ws.Action;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.SimpleFormatter;

/**
 * Created by administered on 2017/11/6.
 */
@Controller
@RequestMapping("/column")
public class ColumnController {

    @Resource(name = "columnService")
    IColumnService columnService;

    @ResponseBody
    @RequestMapping("/lists")
    public Object list(HttpSession session){
        //新的容器 保存有父子关系的权限
        List<Column> columns=new ArrayList<Column>();
        List<Column> list = columnService.list();
        for (Column item:list) {
            Column childMenu=item;
           String pid= childMenu.getParentcode();
           if (pid.equals("0")){
               columns.add(item);
           }else{
               for (Column innerMenu:list) {
                String id=  innerMenu.getSyscode();
                if (id.equals(pid)){
                    Column parentMenu=innerMenu;
                    parentMenu.getChildren().add(childMenu);
                    break;
                }
               }
           }
        }

        return columns;
    }


    //列表
    @ResponseBody
    @RequestMapping("/listname")
    public Object listnewsname(String columnname,HttpSession session) throws UnsupportedEncodingException {

        session.setAttribute("columnname",columnname);

        String str=new String(columnname.getBytes("ISO-8859-1"),"UTF-8");
        List<News> newss = columnService.listname(str);
        for (News item:newss){
            System.out.println(item.getStatus());
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            String format = sdf.format(item.getUpdatetime());
            item.setDatetime(format);

        }
        return newss;
    }

    //删除
    @ResponseBody
    @RequestMapping("/delnews")
    public Object delnews(int id){
        int delnews = columnService.delnews(id);
        return delnews;
    }

    //添加
    @ResponseBody
    @RequestMapping("/insernews")
    public Object insernews(News news,HttpSession session){

        UserInfo userinfo =(UserInfo) session.getAttribute("userinfo");
        String username = userinfo.getUsername();
        news.setCreator(username);
        System.out.println(news.getZhenwenn()+"________________");
        System.out.println(news.getDefaulttitle()+"__________________");
        int insernews = columnService.insernews(news);
        return insernews;
    }
}
