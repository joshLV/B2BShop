package net.deepdragon.service.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.ComplaintDao;
import net.deepdragon.entity.weipu.Complaint;
import net.deepdragon.service.weipu.ComplaintService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * author :乐昌海
 */
@Service(Weipu.SIGN+"ComplaintServiceImpl")
public class ComplaintServiceImpl extends BaseServiceImpl<Complaint, String> implements ComplaintService {
    @Resource(name= Weipu.SIGN+"ComplaintDaoImpl")
    private ComplaintDao complaintDao;

    @Override
    public BaseDao<Complaint, String> getBaseDao() {
        return this.complaintDao;
    }
}
