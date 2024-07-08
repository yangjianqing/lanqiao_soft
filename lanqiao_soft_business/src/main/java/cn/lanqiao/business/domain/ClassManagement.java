package cn.lanqiao.business.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import cn.lanqiao.common.annotation.Excel;
import cn.lanqiao.common.core.domain.BaseEntity;

/**
 * 班级信息对象 class_management
 * 
 * @author lmx
 * @date 2024-07-08
 */
public class ClassManagement extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 班级唯一标识 */
    private Long id;

    /** 班级名称 */
    @Excel(name = "班级名称")
    private String claName;

    /** 校区唯一标识 */
    @Excel(name = "校区唯一标识")
    private Long schoolId;

    /** 年级信息 */
    @Excel(name = "年级信息")
    private String grade;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setClaName(String claName) 
    {
        this.claName = claName;
    }

    public String getClaName() 
    {
        return claName;
    }
    public void setSchoolId(Long schoolId) 
    {
        this.schoolId = schoolId;
    }

    public Long getSchoolId() 
    {
        return schoolId;
    }
    public void setGrade(String grade) 
    {
        this.grade = grade;
    }

    public String getGrade() 
    {
        return grade;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("claName", getClaName())
            .append("schoolId", getSchoolId())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("grade", getGrade())
            .toString();
    }
}
