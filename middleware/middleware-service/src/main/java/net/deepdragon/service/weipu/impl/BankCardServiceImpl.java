package net.deepdragon.service.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BankCardDao;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.entity.weipu.BankCard;
import net.deepdragon.service.weipu.BankCardService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * author :乐昌海
 * 资产中心 银行卡绑定接口实现类
 */
@Service(Weipu.SIGN+"BankCardServiceImpl")
public class BankCardServiceImpl extends BaseServiceImpl<BankCard, String> implements BankCardService {
    @Resource(name= Weipu.SIGN+"BankCardDaoImpl")
    private BankCardDao bankCardDao;

    @Override
    public BaseDao<BankCard, String> getBaseDao() {
        return this.bankCardDao;
    }
}
