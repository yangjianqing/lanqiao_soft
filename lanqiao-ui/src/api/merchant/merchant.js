import request from '@/utils/request'

// 查询商家管理列表
export function listMerchant(query) {
  return request({
    url: '/merchant/merchant/list',
    method: 'get',
    params: query
  })
}

// 查询商家类型列表
export function listMerType() {
  return request({
    url: '/merchant/merchant/listType',
    method: 'get',
  })
}

// 查询商家管理详细
export function getMerchant(id) {
  return request({
    url: '/merchant/merchant/' + id,
    method: 'get'
  })
}

// 新增商家管理
export function addMerchant(data) {
  return request({
    url: '/merchant/merchant',
    method: 'post',
    data: data
  })
}

// 修改商家管理
export function updateMerchant(data) {
  return request({
    url: '/merchant/merchant',
    method: 'put',
    data: data
  })
}

// 删除商家管理
export function delMerchant(id) {
  return request({
    url: '/merchant/merchant/' + id,
    method: 'delete'
  })
}
