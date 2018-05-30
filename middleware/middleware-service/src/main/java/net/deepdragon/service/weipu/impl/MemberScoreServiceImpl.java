package net.deepdragon.service.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.MemberScoreDao;
import net.deepdragon.entity.weipu.MemberScore;
import net.deepdragon.service.weipu.MemberScoreService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by gzj on 2015/9/17 0017.
 */
@Service(Weipu.SIGN+"MemberScoreServiceImpl")
public class MemberScoreServiceImpl extends BaseServiceImpl<MemberScore, String> implements MemberScoreService {

    @Resource(name= Weipu.SIGN+"MemberScoreDaoImpl")
    private MemberScoreDao memberScoreDao;

    @Override
    public BaseDao<MemberScore, String> getBaseDao() {
        return this.memberScoreDao;
    }
}
