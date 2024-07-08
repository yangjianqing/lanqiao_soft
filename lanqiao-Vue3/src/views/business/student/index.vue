<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="学生姓名" prop="stuName">
        <el-input
          v-model="queryParams.stuName"
          placeholder="请输入学生姓名"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学生学号" prop="stuId">
        <el-input
          v-model="queryParams.stuId"
          placeholder="请输入学生学号"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学生性别" prop="stuGender">
        <el-input
          v-model="queryParams.stuGender"
          placeholder="请输入学生性别"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学生学院" prop="stuCollege">
        <el-input
          v-model="queryParams.stuCollege"
          placeholder="请输入学生学院"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学生专业" prop="stuSpecialities">
        <el-input
          v-model="queryParams.stuSpecialities"
          placeholder="请输入学生专业"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="班级唯一标识" prop="stuClassId">
        <el-input
          v-model="queryParams.stuClassId"
          placeholder="请输入班级唯一标识"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学生职务" prop="stuDuties">
        <el-input
          v-model="queryParams.stuDuties"
          placeholder="请输入学生职务"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学生小组唯一标识" prop="stuGroupId">
        <el-input
          v-model="queryParams.stuGroupId"
          placeholder="请输入学生小组唯一标识"
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
          v-hasPermi="['business:student:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['business:student:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['business:student:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['business:student:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="studentList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="学生唯一标识" align="center" prop="id" />
      <el-table-column label="学生姓名" align="center" prop="stuName" />
      <el-table-column label="学生学号" align="center" prop="stuId" />
      <el-table-column label="学生性别" align="center" prop="stuGender" />
      <el-table-column label="学生学院" align="center" prop="stuCollege" />
      <el-table-column label="学生专业" align="center" prop="stuSpecialities" />
      <el-table-column label="班级唯一标识" align="center" prop="stuClassId" />
      <el-table-column label="学生职务" align="center" prop="stuDuties" />
      <el-table-column label="学生小组唯一标识" align="center" prop="stuGroupId" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['business:student:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['business:student:remove']">删除</el-button>
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

    <!-- 添加或修改学生信息对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="studentRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="学生姓名" prop="stuName">
          <el-input v-model="form.stuName" placeholder="请输入学生姓名" />
        </el-form-item>
        <el-form-item label="学生学号" prop="stuId">
          <el-input v-model="form.stuId" placeholder="请输入学生学号" />
        </el-form-item>
        <el-form-item label="学生性别" prop="stuGender">
          <el-input v-model="form.stuGender" placeholder="请输入学生性别" />
        </el-form-item>
        <el-form-item label="学生学院" prop="stuCollege">
          <el-input v-model="form.stuCollege" placeholder="请输入学生学院" />
        </el-form-item>
        <el-form-item label="学生专业" prop="stuSpecialities">
          <el-input v-model="form.stuSpecialities" placeholder="请输入学生专业" />
        </el-form-item>
        <el-form-item label="班级唯一标识" prop="stuClassId">
          <el-input v-model="form.stuClassId" placeholder="请输入班级唯一标识" />
        </el-form-item>
        <el-form-item label="学生职务" prop="stuDuties">
          <el-input v-model="form.stuDuties" placeholder="请输入学生职务" />
        </el-form-item>
        <el-form-item label="学生小组唯一标识" prop="stuGroupId">
          <el-input v-model="form.stuGroupId" placeholder="请输入学生小组唯一标识" />
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

<script setup name="Student">
import { listStudent, getStudent, delStudent, addStudent, updateStudent } from "@/api/business/student";

const { proxy } = getCurrentInstance();

const studentList = ref([]);
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
    stuName: null,
    stuId: null,
    stuGender: null,
    stuCollege: null,
    stuSpecialities: null,
    stuClassId: null,
    stuDuties: null,
    stuGroupId: null,
  },
  rules: {
    stuName: [
      { required: true, message: "学生姓名不能为空", trigger: "blur" }
    ],
    stuId: [
      { required: true, message: "学生学号不能为空", trigger: "blur" }
    ],
    stuGender: [
      { required: true, message: "学生性别不能为空", trigger: "blur" }
    ],
    stuCollege: [
      { required: true, message: "学生学院不能为空", trigger: "blur" }
    ],
    stuSpecialities: [
      { required: true, message: "学生专业不能为空", trigger: "blur" }
    ],
    stuClassId: [
      { required: true, message: "班级唯一标识不能为空", trigger: "blur" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询学生信息列表 */
function getList() {
  loading.value = true;
  listStudent(queryParams.value).then(response => {
    studentList.value = response.rows;
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
    stuName: null,
    stuId: null,
    stuGender: null,
    stuCollege: null,
    stuSpecialities: null,
    stuClassId: null,
    stuDuties: null,
    stuGroupId: null,
    createTime: null,
    updateTime: null
  };
  proxy.resetForm("studentRef");
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
  title.value = "添加学生信息";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getStudent(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改学生信息";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["studentRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateStudent(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addStudent(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除学生信息编号为"' + _ids + '"的数据项？').then(function() {
    return delStudent(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('business/student/export', {
    ...queryParams.value
  }, `student_${new Date().getTime()}.xlsx`)
}

getList();
</script>
