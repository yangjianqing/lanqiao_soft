package cn.lanqiao.business.service;

import java.util.List;
import cn.lanqiao.business.domain.Points;

/**
 * 积分记录Service接口
 * 
 * @author lmx
 * @date 2024-07-08
 */
public interface IPointsService 
{
    /**
     * 查询积分记录
     * 
     * @param id 积分记录主键
     * @return 积分记录
     */
    public Points selectPointsById(Long id);

    /**
     * 查询积分记录列表
     * 
     * @param points 积分记录
     * @return 积分记录集合
     */
    public List<Points> selectPointsList(Points points);

    /**
     * 新增积分记录
     * 
     * @param points 积分记录
     * @return 结果
     */
    public int insertPoints(Points points);

    /**
     * 修改积分记录
     * 
     * @param points 积分记录
     * @return 结果
     */
    public int updatePoints(Points points);

    /**
     * 批量删除积分记录
     * 
     * @param ids 需要删除的积分记录主键集合
     * @return 结果
     */
    public int deletePointsByIds(Long[] ids);

    /**
     * 删除积分记录信息
     * 
     * @param id 积分记录主键
     * @return 结果
     */
    public int deletePointsById(Long id);
}
