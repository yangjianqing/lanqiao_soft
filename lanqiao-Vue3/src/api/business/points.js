import request from '@/utils/request'

// 查询积分记录列表
export function listPoints(query) {
  return request({
    url: '/business/points/list',
    method: 'get',
    params: query
  })
}

// 查询积分记录详细
export function getPoints(id) {
  return request({
    url: '/business/points/' + id,
    method: 'get'
  })
}

// 新增积分记录
export function addPoints(data) {
  return request({
    url: '/business/points',
    method: 'post',
    data: data
  })
}

// 修改积分记录
export function updatePoints(data) {
  return request({
    url: '/business/points',
    method: 'put',
    data: data
  })
}

// 删除积分记录
export function delPoints(id) {
  return request({
    url: '/business/points/' + id,
    method: 'delete'
  })
}
