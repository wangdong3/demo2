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
import com.ruoyi.system.domain.Competition;
import com.ruoyi.system.service.ICompetitionService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 赛程Controller
 * 
 * @author ruoyi
 * @date 2020-12-08
 */
@Controller
@RequestMapping("/system/competition")
public class CompetitionController extends BaseController
{
    private String prefix = "system/competition";

    @Autowired
    private ICompetitionService competitionService;

    @RequiresPermissions("system:competition:view")
    @GetMapping()
    public String competition()
    {
        return prefix + "/competition";
    }

    /**
     * 查询赛程列表
     */
    @RequiresPermissions("system:competition:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Competition competition)
    {
        startPage();
        List<Competition> list = competitionService.selectCompetitionList(competition);
        return getDataTable(list);
    }

    /**
     * 导出赛程列表
     */
    @RequiresPermissions("system:competition:export")
    @Log(title = "赛程", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Competition competition)
    {
        List<Competition> list = competitionService.selectCompetitionList(competition);
        ExcelUtil<Competition> util = new ExcelUtil<Competition>(Competition.class);
        return util.exportExcel(list, "competition");
    }

    /**
     * 新增赛程
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存赛程
     */
    @RequiresPermissions("system:competition:add")
    @Log(title = "赛程", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Competition competition)
    {
        return toAjax(competitionService.insertCompetition(competition));
    }

    /**
     * 修改赛程
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Competition competition = competitionService.selectCompetitionById(id);
        mmap.put("competition", competition);
        return prefix + "/edit";
    }

    /**
     * 修改保存赛程
     */
    @RequiresPermissions("system:competition:edit")
    @Log(title = "赛程", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Competition competition)
    {
        return toAjax(competitionService.updateCompetition(competition));
    }

    /**
     * 删除赛程
     */
    @RequiresPermissions("system:competition:remove")
    @Log(title = "赛程", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(competitionService.deleteCompetitionByIds(ids));
    }
}
