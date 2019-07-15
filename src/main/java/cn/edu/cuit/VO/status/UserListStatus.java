package cn.edu.cuit.VO.status;

import cn.edu.cuit.VO.ListStatus;
import cn.edu.cuit.entity.User;
import java.util.List;
/**
 * Created by a on 2019/7/15.
 */
public class UserListStatus extends ListStatus {
    private List<User> data;
    public List<User> getData(){
        return data;
    }
    public void setData(List<User> data){
        this.data=data;
    }
}
