import request from '@/utils/request'

// 查询外卖的用户列表
export function listUsers(query) {
  return request({
    url: '/order/users/list',
    method: 'get',
    params: query
  })
}

// 查询外卖的用户详细
export function getUsers(userId) {
  return request({
    url: '/order/users/' + userId,
    method: 'get'
  })
}

// 新增外卖的用户
export function addUsers(data) {
  return request({
    url: '/order/users',
    method: 'post',
    data: data
  })
}

// 修改外卖的用户
export function updateUsers(data) {
  return request({
    url: '/order/users',
    method: 'put',
    data: data
  })
}

// 删除外卖的用户
export function delUsers(userId) {
  return request({
    url: '/order/users/' + userId,
    method: 'delete'
  })
}
