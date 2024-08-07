package cn.lanqiao.business.service;

import java.util.List;
import cn.lanqiao.business.domain.Grades;

/**
 * 学生成绩信息Service接口
 * 
 * @author lmx
 * @date 2024-07-08
 */
public interface IGradesService 
{
    /**
     * 查询学生成绩信息
     * 
     * @param id 学生成绩信息主键
     * @return 学生成绩信息
     */
    public Grades selectGradesById(Long id);

    /**
     * 查询学生成绩信息列表
     * 
     * @param grades 学生成绩信息
     * @return 学生成绩信息集合
     */
    public List<Grades> selectGradesList(Grades grades);

    /**
     * 新增学生成绩信息
     * 
     * @param grades 学生成绩信息
     * @return 结果
     */
    public int insertGrades(Grades grades);

    /**
     * 修改学生成绩信息
     * 
     * @param grades 学生成绩信息
     * @return 结果
     */
    public int updateGrades(Grades grades);

    /**
     * 批量删除学生成绩信息
     * 
     * @param ids 需要删除的学生成绩信息主键集合
     * @return 结果
     */
    public int deleteGradesByIds(Long[] ids);

    /**
     * 删除学生成绩信息信息
     * 
     * @param id 学生成绩信息主键
     * @return 结果
     */
    public int deleteGradesById(Long id);
}
