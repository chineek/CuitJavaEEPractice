package cn.edu.cuit.VO;

/**
 * author: 35024
 * date: 2019/7/17.
 */
public class AccountReport {
   private AccountMonthReport accountMonthReport;
   private AccountMonthTypeReport accountMonthTypeReport;

    public AccountMonthReport getAccountMonthReport() {
        return accountMonthReport;
    }

    public void setAccountMonthReport(AccountMonthReport accountMonthReport) {
        this.accountMonthReport = accountMonthReport;
    }

    public AccountMonthTypeReport getAccountMonthTypeReport() {
        return accountMonthTypeReport;
    }

    public void setAccountMonthTypeReport(AccountMonthTypeReport accountMonthTypeReport) {
        this.accountMonthTypeReport = accountMonthTypeReport;
    }
}
