package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.TeamMapper;
import com.ruoyi.system.domain.Team;
import com.ruoyi.system.service.ITeamService;
import com.ruoyi.common.core.text.Convert;

/**
 * 球队Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-12-03
 */
@Service
public class TeamServiceImpl implements ITeamService 
{
    @Autowired
    private TeamMapper teamMapper;

    /**
     * 查询球队
     * 
     * @param id 球队ID
     * @return 球队
     */
    @Override
    public Team selectTeamById(Long id)
    {
        return teamMapper.selectTeamById(id);
    }

    /**
     * 查询球队列表
     * 
     * @param team 球队
     * @return 球队
     */
    @Override
    public List<Team> selectTeamList(Team team)
    {
        return teamMapper.selectTeamList(team);
    }

    /**
     * 新增球队
     * 
     * @param team 球队
     * @return 结果
     */
    @Override
    public int insertTeam(Team team)
    {
        return teamMapper.insertTeam(team);
    }

    /**
     * 修改球队
     * 
     * @param team 球队
     * @return 结果
     */
    @Override
    public int updateTeam(Team team)
    {
        return teamMapper.updateTeam(team);
    }

    /**
     * 删除球队对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTeamByIds(String ids)
    {
        return teamMapper.deleteTeamByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除球队信息
     * 
     * @param id 球队ID
     * @return 结果
     */
    @Override
    public int deleteTeamById(Long id)
    {
        return teamMapper.deleteTeamById(id);
    }
}
