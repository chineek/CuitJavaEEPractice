package cn.edu.cuit.service;

import java.util.Date;
import java.util.List;

/**
 * @Author: yzh
 * @Date: 2019/7/14 10:38
 */
public interface AccountService {
    //根据用户ID得到用户的全部账单信息
    public List getAccountByUser(Integer uid,Integer page,Integer limit);
    // 得到用户账户列表的数量
    public int getAccountCountByUid(Integer uid);

    //根据时间范围得到对应的账单信息
    public List getAccountByDate(Date date1,Date date2);

    //根据金额范围得到对应的账单信息
    public List getAccountByAmount(Long amount1,Long amount2);

    //根据账单类型得到对应的账单信息
    public List getAccountByIEType(Integer TEType);
}
