<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="菜名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入菜名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="主料" prop="main">
        <el-select v-model="queryParams.main" placeholder="请选择主料" clearable>
          <el-option
            v-for="dict in dict.type.merchart_main"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="口味" prop="taste">
        <el-select v-model="queryParams.taste" placeholder="请选择口味" clearable>
          <el-option
            v-for="dict in dict.type.merchart_test"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="制作方法" prop="make">
        <el-select v-model="queryParams.make" placeholder="请选择制作方法" clearable>
          <el-option
            v-for="dict in dict.type.merchart_make"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="菜品类型" prop="menuTypeId">
        <el-input
          v-model="queryParams.menuTypeId"
          placeholder="请输入菜品类型"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['merchant:menu:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['merchant:menu:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['merchant:menu:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['merchant:menu:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="menuList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" />
      <el-table-column label="菜名" align="center" prop="name" />
      <el-table-column label="图片" align="center" prop="imgUrl" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.imgUrl" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="原价" align="center" prop="price" />
      <el-table-column label="折后价" align="center" prop="discountPrice" />
      <el-table-column label="分量" align="center" prop="weight" />
      <el-table-column label="描述" align="center" prop="disc" />
      <el-table-column label="主料" align="center" prop="main">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.merchart_main" :value="scope.row.main"/>
        </template>
      </el-table-column>
      <el-table-column label="口味" align="center" prop="taste">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.merchart_test" :value="scope.row.taste"/>
        </template>
      </el-table-column>
      <el-table-column label="制作方法" align="center" prop="make">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.merchart_make" :value="scope.row.make"/>
        </template>
      </el-table-column>
      <el-table-column label="菜品类型" align="center" prop="menuTypeId" />
      <el-table-column label="打包费" align="center" prop="balingCharges" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['merchant:menu:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['merchant:menu:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改菜单管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="菜名" prop="name">
          <el-input v-model="form.name" placeholder="请输入菜名" />
        </el-form-item>
        <el-form-item label="图片">
          <image-upload v-model="form.imgUrl"/>
        </el-form-item>
        <el-form-item label="原价" prop="price">
          <el-input v-model="form.price" placeholder="请输入原价" />
        </el-form-item>
        <el-form-item label="折后价" prop="discountPrice">
          <el-input v-model="form.discountPrice" placeholder="请输入折后价" />
        </el-form-item>
        <el-form-item label="分量" prop="weight">
          <el-input v-model="form.weight" placeholder="请输入分量" />
        </el-form-item>
        <el-form-item label="描述" prop="disc">
          <el-input v-model="form.disc" placeholder="请输入描述" />
        </el-form-item>
        <el-form-item label="主料" prop="main">
          <el-select v-model="form.main" placeholder="请选择主料">
            <el-option
              v-for="dict in dict.type.merchart_main"
              :key="dict.value"
              :label="dict.label"
:value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="口味" prop="taste">
          <el-select v-model="form.taste" placeholder="请选择口味">
            <el-option
              v-for="dict in dict.type.merchart_test"
              :key="dict.value"
              :label="dict.label"
:value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="制作方法" prop="make">
          <el-select v-model="form.make" placeholder="请选择制作方法">
            <el-option
              v-for="dict in dict.type.merchart_make"
              :key="dict.value"
              :label="dict.label"
:value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="菜品类型" prop="menuTypeId">
          <el-input v-model="form.menuTypeId" placeholder="请输入菜品类型" />
        </el-form-item>
        <el-form-item label="打包费" prop="balingCharges">
          <el-input v-model="form.balingCharges" placeholder="请输入打包费" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listMenu, getMenu, delMenu, addMenu, updateMenu } from "@/api/merchant/menu";

export default {
  name: "Menu",
  dicts: ['merchart_test', 'merchart_make', 'merchart_main'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 菜单管理表格数据
      menuList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        main: null,
        taste: null,
        make: null,
        menuTypeId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询菜单管理列表 */
    getList() {
      this.loading = true;
      listMenu(this.queryParams).then(response => {
        this.menuList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        name: null,
        imgUrl: null,
        price: null,
        discountPrice: null,
        weight: null,
        disc: null,
        main: null,
        taste: null,
        make: null,
        menuTypeId: null,
        balingCharges: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加菜单管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getMenu(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改菜单管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateMenu(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addMenu(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除菜单管理编号为"' + ids + '"的数据项？').then(function() {
        return delMenu(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('merchant/menu/export', {
        ...this.queryParams
      }, `menu_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
