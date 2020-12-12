package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 球队对象 team
 * 
 * @author ruoyi
 * @date 2020-12-03
 */
public class Team extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private String id;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String logo;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String name;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long win;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long lose;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long flat;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long score;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long session;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long goal;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long conceded;

    public void setId(String id)
    {
        this.id = id;
    }

    public String getId()
    {
        return id;
    }
    public void setLogo(String logo) 
    {
        this.logo = logo;
    }

    public String getLogo() 
    {
        return logo;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setWin(Long win) 
    {
        this.win = win;
    }

    public Long getWin() 
    {
        return win;
    }
    public void setLose(Long lose) 
    {
        this.lose = lose;
    }

    public Long getLose() 
    {
        return lose;
    }
    public void setFlat(Long flat) 
    {
        this.flat = flat;
    }

    public Long getFlat() 
    {
        return flat;
    }
    public void setScore(Long score) 
    {
        this.score = score;
    }

    public Long getScore() 
    {
        return score;
    }
    public void setSession(Long session) 
    {
        this.session = session;
    }

    public Long getSession() 
    {
        return session;
    }
    public void setGoal(Long goal) 
    {
        this.goal = goal;
    }

    public Long getGoal() 
    {
        return goal;
    }
    public void setConceded(Long conceded) 
    {
        this.conceded = conceded;
    }

    public Long getConceded() 
    {
        return conceded;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("logo", getLogo())
            .append("name", getName())
            .append("win", getWin())
            .append("lose", getLose())
            .append("flat", getFlat())
            .append("score", getScore())
            .append("session", getSession())
            .append("goal", getGoal())
            .append("conceded", getConceded())
            .toString();
    }
}
