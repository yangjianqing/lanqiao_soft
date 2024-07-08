import request from '@/utils/request'

// 查询班级信息列表
export function listClassManagement(query) {
  return request({
    url: '/business/classManagement/list',
    method: 'get',
    params: query
  })
}

// 查询班级信息详细
export function getClassManagement(id) {
  return request({
    url: '/business/classManagement/' + id,
    method: 'get'
  })
}

// 新增班级信息
export function addClassManagement(data) {
  return request({
    url: '/business/classManagement',
    method: 'post',
    data: data
  })
}

// 修改班级信息
export function updateClassManagement(data) {
  return request({
    url: '/business/classManagement',
    method: 'put',
    data: data
  })
}

// 删除班级信息
export function delClassManagement(id) {
  return request({
    url: '/business/classManagement/' + id,
    method: 'delete'
  })
}
