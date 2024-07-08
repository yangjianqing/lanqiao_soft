package cn.lanqiao.business.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import cn.lanqiao.common.annotation.Excel;
import cn.lanqiao.common.core.domain.BaseEntity;

/**
 * 学生信息对象 student
 * 
 * @author yangjianqing
 * @date 2024-07-08
 */
public class Student extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 学生唯一标识 */
    private Long id;

    /** 学生姓名 */
    @Excel(name = "学生姓名")
    private String stuName;

    /** 学生学号 */
    @Excel(name = "学生学号")
    private Long stuId;

    /** 学生性别 */
    @Excel(name = "学生性别")
    private String stuGender;

    /** 学生学院 */
    @Excel(name = "学生学院")
    private String stuCollege;

    /** 学生专业 */
    @Excel(name = "学生专业")
    private String stuSpecialities;

    /** 班级唯一标识 */
    @Excel(name = "班级唯一标识")
    private Long stuClassId;

    /** 学生职务 */
    @Excel(name = "学生职务")
    private Long stuDuties;

    /** 学生小组唯一标识 */
    @Excel(name = "学生小组唯一标识")
    private Long stuGroupId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setStuName(String stuName) 
    {
        this.stuName = stuName;
    }

    public String getStuName() 
    {
        return stuName;
    }
    public void setStuId(Long stuId) 
    {
        this.stuId = stuId;
    }

    public Long getStuId() 
    {
        return stuId;
    }
    public void setStuGender(String stuGender) 
    {
        this.stuGender = stuGender;
    }

    public String getStuGender() 
    {
        return stuGender;
    }
    public void setStuCollege(String stuCollege) 
    {
        this.stuCollege = stuCollege;
    }

    public String getStuCollege() 
    {
        return stuCollege;
    }
    public void setStuSpecialities(String stuSpecialities) 
    {
        this.stuSpecialities = stuSpecialities;
    }

    public String getStuSpecialities() 
    {
        return stuSpecialities;
    }
    public void setStuClassId(Long stuClassId) 
    {
        this.stuClassId = stuClassId;
    }

    public Long getStuClassId() 
    {
        return stuClassId;
    }
    public void setStuDuties(Long stuDuties) 
    {
        this.stuDuties = stuDuties;
    }

    public Long getStuDuties() 
    {
        return stuDuties;
    }
    public void setStuGroupId(Long stuGroupId) 
    {
        this.stuGroupId = stuGroupId;
    }

    public Long getStuGroupId() 
    {
        return stuGroupId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("stuName", getStuName())
            .append("stuId", getStuId())
            .append("stuGender", getStuGender())
            .append("stuCollege", getStuCollege())
            .append("stuSpecialities", getStuSpecialities())
            .append("stuClassId", getStuClassId())
            .append("stuDuties", getStuDuties())
            .append("stuGroupId", getStuGroupId())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
