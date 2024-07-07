import request from '@/utils/request'

// 查询订单商品列表
export function listItems(query) {
  return request({
    url: '/order/items/list',
    method: 'get',
    params: query
  })
}

// 查询订单商品详细
export function getItems(orderItemId) {
  return request({
    url: '/order/items/' + orderItemId,
    method: 'get'
  })
}

// 新增订单商品
export function addItems(data) {
  return request({
    url: '/order/items',
    method: 'post',
    data: data
  })
}

// 修改订单商品
export function updateItems(data) {
  return request({
    url: '/order/items',
    method: 'put',
    data: data
  })
}

// 删除订单商品
export function delItems(orderItemId) {
  return request({
    url: '/order/items/' + orderItemId,
    method: 'delete'
  })
}
