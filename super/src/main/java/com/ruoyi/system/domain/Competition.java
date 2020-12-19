package com.ruoyi.system.domain;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 赛程对象 competition
 * 
 * @author 555
 * @date 2020-12-08
 */
public class Competition extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 参赛球队甲方id */
    @Excel(name = "参赛球队甲方id")
    private Long teamAId;

    /** 参赛球队甲方名称 */
    @Excel(name = "参赛球队甲方名称")
    private String teamAName;

    /** 参赛球队乙方id */
    @Excel(name = "参赛球队乙方id")
    private Long teamBId;

    /** 参赛球队乙方名称 */
    @Excel(name = "参赛球队乙方名称")
    private String teamBName;

    /** 时间 */
    @Excel(name = "时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date gameTime;

    /** 地点 */
    @Excel(name = "地点")
    private String site;

    /** 场次 */
    @Excel(name = "场次")
    private String session;

    /** 甲方球队分数 */
    @Excel(name = "甲方球队分数")
    private Long partAGoals;

    /** 乙方球队分数 */
    @Excel(name = "乙方球队分数")
    private Long partBGoals;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setTeamAId(Long teamAId) 
    {
        this.teamAId = teamAId;
    }

    public Long getTeamAId() 
    {
        return teamAId;
    }
    public void setTeamBId(Long teamBId) 
    {
        this.teamBId = teamBId;
    }

    public Long getTeamBId() 
    {
        return teamBId;
    }
    public void setGameTime(Date gameTime) 
    {
        this.gameTime = gameTime;
    }

    public Date getGameTime() 
    {
        return gameTime;
    }
    public void setSite(String site) 
    {
        this.site = site;
    }

    public String getSite() 
    {
        return site;
    }
    public void setSession(String session) 
    {
        this.session = session;
    }

    public String getSession() 
    {
        return session;
    }
    public void setPartAGoals(Long partAGoals) 
    {
        this.partAGoals = partAGoals;
    }

    public Long getPartAGoals() 
    {
        return partAGoals;
    }
    public void setPartBGoals(Long partBGoals) 
    {
        this.partBGoals = partBGoals;
    }

    public Long getPartBGoals() 
    {
        return partBGoals;
    }

    public String getTeamAName()
    {
        return teamAName;
    }
    public void setTeamAName(String teamAName)
    {
        this.teamAName = teamAName;
    }
    public String getTeamBName()
    {
        return teamBName;
    }
    public void setTeamBName(String teamBName)
    {
        this.teamBName = teamBName;
    }
    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("teamAId", getTeamAId())
            .append("teamAName", getTeamAName())
            .append("teamBId", getTeamBId())
            .append("teamBName", getTeamBName())
            .append("gameTime", getGameTime())
            .append("site", getSite())
            .append("session", getSession())
            .append("partAGoals", getPartAGoals())
            .append("partBGoals", getPartBGoals())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
