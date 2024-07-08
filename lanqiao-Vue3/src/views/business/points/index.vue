<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="积分记录唯一标识" prop="id">
        <el-input
          v-model="queryParams.id"
          placeholder="请输入积分记录唯一标识"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学期名称" prop="semName">
        <el-input
          v-model="queryParams.semName"
          placeholder="请输入学期名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学生唯一标识" prop="stuId">
        <el-input
          v-model="queryParams.stuId"
          placeholder="请输入学生唯一标识"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="积分修改值" prop="upScore">
        <el-input
          v-model="queryParams.upScore"
          placeholder="请输入积分修改值"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="积分记录创建时间" prop="createTime">
        <el-date-picker clearable
          v-model="queryParams.createTime"
          type="date"
          value-format="YYYY-MM-DD"
          placeholder="请选择积分记录创建时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="积分记录最后更新时间" prop="updateTime">
        <el-date-picker clearable
          v-model="queryParams.updateTime"
          type="date"
          value-format="YYYY-MM-DD"
          placeholder="请选择积分记录最后更新时间">
        </el-date-picker>
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
          v-hasPermi="['business:points:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['business:points:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['business:points:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['business:points:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="pointsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="积分记录唯一标识" align="center" prop="id" />
      <el-table-column label="学期名称" align="center" prop="semName" />
      <el-table-column label="学生唯一标识" align="center" prop="stuId" />
      <el-table-column label="积分修改原因" align="center" prop="upPoints" />
      <el-table-column label="积分修改值" align="center" prop="upScore" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['business:points:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['business:points:remove']">删除</el-button>
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

    <!-- 添加或修改积分记录对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="pointsRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="学期名称" prop="semName">
          <el-input v-model="form.semName" placeholder="请输入学期名称" />
        </el-form-item>
        <el-form-item label="学生唯一标识" prop="stuId">
          <el-input v-model="form.stuId" placeholder="请输入学生唯一标识" />
        </el-form-item>
        <el-form-item label="积分修改原因" prop="upPoints">
          <el-input v-model="form.upPoints" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="积分修改值" prop="upScore">
          <el-input v-model="form.upScore" placeholder="请输入积分修改值" />
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

<script setup name="Points">
import { listPoints, getPoints, delPoints, addPoints, updatePoints } from "@/api/business/points";

const { proxy } = getCurrentInstance();

const pointsList = ref([]);
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
    semName: null,
    stuId: null,
    upPoints: null,
    upScore: null,
    createTime: null,
    updateTime: null
  },
  rules: {
    semName: [
      { required: true, message: "学期名称不能为空", trigger: "blur" }
    ],
    stuId: [
      { required: true, message: "学生唯一标识不能为空", trigger: "blur" }
    ],
    upPoints: [
      { required: true, message: "积分修改原因不能为空", trigger: "blur" }
    ],
    upScore: [
      { required: true, message: "积分修改值不能为空", trigger: "blur" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询积分记录列表 */
function getList() {
  loading.value = true;
  listPoints(queryParams.value).then(response => {
    pointsList.value = response.rows;
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
    semName: null,
    stuId: null,
    upPoints: null,
    upScore: null,
    createTime: null,
    updateTime: null
  };
  proxy.resetForm("pointsRef");
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
  title.value = "添加积分记录";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getPoints(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改积分记录";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["pointsRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updatePoints(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addPoints(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除积分记录编号为"' + _ids + '"的数据项？').then(function() {
    return delPoints(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('business/points/export', {
    ...queryParams.value
  }, `points_${new Date().getTime()}.xlsx`)
}

getList();
</script>
