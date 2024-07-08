package cn.lanqiao.business.service.impl;

import java.util.List;
import cn.lanqiao.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.lanqiao.business.mapper.ClassManagementMapper;
import cn.lanqiao.business.domain.ClassManagement;
import cn.lanqiao.business.service.IClassManagementService;

/**
 * 班级信息Service业务层处理
 * 
 * @author lmx
 * @date 2024-07-08
 */
@Service
public class ClassManagementServiceImpl implements IClassManagementService 
{
    @Autowired
    private ClassManagementMapper classManagementMapper;

    /**
     * 查询班级信息
     * 
     * @param id 班级信息主键
     * @return 班级信息
     */
    @Override
    public ClassManagement selectClassManagementById(Long id)
    {
        return classManagementMapper.selectClassManagementById(id);
    }

    /**
     * 查询班级信息列表
     * 
     * @param classManagement 班级信息
     * @return 班级信息
     */
    @Override
    public List<ClassManagement> selectClassManagementList(ClassManagement classManagement)
    {
        return classManagementMapper.selectClassManagementList(classManagement);
    }

    /**
     * 新增班级信息
     * 
     * @param classManagement 班级信息
     * @return 结果
     */
    @Override
    public int insertClassManagement(ClassManagement classManagement)
    {
        classManagement.setCreateTime(DateUtils.getNowDate());
        return classManagementMapper.insertClassManagement(classManagement);
    }

    /**
     * 修改班级信息
     * 
     * @param classManagement 班级信息
     * @return 结果
     */
    @Override
    public int updateClassManagement(ClassManagement classManagement)
    {
        classManagement.setUpdateTime(DateUtils.getNowDate());
        return classManagementMapper.updateClassManagement(classManagement);
    }

    /**
     * 批量删除班级信息
     * 
     * @param ids 需要删除的班级信息主键
     * @return 结果
     */
    @Override
    public int deleteClassManagementByIds(Long[] ids)
    {
        return classManagementMapper.deleteClassManagementByIds(ids);
    }

    /**
     * 删除班级信息信息
     * 
     * @param id 班级信息主键
     * @return 结果
     */
    @Override
    public int deleteClassManagementById(Long id)
    {
        return classManagementMapper.deleteClassManagementById(id);
    }
}
