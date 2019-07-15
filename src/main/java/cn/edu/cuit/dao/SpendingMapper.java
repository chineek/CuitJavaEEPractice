package cn.edu.cuit.dao;

import cn.edu.cuit.entity.Spending;
import cn.edu.cuit.entity.SpendingExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

public interface SpendingMapper {
    long countByExample(SpendingExample example);

    int deleteByExample(SpendingExample example);

    int deleteByPrimaryKey(Integer sid);

    int insert(Spending record);

    int insertSelective(Spending record);

    List<Spending> selectByExampleWithRowbounds(SpendingExample example, RowBounds rowBounds);

    List<Spending> selectByExample(SpendingExample example);

    Spending selectByPrimaryKey(Integer sid);

    int updateByExampleSelective(@Param("record") Spending record, @Param("example") SpendingExample example);

    int updateByExample(@Param("record") Spending record, @Param("example") SpendingExample example);

    int updateByPrimaryKeySelective(Spending record);

    int updateByPrimaryKey(Spending record);
}