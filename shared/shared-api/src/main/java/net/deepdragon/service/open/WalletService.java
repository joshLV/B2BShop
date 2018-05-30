package net.deepdragon.service.open;


import net.deepdragon.entity.open.Wallet;
import net.deepdragon.service.weipu.BaseService;

import java.util.List;
import java.util.Map;

/**
 * Created by TianYu on 2015-05-19.
 */
public interface WalletService extends BaseService<Wallet, String> {

    List<Wallet> getAll(Map<String, Object> paramMap) throws Exception;

}
