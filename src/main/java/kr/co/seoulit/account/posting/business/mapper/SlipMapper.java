package kr.co.seoulit.account.posting.business.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.seoulit.account.posting.business.to.AccountingSettlementStatusBean;
import org.apache.ibatis.annotations.Mapper;

import kr.co.seoulit.account.posting.business.to.SlipBean;

@Mapper
public interface SlipMapper {

    public void deleteSlip(String slipNo);

    public void updateSlip(SlipBean slipBean);

    public void insertSlip(SlipBean slipBean);

    public ArrayList<SlipBean> selectRangedSlipList(HashMap<String, Object> param);

    public int selectSlipCount(String today);
    
    public ArrayList<SlipBean> selectSlipDataList(String slipDate);
	
    public ArrayList<SlipBean> selectSlip(String slipNo);
        
    public ArrayList<AccountingSettlementStatusBean> selectAccountingSettlementStatus(HashMap<String, Object> param);
}
