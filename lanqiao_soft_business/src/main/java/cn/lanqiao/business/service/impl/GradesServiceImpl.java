package cn.lanqiao.business.service.impl;

import java.util.List;
import cn.lanqiao.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.lanqiao.business.mapper.GradesMapper;
import cn.lanqiao.business.domain.Grades;
import cn.lanqiao.business.service.IGradesService;

/**
 * 学生成绩信息Service业务层处理
 * 
 * @author lmx
 * @date 2024-07-08
 */
@Service
public class GradesServiceImpl implements IGradesService 
{
    @Autowired
    private GradesMapper gradesMapper;

    /**
     * 查询学生成绩信息
     * 
     * @param id 学生成绩信息主键
     * @return 学生成绩信息
     */
    @Override
    public Grades selectGradesById(Long id)
    {
        return gradesMapper.selectGradesById(id);
    }

    /**
     * 查询学生成绩信息列表
     * 
     * @param grades 学生成绩信息
     * @return 学生成绩信息
     */
    @Override
    public List<Grades> selectGradesList(Grades grades)
    {
        return gradesMapper.selectGradesList(grades);
    }

    /**
     * 新增学生成绩信息
     * 
     * @param grades 学生成绩信息
     * @return 结果
     */
    @Override
    public int insertGrades(Grades grades)
    {
        grades.setCreateTime(DateUtils.getNowDate());
        return gradesMapper.insertGrades(grades);
    }

    /**
     * 修改学生成绩信息
     * 
     * @param grades 学生成绩信息
     * @return 结果
     */
    @Override
    public int updateGrades(Grades grades)
    {
        grades.setUpdateTime(DateUtils.getNowDate());
        return gradesMapper.updateGrades(grades);
    }

    /**
     * 批量删除学生成绩信息
     * 
     * @param ids 需要删除的学生成绩信息主键
     * @return 结果
     */
    @Override
    public int deleteGradesByIds(Long[] ids)
    {
        return gradesMapper.deleteGradesByIds(ids);
    }

    /**
     * 删除学生成绩信息信息
     * 
     * @param id 学生成绩信息主键
     * @return 结果
     */
    @Override
    public int deleteGradesById(Long id)
    {
        return gradesMapper.deleteGradesById(id);
    }
}
