package com.ruoyi.web.controller.system;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.Team;
import com.ruoyi.system.service.ITeamService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.List;

/**
 * 球队Controller
 * 
 * @author 555
 * @date 2020-12-03
 */
@Controller
@RequestMapping("/system/team")
public class TeamController extends BaseController
{
    private String prefix = "system/team";

    @Autowired
    private ITeamService teamService;

    @RequiresPermissions("system:team:view")
    @GetMapping()
    public String team()
    {
        return prefix + "/team";
    }

    /**
     * 查询球队列表
     */
    @RequiresPermissions("system:team:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Team team)
    {
        startPage();
        List<Team> list = teamService.selectTeamList(team);
        return getDataTable(list);
    }

    /**
     * 导出球队列表
     */
    @RequiresPermissions("system:team:export")
    @Log(title = "球队", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Team team)
    {
        List<Team> list = teamService.selectTeamList(team);
        ExcelUtil<Team> util = new ExcelUtil<Team>(Team.class);
        return util.exportExcel(list, "team");
    }

    /**
     * 新增球队
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存球队
     */
    @RequiresPermissions("system:team:add")
    @Log(title = "球队", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Team team) throws IOException
    {
        return toAjax(teamService.insertTeam(team));
    }

    /**
     * 修改球队
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Team team = teamService.selectTeamById(id);
        mmap.put("team", team);
        return prefix + "/edit";
    }

    /**
     * 修改保存球队
     */
    @RequiresPermissions("system:team:edit")
    @Log(title = "球队", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Team team)
    {
        return toAjax(teamService.updateTeam(team));
    }

    /**
     * 删除球队
     */
    @RequiresPermissions("system:team:remove")
    @Log(title = "球队", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(teamService.deleteTeamByIds(ids));
    }
}
