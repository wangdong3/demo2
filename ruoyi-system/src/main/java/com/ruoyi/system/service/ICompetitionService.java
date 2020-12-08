package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Competition;

/**
 * 赛程Service接口
 * 
 * @author ruoyi
 * @date 2020-12-08
 */
public interface ICompetitionService 
{
    /**
     * 查询赛程
     * 
     * @param id 赛程ID
     * @return 赛程
     */
    public Competition selectCompetitionById(Long id);

    /**
     * 查询赛程列表
     * 
     * @param competition 赛程
     * @return 赛程集合
     */
    public List<Competition> selectCompetitionList(Competition competition);

    /**
     * 新增赛程
     * 
     * @param competition 赛程
     * @return 结果
     */
    public int insertCompetition(Competition competition);

    /**
     * 修改赛程
     * 
     * @param competition 赛程
     * @return 结果
     */
    public int updateCompetition(Competition competition);

    /**
     * 批量删除赛程
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteCompetitionByIds(String ids);

    /**
     * 删除赛程信息
     * 
     * @param id 赛程ID
     * @return 结果
     */
    public int deleteCompetitionById(Long id);
}
