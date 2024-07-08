package cn.lanqiao.business.service.impl;

import java.util.List;
import cn.lanqiao.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.lanqiao.business.mapper.PointsMapper;
import cn.lanqiao.business.domain.Points;
import cn.lanqiao.business.service.IPointsService;

/**
 * 积分记录Service业务层处理
 * 
 * @author lmx
 * @date 2024-07-08
 */
@Service
public class PointsServiceImpl implements IPointsService 
{
    @Autowired
    private PointsMapper pointsMapper;

    /**
     * 查询积分记录
     * 
     * @param id 积分记录主键
     * @return 积分记录
     */
    @Override
    public Points selectPointsById(Long id)
    {
        return pointsMapper.selectPointsById(id);
    }

    /**
     * 查询积分记录列表
     * 
     * @param points 积分记录
     * @return 积分记录
     */
    @Override
    public List<Points> selectPointsList(Points points)
    {
        return pointsMapper.selectPointsList(points);
    }

    /**
     * 新增积分记录
     * 
     * @param points 积分记录
     * @return 结果
     */
    @Override
    public int insertPoints(Points points)
    {
        points.setCreateTime(DateUtils.getNowDate());
        return pointsMapper.insertPoints(points);
    }

    /**
     * 修改积分记录
     * 
     * @param points 积分记录
     * @return 结果
     */
    @Override
    public int updatePoints(Points points)
    {
        points.setUpdateTime(DateUtils.getNowDate());
        return pointsMapper.updatePoints(points);
    }

    /**
     * 批量删除积分记录
     * 
     * @param ids 需要删除的积分记录主键
     * @return 结果
     */
    @Override
    public int deletePointsByIds(Long[] ids)
    {
        return pointsMapper.deletePointsByIds(ids);
    }

    /**
     * 删除积分记录信息
     * 
     * @param id 积分记录主键
     * @return 结果
     */
    @Override
    public int deletePointsById(Long id)
    {
        return pointsMapper.deletePointsById(id);
    }
}
