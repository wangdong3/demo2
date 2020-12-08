package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.CompetitionMapper;
import com.ruoyi.system.domain.Competition;
import com.ruoyi.system.service.ICompetitionService;
import com.ruoyi.common.core.text.Convert;

/**
 * 赛程Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-12-08
 */
@Service
public class CompetitionServiceImpl implements ICompetitionService 
{
    @Autowired
    private CompetitionMapper competitionMapper;

    /**
     * 查询赛程
     * 
     * @param id 赛程ID
     * @return 赛程
     */
    @Override
    public Competition selectCompetitionById(Long id)
    {
        return competitionMapper.selectCompetitionById(id);
    }

    /**
     * 查询赛程列表
     * 
     * @param competition 赛程
     * @return 赛程
     */
    @Override
    public List<Competition> selectCompetitionList(Competition competition)
    {
        return competitionMapper.selectCompetitionList(competition);
    }

    /**
     * 新增赛程
     * 
     * @param competition 赛程
     * @return 结果
     */
    @Override
    public int insertCompetition(Competition competition)
    {
        competition.setCreateTime(DateUtils.getNowDate());
        return competitionMapper.insertCompetition(competition);
    }

    /**
     * 修改赛程
     * 
     * @param competition 赛程
     * @return 结果
     */
    @Override
    public int updateCompetition(Competition competition)
    {
        competition.setUpdateTime(DateUtils.getNowDate());
        return competitionMapper.updateCompetition(competition);
    }

    /**
     * 删除赛程对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteCompetitionByIds(String ids)
    {
        return competitionMapper.deleteCompetitionByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除赛程信息
     * 
     * @param id 赛程ID
     * @return 结果
     */
    @Override
    public int deleteCompetitionById(Long id)
    {
        return competitionMapper.deleteCompetitionById(id);
    }
}
