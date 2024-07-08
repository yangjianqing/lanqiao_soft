package cn.lanqiao.web.controller.business;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import cn.lanqiao.common.annotation.Log;
import cn.lanqiao.common.core.controller.BaseController;
import cn.lanqiao.common.core.domain.AjaxResult;
import cn.lanqiao.common.enums.BusinessType;
import cn.lanqiao.business.domain.Points;
import cn.lanqiao.business.service.IPointsService;
import cn.lanqiao.common.utils.poi.ExcelUtil;
import cn.lanqiao.common.core.page.TableDataInfo;

/**
 * 积分记录Controller
 * 
 * @author lmx
 * @date 2024-07-08
 */
@RestController
@RequestMapping("/business/points")
public class PointsController extends BaseController
{
    @Autowired
    private IPointsService pointsService;

    /**
     * 查询积分记录列表
     */
    @PreAuthorize("@ss.hasPermi('business:points:list')")
    @GetMapping("/list")
    public TableDataInfo list(Points points)
    {
        startPage();
        List<Points> list = pointsService.selectPointsList(points);
        return getDataTable(list);
    }

    /**
     * 导出积分记录列表
     */
    @PreAuthorize("@ss.hasPermi('business:points:export')")
    @Log(title = "积分记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Points points)
    {
        List<Points> list = pointsService.selectPointsList(points);
        ExcelUtil<Points> util = new ExcelUtil<Points>(Points.class);
        util.exportExcel(response, list, "积分记录数据");
    }

    /**
     * 获取积分记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:points:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(pointsService.selectPointsById(id));
    }

    /**
     * 新增积分记录
     */
    @PreAuthorize("@ss.hasPermi('business:points:add')")
    @Log(title = "积分记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Points points)
    {
        return toAjax(pointsService.insertPoints(points));
    }

    /**
     * 修改积分记录
     */
    @PreAuthorize("@ss.hasPermi('business:points:edit')")
    @Log(title = "积分记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Points points)
    {
        return toAjax(pointsService.updatePoints(points));
    }

    /**
     * 删除积分记录
     */
    @PreAuthorize("@ss.hasPermi('business:points:remove')")
    @Log(title = "积分记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(pointsService.deletePointsByIds(ids));
    }
}
