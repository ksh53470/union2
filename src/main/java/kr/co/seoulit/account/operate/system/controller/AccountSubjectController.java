package kr.co.seoulit.account.operate.system.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.seoulit.account.operate.system.service.SystemService;

import kr.co.seoulit.account.operate.system.to.AccountBean;
import kr.co.seoulit.account.operate.system.to.AccountControlBean;
import kr.co.seoulit.account.operate.system.to.PeriodBean;

@RestController
@RequestMapping("/operate")
public class AccountSubjectController {
	
	@Autowired
    private SystemService systemService;

	
    ModelAndView mav = null;
    ModelMap map = new ModelMap();
    
    @GetMapping("/account")
    public AccountBean findAccount(@RequestParam String accountCode) {
      
            AccountBean accountBean = systemService.findAccount(accountCode);

        return accountBean;
    }

    @GetMapping("/accountcontrollist")
    public ArrayList<AccountControlBean> findAccountControlList(@RequestParam(value="accountCode", required=false) String accountCode) {
        System.out.println("accountCode :"+accountCode);

            ArrayList<AccountControlBean> accountControlList = systemService.findAccountControlList(accountCode);


        return accountControlList;
    }
    @GetMapping("/accountlistbyname")
    public ArrayList<AccountBean> findAccountListByName(@RequestParam String accountName) {

        System.out.println("accountName :"+accountName);
    	ArrayList<AccountBean> accountList = systemService.findAccountListByName(accountName);
 
        return accountList;
    }
    @GetMapping("/parentaccountlist")
    public ArrayList<AccountBean> findParentAccountList() {

        return   systemService.findParentAccountList();
    }
    @GetMapping("/detailaccountlist")
    public ArrayList<AccountBean> findDetailAccountList(@RequestParam String code) {

            ArrayList<AccountBean> accountList = systemService.findDetailAccountList(code);
         
        return accountList;
    }

    @GetMapping("/accountmodification")
    public void modifyAccount(@RequestParam String accountInnerCode,
    						  @RequestParam String accountName) {

            AccountBean accountBean = new AccountBean();

            accountBean.setAccountInnerCode(accountInnerCode);
            accountBean.setAccountName(accountName);

    }
    @GetMapping("/detailbudgetlist")
    public ArrayList<AccountBean> findDetailBudgetList(@RequestParam String code) {
   
        ArrayList<AccountBean> budgetList = systemService.findDetailBudgetList(code);
           
        return budgetList;
    }
    
    @GetMapping("/parentbudgetlist")
    public ArrayList<AccountBean> findParentBudgetList() {
 
            ArrayList<AccountBean> parentBudgetList = systemService.findParentBudgetList();
      
        return parentBudgetList;
    }

    @GetMapping("/parentbudgetlist2")
    public ArrayList<AccountBean> findParentBudgetList2(@RequestParam String workplaceCode,
                                                        @RequestParam String deptCode,
                                                        @RequestParam String accountPeriodNo) {
        System.out.println("workplaceCode:" +workplaceCode);
        System.out.println("deptCode:" +deptCode);
        ArrayList<AccountBean> parentBudgetList = systemService.findParentBudgetList2(workplaceCode,deptCode,accountPeriodNo);

        return parentBudgetList;
    }

    @GetMapping("/accountperiodlist")
    public ArrayList<PeriodBean> findAccountPeriodList() {
     
            ArrayList<PeriodBean> accountPeriodList = systemService.findAccountPeriodList();

        return accountPeriodList;
    }
}
