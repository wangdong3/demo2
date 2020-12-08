package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysNews;

/**
 * 新闻Service接口
 * 
 * @author ruoyi
 * @date 2020-12-08
 */
public interface ISysNewsService 
{
    /**
     * 查询新闻
     * 
     * @param newsId 新闻ID
     * @return 新闻
     */
    public SysNews selectSysNewsById(Long newsId);

    /**
     * 查询新闻列表
     * 
     * @param sysNews 新闻
     * @return 新闻集合
     */
    public List<SysNews> selectSysNewsList(SysNews sysNews);

    /**
     * 新增新闻
     * 
     * @param sysNews 新闻
     * @return 结果
     */
    public int insertSysNews(SysNews sysNews);

    /**
     * 修改新闻
     * 
     * @param sysNews 新闻
     * @return 结果
     */
    public int updateSysNews(SysNews sysNews);

    /**
     * 批量删除新闻
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysNewsByIds(String ids);

    /**
     * 删除新闻信息
     * 
     * @param newsId 新闻ID
     * @return 结果
     */
    public int deleteSysNewsById(Long newsId);
}
