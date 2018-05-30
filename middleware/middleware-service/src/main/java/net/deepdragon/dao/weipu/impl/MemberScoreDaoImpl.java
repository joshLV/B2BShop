package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.MemberScoreDao;
import net.deepdragon.entity.weipu.MemberScore;
import org.springframework.stereotype.Repository;

/**
 * Created by gzj on 2015/9/17 0017.
 */
@Repository(Weipu.SIGN + "MemberScoreDaoImpl")
public class MemberScoreDaoImpl extends BaseDaoImpl<MemberScore, String> implements
        MemberScoreDao {
}
