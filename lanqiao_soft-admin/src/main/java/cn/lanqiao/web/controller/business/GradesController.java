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
import cn.lanqiao.business.domain.Grades;
import cn.lanqiao.business.service.IGradesService;
import cn.lanqiao.common.utils.poi.ExcelUtil;
import cn.lanqiao.common.core.page.TableDataInfo;

/**
 * 学生成绩信息Controller
 * 
 * @author lmx
 * @date 2024-07-08
 */
@RestController
@RequestMapping("/business/grades")
public class GradesController extends BaseController
{
    @Autowired
    private IGradesService gradesService;

    /**
     * 查询学生成绩信息列表
     */
    @PreAuthorize("@ss.hasPermi('business:grades:list')")
    @GetMapping("/list")
    public TableDataInfo list(Grades grades)
    {
        startPage();
        List<Grades> list = gradesService.selectGradesList(grades);
        return getDataTable(list);
    }

    /**
     * 导出学生成绩信息列表
     */
    @PreAuthorize("@ss.hasPermi('business:grades:export')")
    @Log(title = "学生成绩信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Grades grades)
    {
        List<Grades> list = gradesService.selectGradesList(grades);
        ExcelUtil<Grades> util = new ExcelUtil<Grades>(Grades.class);
        util.exportExcel(response, list, "学生成绩信息数据");
    }

    /**
     * 获取学生成绩信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:grades:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(gradesService.selectGradesById(id));
    }

    /**
     * 新增学生成绩信息
     */
    @PreAuthorize("@ss.hasPermi('business:grades:add')")
    @Log(title = "学生成绩信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Grades grades)
    {
        return toAjax(gradesService.insertGrades(grades));
    }

    /**
     * 修改学生成绩信息
     */
    @PreAuthorize("@ss.hasPermi('business:grades:edit')")
    @Log(title = "学生成绩信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Grades grades)
    {
        return toAjax(gradesService.updateGrades(grades));
    }

    /**
     * 删除学生成绩信息
     */
    @PreAuthorize("@ss.hasPermi('business:grades:remove')")
    @Log(title = "学生成绩信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(gradesService.deleteGradesByIds(ids));
    }
}
