package com.ruoyi.web.controller.system;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.SysNews;
import com.ruoyi.system.service.ISysNewsService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 新闻Controller
 * 
 * @author 555
 * @date 2020-12-08
 */
@Controller
@RequestMapping("/system/news")
public class SysNewsController extends BaseController
{
    private String prefix = "system/news";

    @Autowired
    private ISysNewsService sysNewsService;

    @RequiresPermissions("system:news:view")
    @GetMapping()
    public String news()
    {
        return prefix + "/news";
    }

    /**
     * 查询新闻列表
     */
    @RequiresPermissions("system:news:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysNews sysNews)
    {
        startPage();
        List<SysNews> list = sysNewsService.selectSysNewsList(sysNews);
        return getDataTable(list);
    }

    /**
     * 导出新闻列表
     */
    @RequiresPermissions("system:news:export")
    @Log(title = "新闻", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysNews sysNews)
    {
        List<SysNews> list = sysNewsService.selectSysNewsList(sysNews);
        ExcelUtil<SysNews> util = new ExcelUtil<SysNews>(SysNews.class);
        return util.exportExcel(list, "news");
    }

    /**
     * 新增新闻
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存新闻
     */
    @RequiresPermissions("system:news:add")
    @Log(title = "新闻", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SysNews sysNews)
    {
        return toAjax(sysNewsService.insertSysNews(sysNews));
    }

    /**
     * 修改新闻
     */
    @GetMapping("/edit/{newsId}")
    public String edit(@PathVariable("newsId") Long newsId, ModelMap mmap)
    {
        SysNews sysNews = sysNewsService.selectSysNewsById(newsId);
        mmap.put("sysNews", sysNews);
        return prefix + "/edit";
    }

    /**
     * 修改保存新闻
     */
    @RequiresPermissions("system:news:edit")
    @Log(title = "新闻", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SysNews sysNews)
    {
        return toAjax(sysNewsService.updateSysNews(sysNews));
    }

    /**
     * 删除新闻
     */
    @RequiresPermissions("system:news:remove")
    @Log(title = "新闻", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(sysNewsService.deleteSysNewsByIds(ids));
    }
}
