package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.TeamMapper;
import com.ruoyi.system.domain.Team;
import com.ruoyi.system.service.ITeamService;
import com.ruoyi.common.core.text.Convert;

/**
 * 【请填写功能名称】Service业务层处理
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
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public Team selectTeamById(Long id)
    {
        return teamMapper.selectTeamById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param team 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<Team> selectTeamList(Team team)
    {
        return teamMapper.selectTeamList(team);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param team 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertTeam(Team team)
    {
        return teamMapper.insertTeam(team);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param team 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateTeam(Team team)
    {
        return teamMapper.updateTeam(team);
    }

    /**
     * 删除【请填写功能名称】对象
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
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    @Override
    public int deleteTeamById(Long id)
    {
        return teamMapper.deleteTeamById(id);
    }
}
