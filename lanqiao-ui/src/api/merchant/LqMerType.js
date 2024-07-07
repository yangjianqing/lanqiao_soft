import request from '@/utils/request'

// 查询商家类型列表
export function listLqMerType(query) {
  return request({
    url: '/merchant/LqMerType/list',
    method: 'get',
    params: query
  })
}

// 查询商家类型详细
export function getLqMerType(typeId) {
  return request({
    url: '/merchant/LqMerType/' + typeId,
    method: 'get'
  })
}

// 新增商家类型
export function addLqMerType(data) {
  return request({
    url: '/merchant/LqMerType',
    method: 'post',
    data: data
  })
}

// 修改商家类型
export function updateLqMerType(data) {
  return request({
    url: '/merchant/LqMerType',
    method: 'put',
    data: data
  })
}

// 删除商家类型
export function delLqMerType(typeId) {
  return request({
    url: '/merchant/LqMerType/' + typeId,
    method: 'delete'
  })
}
