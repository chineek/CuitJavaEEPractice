package cn.edu.cuit.service;

import java.util.List;

public interface AccountTypeService {
    public void addAccountType(String name,String description);
    public List getAccountType();
    public void deleteAccountType(Integer tid);
    public void updateAccountType(Integer tid,String name,String description);


}
