package com.ruoyi.web.controller.common;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ruoyi.common.core.page.PageDomain;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.page.TableSupport;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.sql.SqlUtil;
import com.ruoyi.system.domain.Competition;
import com.ruoyi.system.domain.Player;
import com.ruoyi.system.domain.SysNews;
import com.ruoyi.system.domain.Team;
import com.ruoyi.system.service.ICompetitionService;
import com.ruoyi.system.service.IPlayerService;
import com.ruoyi.system.service.ISysNewsService;
import com.ruoyi.system.service.ITeamService;
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
 * VisitController
 *
 * @author wangdong on 2020/12/14 8:48
 * @version 2.0
 */
@Controller
@RequestMapping("visitor")
public class VisitController
{
    @Autowired
    private ITeamService teamService;

    @Autowired
    private IPlayerService playerService;

    @Autowired
    private ICompetitionService competitionService;

    @Autowired
    private ISysNewsService sysNewsService;

    /**
     * 查询球队列表
     */
    @PostMapping("team/list")
    @ResponseBody
    public TableDataInfo list(Team team)
    {
        startPage();
        List<Team> list = teamService.selectTeamList(team);
        return getDataTable(list);
    }

    @GetMapping("/team/detail/{id}")
    public String detail(@PathVariable("id") Long id, ModelMap mmap)
    {
        Team team = teamService.selectTeamById(id);
        mmap.put("team", team);
        return "system/team/detail";
    }

    /**
     * 查询球员列表
     */
    @PostMapping("player/list")
    @ResponseBody
    public TableDataInfo list(Player player)
    {
        startPage();
        List<Player> list = playerService.selectPlayerList(player);
        return getDataTable(list);
    }

    /**
     * 查询赛程列表
     */
    @PostMapping("competition/list")
    @ResponseBody
    public TableDataInfo list(Competition competition)
    {
        startPage();
        List<Competition> list = competitionService.selectCompetitionList(competition);
        return getDataTable(list);
    }

    /**
     * 查询新闻列表
     */
    @PostMapping("news/list")
    @ResponseBody
    public TableDataInfo list(SysNews sysNews)
    {
        startPage();
        List<SysNews> list = sysNewsService.selectSysNewsList(sysNews);
        return getDataTable(list);
    }

    protected TableDataInfo getDataTable(List<?> list)
    {
        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(0);
        rspData.setRows(list);
        rspData.setTotal(new PageInfo(list).getTotal());
        return rspData;
    }

    /**
     * 设置请求分页数据
     */
    protected void startPage()
    {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        if (StringUtils.isNotNull(pageNum) && StringUtils.isNotNull(pageSize))
        {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            PageHelper.startPage(pageNum, pageSize, orderBy);
        }
    }
}
