package cn.lanqiao.business.mapper;

import java.util.List;
import cn.lanqiao.business.domain.ClassManagement;

/**
 * 班级信息Mapper接口
 * 
 * @author lmx
 * @date 2024-07-08
 */
public interface ClassManagementMapper 
{
    /**
     * 查询班级信息
     * 
     * @param id 班级信息主键
     * @return 班级信息
     */
    public ClassManagement selectClassManagementById(Long id);

    /**
     * 查询班级信息列表
     * 
     * @param classManagement 班级信息
     * @return 班级信息集合
     */
    public List<ClassManagement> selectClassManagementList(ClassManagement classManagement);

    /**
     * 新增班级信息
     * 
     * @param classManagement 班级信息
     * @return 结果
     */
    public int insertClassManagement(ClassManagement classManagement);

    /**
     * 修改班级信息
     * 
     * @param classManagement 班级信息
     * @return 结果
     */
    public int updateClassManagement(ClassManagement classManagement);

    /**
     * 删除班级信息
     * 
     * @param id 班级信息主键
     * @return 结果
     */
    public int deleteClassManagementById(Long id);

    /**
     * 批量删除班级信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteClassManagementByIds(Long[] ids);
}
