package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.PlayerMapper;
import com.ruoyi.system.domain.Player;
import com.ruoyi.system.service.IPlayerService;
import com.ruoyi.common.core.text.Convert;

/**
 * 球员Service业务层处理
 * 
 * @author 555
 * @date 2020-12-08
 */
@Service
public class PlayerServiceImpl implements IPlayerService 
{
    @Autowired
    private PlayerMapper playerMapper;

    /**
     * 查询球员
     * 
     * @param id 球员ID
     * @return 球员
     */
    @Override
    public Player selectPlayerById(Long id)
    {
        return playerMapper.selectPlayerById(id);
    }

    /**
     * 查询球员列表
     * 
     * @param player 球员
     * @return 球员
     */
    @Override
    public List<Player> selectPlayerList(Player player)
    {
        return playerMapper.selectPlayerList(player);
    }

    /**
     * 新增球员
     * 
     * @param player 球员
     * @return 结果
     */
    @Override
    public int insertPlayer(Player player)
    {
        player.setCreateTime(DateUtils.getNowDate());
        return playerMapper.insertPlayer(player);
    }

    /**
     * 修改球员
     * 
     * @param player 球员
     * @return 结果
     */
    @Override
    public int updatePlayer(Player player)
    {
        player.setUpdateTime(DateUtils.getNowDate());
        return playerMapper.updatePlayer(player);
    }

    /**
     * 删除球员对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deletePlayerByIds(String ids)
    {
        return playerMapper.deletePlayerByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除球员信息
     * 
     * @param id 球员ID
     * @return 结果
     */
    @Override
    public int deletePlayerById(Long id)
    {
        return playerMapper.deletePlayerById(id);
    }
}
