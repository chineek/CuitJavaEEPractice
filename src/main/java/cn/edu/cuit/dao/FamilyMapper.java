package cn.edu.cuit.dao;

import cn.edu.cuit.entity.Family;
import cn.edu.cuit.entity.FamilyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

public interface FamilyMapper {
    long countByExample(FamilyExample example);

    int deleteByExample(FamilyExample example);

    int deleteByPrimaryKey(Integer fid);

    int insert(Family record);

    int insertSelective(Family record);

    List<Family> selectByExampleWithRowbounds(FamilyExample example, RowBounds rowBounds);

    List<Family> selectByExample(FamilyExample example);

    Family selectByPrimaryKey(Integer fid);

    int updateByExampleSelective(@Param("record") Family record, @Param("example") FamilyExample example);

    int updateByExample(@Param("record") Family record, @Param("example") FamilyExample example);

    int updateByPrimaryKeySelective(Family record);

    int updateByPrimaryKey(Family record);
}