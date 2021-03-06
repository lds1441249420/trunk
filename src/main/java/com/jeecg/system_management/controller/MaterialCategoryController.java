package com.jeecg.system_management.controller;

import com.jeecg.system_management.common.MaterialCategoryVo;
import com.jeecg.system_management.pojo.RepSubstanceCategory;
import com.jeecg.system_management.service.MaterialCategoryService;
import lombok.extern.slf4j.Slf4j;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.web.system.service.TypeServiceI;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 物资类别管理Controller
 *
 * @author 苑希阳
 */
@Slf4j
@Controller
@RequestMapping("/materialCategory")
public class MaterialCategoryController extends BaseController {

    @Resource
    private MaterialCategoryService materialCategoryServiceImpl;

    /**
     * 显示新增页面
     *
     * @return
     */
    @RequestMapping(params = "showAddMaterialCategoryPage")
    public String showAddMaterialCategoryPage() {
        return "/jzwz/MaterialManagement/MaterialCategoryManagement/MaterialCategoryAdd";
    }

    /**
     * 物资类别查看
     *
     * @return
     */
    @RequestMapping(params = "materialCategoryLook")
    public String seeMaterialCategory(String uuid, Model model) {
        //uuid非空验证
        if (StringUtil.isEmpty(uuid.trim())) {
            return "jzwz/MaterialManagement/MaterialCategoryManagement/MaterialCategoryLook";
        }
        //查询uuid对应的物资类别
        RepSubstanceCategory category = materialCategoryServiceImpl.materialCategorySee(uuid);
        //放入域中
        model.addAttribute("category", category);
        return "jzwz/MaterialManagement/MaterialCategoryManagement/MaterialCategoryLook";
    }

    /**
     * 显示物资类别列表页
     *
     * @param model
     * @return
     */
    @RequestMapping(params = "list")
    public String materialCategoryList(Model model) {
        //查询物资类别列表
        List<RepSubstanceCategory> list = materialCategoryServiceImpl.materialCategoryList();
        //放入域中
        model.addAttribute("list", list);
        return "/jzwz/MaterialManagement/MaterialCategoryManagement/MaterialCategoryList";
    }

    /**
     * 物资类别修改页显示
     *
     * @param uuid
     * @param model
     * @return
     */
    @RequestMapping(params = "materialCategoryModify")
    public String showMaterialCategoryModify(String uuid, Model model) {
        //uuid非空验证
        if (StringUtil.isEmpty(uuid)) {
            return "jzwz/MaterialManagement/MaterialCategoryManagement/MaterialCategoryUpdate";
        }
        //查找uuid对应的物资类别，用作回显数据
        RepSubstanceCategory category = materialCategoryServiceImpl.materialCategorySee(uuid);
        //放入域中
        model.addAttribute("category", category);
        return "jzwz/MaterialManagement/MaterialCategoryManagement/MaterialCategoryUpdate";
    }

    /**
     * 新增物资类别
     *
     * @param category
     * @return
     */
    @ResponseBody
    @RequestMapping(params = "save")
    public AjaxJson materialCategorySave(RepSubstanceCategory category) {
        AjaxJson ajaxJson = new AjaxJson();
        //物资类别非空验证
        if (null == category) {
            ajaxJson.setSuccess(false);
            return ajaxJson;
        }
        //物资类别编号非空验证
        if (StringUtil.isEmpty(category.getCategoryNumber())) {
            ajaxJson.setSuccess(false);
            return ajaxJson;
        }
        //物资类别名称非空验证
        if (StringUtil.isEmpty(category.getCategoryName())) {
            ajaxJson.setSuccess(false);
            return ajaxJson;
        }
        try {
            //新增物资类别
            ajaxJson = materialCategoryServiceImpl.materialCategorySave(category);
            return ajaxJson;
        } catch (Exception e) {
            log.error(e.getMessage());
            ajaxJson.setSuccess(false);
            return ajaxJson;
        }
    }

    /**
     * 物资类别修改
     *
     * @param category
     * @return
     */
    @ResponseBody
    @RequestMapping(params = "modify")
    public AjaxJson materialCategoryModify(RepSubstanceCategory category) {
        AjaxJson ajaxJson = new AjaxJson();
        //category非空验证
        if (null == category) {
            ajaxJson.setSuccess(false);
            return ajaxJson;
        }
        //物资类别编号非空验证
        if (StringUtil.isEmpty(category.getCategoryNumber())) {
            ajaxJson.setSuccess(false);
            return ajaxJson;
        }
        //物资类别名称非空验证
        if (StringUtil.isEmpty(category.getCategoryName())) {
            ajaxJson.setSuccess(false);
            return ajaxJson;
        }
        try {
            //执行修改
            ajaxJson = materialCategoryServiceImpl.materialCategoryModify(category);
            return ajaxJson;
        } catch (Exception e) {
            log.error(e.getMessage());
            ajaxJson.setSuccess(false);
            return ajaxJson;
        }
    }

    /**
     * 物资类别删除
     *
     * @param ids
     * @param model
     * @return
     */
    @ResponseBody
    @RequestMapping(params = "delete")
    public AjaxJson materialCategoryDelete(String ids, Model model) {
        AjaxJson ajaxJson = new AjaxJson();
        //ids非空判断
        if (StringUtil.isEmpty(ids.trim())) {
            ajaxJson.setSuccess(false);
            return ajaxJson;
        }
        try {
            //执行删除
            ajaxJson = materialCategoryServiceImpl.materialCategoryDelete(ids);
            //返回结果
            return ajaxJson;
        } catch (Exception e) {
            log.error(e.getMessage());
            ajaxJson.setSuccess(false);
            return ajaxJson;
        }
    }

    /**
     * 物资类别条件查询
     *
     * @param vo    查询条件
     * @param model
     * @return
     */
    @RequestMapping(params = "listQuery")
    public String materialCategoryListByQuery(MaterialCategoryVo vo, Model model) {
        //查询条件vo非空判断
        if (null == vo) {
            return "/jzwz/MaterialManagement/MaterialCategoryManagement/MaterialCategoryList";
        }
        //执行条件查询
        List<RepSubstanceCategory> list = materialCategoryServiceImpl.materialCategoryByQuery(vo);
        //放入域中
        model.addAttribute("list", list);
        model.addAttribute("vo", vo);
        return "/jzwz/MaterialManagement/MaterialCategoryManagement/MaterialCategoryList";
    }

    /**
     * 校验物资类别名称唯一性
     *
     * @param categoryName
     * @return
     */
    @ResponseBody
    @RequestMapping(params = "checkName")
    public AjaxJson checkCategoryName(String categoryName) {
        AjaxJson ajaxJson = materialCategoryServiceImpl.checkCategoryName(categoryName);
        return ajaxJson;
    }
}
