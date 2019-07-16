package cn.edu.cuit.service;

import cn.edu.cuit.VO.UserAndSpendingVO;

import java.util.List;

/**
 * @Author: ty
 * @Date: 2019/7/16 15:40
 */
public interface LimitManagerService {
    //查询家庭成员额度
    public List getAllLimit(int uid,Integer page,Integer limit);

}
