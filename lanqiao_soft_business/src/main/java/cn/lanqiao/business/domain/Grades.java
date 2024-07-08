package cn.lanqiao.business.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import cn.lanqiao.common.annotation.Excel;
import cn.lanqiao.common.core.domain.BaseEntity;

/**
 * 学生成绩信息对象 grades
 * 
 * @author lmx
 * @date 2024-07-08
 */
public class Grades extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 成绩唯一标识 */
    private Long id;

    /** 学生唯一标识 */
    @Excel(name = "学生唯一标识")
    private Long stuId;

    /** 课程唯一标识 */
    @Excel(name = "课程唯一标识")
    private Long courseId;

    /** 学期名称 */
    @Excel(name = "学期名称")
    private String semName;

    /** 项目成绩 */
    @Excel(name = "项目成绩")
    private Long projectGrades;

    /** 课程成绩 */
    @Excel(name = "课程成绩")
    private Long courseGrades;

    /** 考试成绩 */
    @Excel(name = "考试成绩")
    private Long examScores;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setStuId(Long stuId) 
    {
        this.stuId = stuId;
    }

    public Long getStuId() 
    {
        return stuId;
    }
    public void setCourseId(Long courseId) 
    {
        this.courseId = courseId;
    }

    public Long getCourseId() 
    {
        return courseId;
    }
    public void setSemName(String semName) 
    {
        this.semName = semName;
    }

    public String getSemName() 
    {
        return semName;
    }
    public void setProjectGrades(Long projectGrades) 
    {
        this.projectGrades = projectGrades;
    }

    public Long getProjectGrades() 
    {
        return projectGrades;
    }
    public void setCourseGrades(Long courseGrades) 
    {
        this.courseGrades = courseGrades;
    }

    public Long getCourseGrades() 
    {
        return courseGrades;
    }
    public void setExamScores(Long examScores) 
    {
        this.examScores = examScores;
    }

    public Long getExamScores() 
    {
        return examScores;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("stuId", getStuId())
            .append("courseId", getCourseId())
            .append("semName", getSemName())
            .append("projectGrades", getProjectGrades())
            .append("courseGrades", getCourseGrades())
            .append("examScores", getExamScores())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
