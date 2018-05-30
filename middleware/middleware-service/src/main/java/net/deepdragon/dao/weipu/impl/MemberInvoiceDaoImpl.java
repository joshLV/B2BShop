package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.MemberInvoiceDao;
import net.deepdragon.entity.weipu.MemberInvoice;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by gzj on 2015/9/24 0024.
 */
@Repository(Weipu.SIGN + "MemberInvoiceDaoImpl")
public class MemberInvoiceDaoImpl extends BaseDaoImpl<MemberInvoice,String> implements MemberInvoiceDao {
    @Override
    public MemberInvoice getDefaultInvoiceInfo(Map<String, Object> paramMap, String memberId) {
        String defaultStatement = MemberInvoice.class.getName() + "Mapper.getDefault";
        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("memberId",memberId);
        return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(defaultStatement,parameter);
    }

    @Override
    public void updateDefault(Map<String, Object> paramMap, String memberId, String id) {
        String defaultStatement = MemberInvoice.class.getName() + "Mapper.updateDefault";

        paramMap.put("memberId",memberId);
        if(id != null) {
            paramMap.put("id", id);
        }
        sqlSessionTemplateFactory.getSqlSessionTemplate().update(defaultStatement,paramMap);
    }
}
