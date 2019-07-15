package cn.edu.cuit.dao;

import cn.edu.cuit.entity.Account;
import cn.edu.cuit.entity.AccountExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

public interface AccountMapper {
    long countByExample(AccountExample example);

    int deleteByExample(AccountExample example);

    int deleteByPrimaryKey(Integer acid);

    int insert(Account record);

    int insertSelective(Account record);

    List<Account> selectByExampleWithRowbounds(AccountExample example, RowBounds rowBounds);

    List<Account> selectByExample(AccountExample example);

    Account selectByPrimaryKey(Integer acid);

    int updateByExampleSelective(@Param("record") Account record, @Param("example") AccountExample example);

    int updateByExample(@Param("record") Account record, @Param("example") AccountExample example);

    int updateByPrimaryKeySelective(Account record);

    int updateByPrimaryKey(Account record);
}