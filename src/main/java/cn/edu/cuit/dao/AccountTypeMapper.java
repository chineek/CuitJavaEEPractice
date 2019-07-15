package cn.edu.cuit.dao;

import cn.edu.cuit.entity.AccountType;
import cn.edu.cuit.entity.AccountTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

public interface AccountTypeMapper {
    long countByExample(AccountTypeExample example);

    int deleteByExample(AccountTypeExample example);

    int deleteByPrimaryKey(Integer tid);

    int insert(AccountType record);

    int insertSelective(AccountType record);

    List<AccountType> selectByExampleWithRowbounds(AccountTypeExample example, RowBounds rowBounds);

    List<AccountType> selectByExample(AccountTypeExample example);

    AccountType selectByPrimaryKey(Integer tid);

    int updateByExampleSelective(@Param("record") AccountType record, @Param("example") AccountTypeExample example);

    int updateByExample(@Param("record") AccountType record, @Param("example") AccountTypeExample example);

    int updateByPrimaryKeySelective(AccountType record);

    int updateByPrimaryKey(AccountType record);
}