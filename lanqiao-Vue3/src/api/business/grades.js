import request from '@/utils/request'

// 查询学生成绩信息列表
export function listGrades(query) {
  return request({
    url: '/business/grades/list',
    method: 'get',
    params: query
  })
}

// 查询学生成绩信息详细
export function getGrades(id) {
  return request({
    url: '/business/grades/' + id,
    method: 'get'
  })
}

// 新增学生成绩信息
export function addGrades(data) {
  return request({
    url: '/business/grades',
    method: 'post',
    data: data
  })
}

// 修改学生成绩信息
export function updateGrades(data) {
  return request({
    url: '/business/grades',
    method: 'put',
    data: data
  })
}

// 删除学生成绩信息
export function delGrades(id) {
  return request({
    url: '/business/grades/' + id,
    method: 'delete'
  })
}
