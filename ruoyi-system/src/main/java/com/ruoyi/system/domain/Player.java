package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 球员对象 player
 * 
 * @author ruoyi
 * @date 2020-12-08
 */
public class Player extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 球队id */
    @Excel(name = "球队id")
    private Long teamId;

    /** 球队名称 */
    @Excel(name = "球队名称")
    private String teamName;

    /** 头像 */
    @Excel(name = "头像")
    private String headPortrait;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 出生年月 */
    @Excel(name = "出生年月")
    private String birthdate;

    /** 位置 */
    @Excel(name = "位置")
    private String location;

    /** 国籍/籍贯 */
    @Excel(name = "国籍/籍贯")
    private String nationality;

    /** 出场 */
    @Excel(name = "出场")
    private String appearance;

    /** 进球 */
    @Excel(name = "进球")
    private String goals;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setTeamId(Long teamId) 
    {
        this.teamId = teamId;
    }

    public Long getTeamId() 
    {
        return teamId;
    }
    public void setHeadPortrait(String headPortrait) 
    {
        this.headPortrait = headPortrait;
    }

    public String getHeadPortrait() 
    {
        return headPortrait;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setBirthdate(String birthdate) 
    {
        this.birthdate = birthdate;
    }

    public String getBirthdate() 
    {
        return birthdate;
    }
    public void setLocation(String location) 
    {
        this.location = location;
    }

    public String getLocation() 
    {
        return location;
    }
    public void setNationality(String nationality) 
    {
        this.nationality = nationality;
    }

    public String getNationality() 
    {
        return nationality;
    }
    public void setAppearance(String appearance) 
    {
        this.appearance = appearance;
    }

    public String getAppearance() 
    {
        return appearance;
    }
    public void setGoals(String goals) 
    {
        this.goals = goals;
    }

    public String getGoals() 
    {
        return goals;
    }

    public String getTeamName()
    {
        return teamName;
    }
    public void setTeamName(String teamName)
    {
        this.teamName = teamName;
    }
    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("teamId", getTeamId())
            .append("teamName", getTeamName())
            .append("headPortrait", getHeadPortrait())
            .append("name", getName())
            .append("birthdate", getBirthdate())
            .append("location", getLocation())
            .append("nationality", getNationality())
            .append("appearance", getAppearance())
            .append("goals", getGoals())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
