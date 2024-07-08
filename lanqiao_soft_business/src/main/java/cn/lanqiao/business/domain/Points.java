package cn.lanqiao.business.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import cn.lanqiao.common.annotation.Excel;
import cn.lanqiao.common.core.domain.BaseEntity;

/**
 * 积分记录对象 points
 * 
 * @author lmx
 * @date 2024-07-08
 */
public class Points extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 积分记录唯一标识 */
    private Long id;

    /** 学期名称 */
    @Excel(name = "学期名称")
    private String semName;

    /** 学生唯一标识 */
    @Excel(name = "学生唯一标识")
    private Long stuId;

    /** 积分修改原因 */
    @Excel(name = "积分修改原因")
    private String upPoints;

    /** 积分修改值 */
    @Excel(name = "积分修改值")
    private Long upScore;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setSemName(String semName) 
    {
        this.semName = semName;
    }

    public String getSemName() 
    {
        return semName;
    }
    public void setStuId(Long stuId) 
    {
        this.stuId = stuId;
    }

    public Long getStuId() 
    {
        return stuId;
    }
    public void setUpPoints(String upPoints) 
    {
        this.upPoints = upPoints;
    }

    public String getUpPoints() 
    {
        return upPoints;
    }
    public void setUpScore(Long upScore) 
    {
        this.upScore = upScore;
    }

    public Long getUpScore() 
    {
        return upScore;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("semName", getSemName())
            .append("stuId", getStuId())
            .append("upPoints", getUpPoints())
            .append("upScore", getUpScore())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
