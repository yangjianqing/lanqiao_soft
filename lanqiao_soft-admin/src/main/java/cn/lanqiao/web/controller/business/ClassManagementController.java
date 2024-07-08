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
import cn.lanqiao.business.domain.ClassManagement;
import cn.lanqiao.business.service.IClassManagementService;
import cn.lanqiao.common.utils.poi.ExcelUtil;
import cn.lanqiao.common.core.page.TableDataInfo;

/**
 * 班级信息Controller
 * 
 * @author lmx
 * @date 2024-07-08
 */
@RestController
@RequestMapping("/business/classManagement")
public class ClassManagementController extends BaseController
{
    @Autowired
    private IClassManagementService classManagementService;

    /**
     * 查询班级信息列表
     */
    @PreAuthorize("@ss.hasPermi('business:classManagement:list')")
    @GetMapping("/list")
    public TableDataInfo list(ClassManagement classManagement)
    {
        startPage();
        List<ClassManagement> list = classManagementService.selectClassManagementList(classManagement);
        return getDataTable(list);
    }

    /**
     * 导出班级信息列表
     */
    @PreAuthorize("@ss.hasPermi('business:classManagement:export')")
    @Log(title = "班级信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ClassManagement classManagement)
    {
        List<ClassManagement> list = classManagementService.selectClassManagementList(classManagement);
        ExcelUtil<ClassManagement> util = new ExcelUtil<ClassManagement>(ClassManagement.class);
        util.exportExcel(response, list, "班级信息数据");
    }

    /**
     * 获取班级信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:classManagement:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(classManagementService.selectClassManagementById(id));
    }

    /**
     * 新增班级信息
     */
    @PreAuthorize("@ss.hasPermi('business:classManagement:add')")
    @Log(title = "班级信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ClassManagement classManagement)
    {
        return toAjax(classManagementService.insertClassManagement(classManagement));
    }

    /**
     * 修改班级信息
     */
    @PreAuthorize("@ss.hasPermi('business:classManagement:edit')")
    @Log(title = "班级信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ClassManagement classManagement)
    {
        return toAjax(classManagementService.updateClassManagement(classManagement));
    }

    /**
     * 删除班级信息
     */
    @PreAuthorize("@ss.hasPermi('business:classManagement:remove')")
    @Log(title = "班级信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(classManagementService.deleteClassManagementByIds(ids));
    }
}
