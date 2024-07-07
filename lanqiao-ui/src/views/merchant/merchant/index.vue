<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="100px">
      <el-form-item label="商家" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入商家"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="服务:" prop="serveType">
        <el-select v-model="queryParams.serveType" placeholder="请选择服务类型:" clearable>
          <el-option
            v-for="dict in dict.type.serve_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
<!--
1、把商家类型表中的数据显示到 商家页面
2、将商家类型表中的数据 赋值给 下拉框
-->
      <el-form-item label="商家类型:" prop="typeId">
        <el-select v-model="queryParams.typeId" placeholder="请选择商家类型:" clearable>
          <el-option
            v-for="type in merTypeList"
            :key="type.typeId"
            :label="type.typeName"
            :value="type.typeId"
          />
        </el-select>
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
          v-hasPermi="['merchant:merchant:add']"
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
          v-hasPermi="['merchant:merchant:edit']"
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
          v-hasPermi="['merchant:merchant:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['merchant:merchant:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>
    <el-table v-loading="loading" :data="merchantList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" />
      <el-table-column label="商家" align="center" prop="name"  show-overflow-tooltip/>
      <el-table-column label="商家类型" align="center" prop="typeId"  show-overflow-tooltip/>
      <el-table-column label="手机号" align="center" prop="phone"  show-overflow-tooltip/>
      <el-table-column label="头像" align="center" prop="headUrl" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.headUrl" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="服务类型:" align="center" prop="serveType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.serve_type" :value="scope.row.serveType"/>
        </template>
      </el-table-column>
<!--      <el-table-column label="描述信息" align="center" prop="disc"  show-overflow-tooltip/>-->
      <el-table-column label="负责人" align="center" prop="bossName" />
      <el-table-column label="身份证" align="center" prop="bossCard"  show-overflow-tooltip/>
      <el-table-column label="卫生许可" align="center" prop="sanitaryLicense" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.sanitaryLicense" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="营业执照" align="center" prop="businessLicense" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.businessLicense" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="员工人数" align="center" prop="employeeNum" />
<!--      <el-table-column label="精度" align="center" prop="lon" />-->
<!--      <el-table-column label="纬度" align="center" prop="lat" />-->
      <el-table-column label="起送费用" align="center" prop="minimumCharge" />
      <el-table-column label="地址" align="center" prop="address"  show-overflow-tooltip/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['merchant:merchant:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['merchant:merchant:remove']"
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
    <!-- 添加或修改商家管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="商家" prop="name">
          <el-input v-model="form.name" placeholder="请输入商家" />
        </el-form-item>
        <el-form-item label="手机号" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入手机号" />
        </el-form-item>
        <el-form-item label="头像">
          <image-upload v-model="form.headUrl"/>
        </el-form-item>
        <el-form-item label="服务类型:" prop="serveType">
          <el-select v-model="form.serveType" placeholder="请选择服务类型:">
            <el-option
              v-for="dict in dict.type.serve_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="描述信息" prop="disc">
          <el-input v-model="form.disc" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="负责人" prop="bossName">
          <el-input v-model="form.bossName" placeholder="请输入负责人" />
        </el-form-item>
        <el-form-item label="身份证" prop="bossCard">
          <el-input v-model="form.bossCard" placeholder="请输入身份证" />
        </el-form-item>
        <el-form-item label="卫生许可">
          <image-upload v-model="form.sanitaryLicense"/>
        </el-form-item>
        <el-form-item label="营业执照">
          <image-upload v-model="form.businessLicense"/>
        </el-form-item>
        <el-form-item label="员工人数" prop="employeeNum">
          <el-input v-model="form.employeeNum" placeholder="请输入员工人数" />
        </el-form-item>
        <el-form-item label="精度" prop="lon">
          <el-input v-model="form.lon" placeholder="请输入精度" />
        </el-form-item>
        <el-form-item label="纬度" prop="lat">
          <el-input v-model="form.lat" placeholder="请输入纬度" />
        </el-form-item>
        <el-form-item label="起送费用" prop="minimumCharge">
          <el-input v-model="form.minimumCharge" placeholder="请输入起送费用" />
        </el-form-item>
        <el-form-item label="地址" prop="address">
          <el-input v-model="form.address" placeholder="请输入地址" />
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
  import { listMerchant, getMerchant, delMerchant, addMerchant, updateMerchant ,listMerType} from "@/api/merchant/merchant";
  export default {
    name: "Merchant",
    dicts: ['serve_type'],
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
        // 商家管理表格数据
        merchantList: [],
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          name: null,
          phone: null,
          serveType: null,
          minimumCharge: null,
          typeId:null,
        },
        // 表单参数
        form: {},
        // 表单校验
        rules: {
          name: [
            { required: true, message: "商家不能为空", trigger: "blur" }
          ],
          phone: [
            { required: true, message: "手机号不能为空", trigger: "blur" }
          ],
          serveType: [
            { required: true, message: "服务类型:不能为空", trigger: "change" }
          ],
        },
        merTypeList:[],
      };
    },
    created() {
      this.getList();
      //获取商家类型
      this.getMerType();
    },
    methods: {
      //查询商家类型
      getMerType(){
        listMerType().then(res=>{
          //商家类型
          console.log(res);
          this.merTypeList=res;
        })
      },

      /** 查询商家管理列表 */
      getList() {
        this.loading = true;
        listMerchant(this.queryParams).then(response => {
          this.merchantList = response.rows;
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
          phone: null,
          headUrl: null,
          serveType: null,
          disc: null,
          bossName: null,
          bossCard: null,
          sanitaryLicense: null,
          businessLicense: null,
          employeeNum: null,
          createTime: null,
          startDelivery: null,
          endDelivery: null,
          lon: null,
          lat: null,
          minimumCharge: null,
          address: null
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
        this.title = "添加商家管理";
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset();
        const id = row.id || this.ids
        getMerchant(id).then(response => {
          this.form = response.data;
          this.open = true;
          this.title = "修改商家管理";
        });
      },
      /** 提交按钮 */
      submitForm() {
        this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.form.id != null) {
              updateMerchant(this.form).then(response => {
                this.$modal.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            } else {
              addMerchant(this.form).then(response => {
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
        this.$modal.confirm('是否确认删除商家管理编号为"' + ids + '"的数据项？').then(function() {
          return delMerchant(ids);
        }).then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        }).catch(() => {});
      },
      /** 导出按钮操作 */
      handleExport() {
        this.download('merchant/merchant/export', {
          ...this.queryParams
        }, `merchant_${new Date().getTime()}.xlsx`)
      }
    }
  };
</script>
