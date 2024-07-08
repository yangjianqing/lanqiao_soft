package cn.lanqiao.business.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import cn.lanqiao.common.annotation.Excel;
import cn.lanqiao.common.core.domain.BaseEntity;

/**
 * 课程信息对象 course
 * 
 * @author lmx
 * @date 2024-07-08
 */
public class Course extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 课程唯一标识 */
    private Long id;

    /** 课程名称 */
    @Excel(name = "课程名称")
    private String courseName;

    /** 所属学期唯一标识 */
    @Excel(name = "所属学期唯一标识")
    private Long semId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setCourseName(String courseName) 
    {
        this.courseName = courseName;
    }

    public String getCourseName() 
    {
        return courseName;
    }
    public void setSemId(Long semId) 
    {
        this.semId = semId;
    }

    public Long getSemId() 
    {
        return semId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("courseName", getCourseName())
            .append("semId", getSemId())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
