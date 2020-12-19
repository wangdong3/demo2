package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Player;

/**
 * 球员Service接口
 * 
 * @author 555
 * @date 2020-12-08
 */
public interface IPlayerService 
{
    /**
     * 查询球员
     * 
     * @param id 球员ID
     * @return 球员
     */
    public Player selectPlayerById(Long id);

    /**
     * 查询球员列表
     * 
     * @param player 球员
     * @return 球员集合
     */
    public List<Player> selectPlayerList(Player player);

    /**
     * 新增球员
     * 
     * @param player 球员
     * @return 结果
     */
    public int insertPlayer(Player player);

    /**
     * 修改球员
     * 
     * @param player 球员
     * @return 结果
     */
    public int updatePlayer(Player player);

    /**
     * 批量删除球员
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deletePlayerByIds(String ids);

    /**
     * 删除球员信息
     * 
     * @param id 球员ID
     * @return 结果
     */
    public int deletePlayerById(Long id);
}
