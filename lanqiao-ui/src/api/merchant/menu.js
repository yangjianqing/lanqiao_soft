import request from '@/utils/request'

// 查询菜单管理列表
export function listMenu(query) {
  return request({
    url: '/merchant/menu/list',
    method: 'get',
    params: query
  })
}

// 查询菜单管理详细
export function getMenu(id) {
  return request({
    url: '/merchant/menu/' + id,
    method: 'get'
  })
}

// 新增菜单管理
export function addMenu(data) {
  return request({
    url: '/merchant/menu',
    method: 'post',
    data: data
  })
}

// 修改菜单管理
export function updateMenu(data) {
  return request({
    url: '/merchant/menu',
    method: 'put',
    data: data
  })
}

// 删除菜单管理
export function delMenu(id) {
  return request({
    url: '/merchant/menu/' + id,
    method: 'delete'
  })
}
