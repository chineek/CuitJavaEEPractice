package cn.edu.cuit.dao;

import cn.edu.cuit.entity.Deposit;
import cn.edu.cuit.entity.DepositExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

public interface DepositMapper {
    long countByExample(DepositExample example);

    int deleteByExample(DepositExample example);

    int deleteByPrimaryKey(Integer did);

    int insert(Deposit record);

    int insertSelective(Deposit record);

    List<Deposit> selectByExampleWithRowbounds(DepositExample example, RowBounds rowBounds);

    List<Deposit> selectByExample(DepositExample example);

    Deposit selectByPrimaryKey(Integer did);

    int updateByExampleSelective(@Param("record") Deposit record, @Param("example") DepositExample example);

    int updateByExample(@Param("record") Deposit record, @Param("example") DepositExample example);

    int updateByPrimaryKeySelective(Deposit record);

    int updateByPrimaryKey(Deposit record);
}