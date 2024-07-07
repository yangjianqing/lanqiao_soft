import request from '@/utils/request'

// 查询菜单分类管理列表
export function listMenuType(query) {
  return request({
    url: '/merchant/menuType/list',
    method: 'get',
    params: query
  })
}

// 查询菜单分类管理详细
export function getMenuType(id) {
  return request({
    url: '/merchant/menuType/' + id,
    method: 'get'
  })
}

// 新增菜单分类管理
export function addMenuType(data) {
  return request({
    url: '/merchant/menuType',
    method: 'post',
    data: data
  })
}

// 修改菜单分类管理
export function updateMenuType(data) {
  return request({
    url: '/merchant/menuType',
    method: 'put',
    data: data
  })
}

// 删除菜单分类管理
export function delMenuType(id) {
  return request({
    url: '/merchant/menuType/' + id,
    method: 'delete'
  })
}
