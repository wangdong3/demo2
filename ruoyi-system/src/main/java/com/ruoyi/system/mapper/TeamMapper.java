package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Team;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2020-12-03
 */
public interface TeamMapper 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public Team selectTeamById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param team 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<Team> selectTeamList(Team team);

    /**
     * 新增【请填写功能名称】
     * 
     * @param team 【请填写功能名称】
     * @return 结果
     */
    public int insertTeam(Team team);

    /**
     * 修改【请填写功能名称】
     * 
     * @param team 【请填写功能名称】
     * @return 结果
     */
    public int updateTeam(Team team);

    /**
     * 删除【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteTeamById(Long id);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTeamByIds(String[] ids);
}
