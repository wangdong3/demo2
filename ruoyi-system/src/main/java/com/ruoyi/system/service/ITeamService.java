package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Team;

/**
 * 球队Service接口
 * 
 * @author ruoyi
 * @date 2020-12-03
 */
public interface ITeamService 
{
    /**
     * 查询球队
     * 
     * @param id 球队ID
     * @return 球队
     */
    public Team selectTeamById(Long id);

    /**
     * 查询球队列表
     * 
     * @param team 球队
     * @return 球队集合
     */
    public List<Team> selectTeamList(Team team);

    /**
     * 新增球队
     * 
     * @param team 球队
     * @return 结果
     */
    public int insertTeam(Team team);

    /**
     * 修改球队
     * 
     * @param team 球队
     * @return 结果
     */
    public int updateTeam(Team team);

    /**
     * 批量删除球队
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTeamByIds(String ids);

    /**
     * 删除球队信息
     * 
     * @param id 球队ID
     * @return 结果
     */
    public int deleteTeamById(Long id);
}
