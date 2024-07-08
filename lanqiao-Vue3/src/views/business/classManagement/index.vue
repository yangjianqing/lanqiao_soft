<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="班级唯一标识" prop="id">
        <el-input
          v-model="queryParams.id"
          placeholder="请输入班级唯一标识"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="班级名称" prop="claName">
        <el-input
          v-model="queryParams.claName"
          placeholder="请输入班级名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="校区唯一标识" prop="schoolId">
        <el-select v-model="queryParams.schoolId" placeholder="请选择校区唯一标识" clearable>
          <el-option
            v-for="dict in sys_dept_id"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="班级创建时间" prop="createTime">
        <el-date-picker clearable
          v-model="queryParams.createTime"
          type="date"
          value-format="YYYY-MM-DD"
          placeholder="请选择班级创建时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="班级最后更新时间" prop="updateTime">
        <el-date-picker clearable
          v-model="queryParams.updateTime"
          type="date"
          value-format="YYYY-MM-DD"
          placeholder="请选择班级最后更新时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="年级信息" prop="grade">
        <el-input
          v-model="queryParams.grade"
          placeholder="请输入年级信息"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['business:classManagement:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['business:classManagement:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['business:classManagement:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['business:classManagement:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="classManagementList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="班级唯一标识" align="center" prop="id" />
      <el-table-column label="班级名称" align="center" prop="claName" />
      <el-table-column label="校区唯一标识" align="center" prop="schoolId">
        <template #default="scope">
          <dict-tag :options="sys_dept_id" :value="scope.row.schoolId"/>
        </template>
      </el-table-column>
      <el-table-column label="年级信息" align="center" prop="grade" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['business:classManagement:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['business:classManagement:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改班级信息对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="classManagementRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="班级名称" prop="claName">
          <el-input v-model="form.claName" placeholder="请输入班级名称" />
        </el-form-item>
        <el-form-item label="校区唯一标识" prop="schoolId">
          <el-select v-model="form.schoolId" placeholder="请选择校区唯一标识">
            <el-option
              v-for="dict in sys_dept_id"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="年级信息" prop="grade">
          <el-input v-model="form.grade" placeholder="请输入年级信息" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="ClassManagement">
import { listClassManagement, getClassManagement, delClassManagement, addClassManagement, updateClassManagement } from "@/api/business/classManagement";

const { proxy } = getCurrentInstance();
const { sys_dept_id } = proxy.useDict('sys_dept_id');

const classManagementList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    id: null,
    claName: null,
    schoolId: null,
    createTime: null,
    updateTime: null,
    grade: null
  },
  rules: {
    claName: [
      { required: true, message: "班级名称不能为空", trigger: "blur" }
    ],
    schoolId: [
      { required: true, message: "校区唯一标识不能为空", trigger: "change" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询班级信息列表 */
function getList() {
  loading.value = true;
  listClassManagement(queryParams.value).then(response => {
    classManagementList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    id: null,
    claName: null,
    schoolId: null,
    createTime: null,
    updateTime: null,
    grade: null
  };
  proxy.resetForm("classManagementRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.id);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加班级信息";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getClassManagement(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改班级信息";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["classManagementRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateClassManagement(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addClassManagement(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _ids = row.id || ids.value;
  proxy.$modal.confirm('是否确认删除班级信息编号为"' + _ids + '"的数据项？').then(function() {
    return delClassManagement(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('business/classManagement/export', {
    ...queryParams.value
  }, `classManagement_${new Date().getTime()}.xlsx`)
}

getList();
</script>
