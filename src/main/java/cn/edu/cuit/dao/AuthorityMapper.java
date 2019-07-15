package cn.edu.cuit.dao;

import cn.edu.cuit.entity.Authority;
import cn.edu.cuit.entity.AuthorityExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

public interface AuthorityMapper {
    long countByExample(AuthorityExample example);

    int deleteByExample(AuthorityExample example);

    int deleteByPrimaryKey(Integer auid);

    int insert(Authority record);

    int insertSelective(Authority record);

    List<Authority> selectByExampleWithRowbounds(AuthorityExample example, RowBounds rowBounds);

    List<Authority> selectByExample(AuthorityExample example);

    Authority selectByPrimaryKey(Integer auid);

    int updateByExampleSelective(@Param("record") Authority record, @Param("example") AuthorityExample example);

    int updateByExample(@Param("record") Authority record, @Param("example") AuthorityExample example);

    int updateByPrimaryKeySelective(Authority record);

    int updateByPrimaryKey(Authority record);
}