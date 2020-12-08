package com.ruoyi.web.controller.system;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.Player;
import com.ruoyi.system.service.IPlayerService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 球员Controller
 * 
 * @author ruoyi
 * @date 2020-12-08
 */
@Controller
@RequestMapping("/system/player")
public class PlayerController extends BaseController
{
    private String prefix = "system/player";

    @Autowired
    private IPlayerService playerService;

    @RequiresPermissions("system:player:view")
    @GetMapping()
    public String player()
    {
        return prefix + "/player";
    }

    /**
     * 查询球员列表
     */
    @RequiresPermissions("system:player:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Player player)
    {
        startPage();
        List<Player> list = playerService.selectPlayerList(player);
        return getDataTable(list);
    }

    /**
     * 导出球员列表
     */
    @RequiresPermissions("system:player:export")
    @Log(title = "球员", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Player player)
    {
        List<Player> list = playerService.selectPlayerList(player);
        ExcelUtil<Player> util = new ExcelUtil<Player>(Player.class);
        return util.exportExcel(list, "player");
    }

    /**
     * 新增球员
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存球员
     */
    @RequiresPermissions("system:player:add")
    @Log(title = "球员", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Player player)
    {
        return toAjax(playerService.insertPlayer(player));
    }

    /**
     * 修改球员
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Player player = playerService.selectPlayerById(id);
        mmap.put("player", player);
        return prefix + "/edit";
    }

    /**
     * 修改保存球员
     */
    @RequiresPermissions("system:player:edit")
    @Log(title = "球员", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Player player)
    {
        return toAjax(playerService.updatePlayer(player));
    }

    /**
     * 删除球员
     */
    @RequiresPermissions("system:player:remove")
    @Log(title = "球员", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(playerService.deletePlayerByIds(ids));
    }
}
