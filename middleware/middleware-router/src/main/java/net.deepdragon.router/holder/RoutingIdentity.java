package net.deepdragon.router.holder;

import java.io.Serializable;

public class RoutingIdentity implements Serializable {
    private static final long serialVersionUID = 6676752685022211439L;
    private String tenantId;
    private String methodName;

    public RoutingIdentity() {
    }

    public String getTenantId() {
        return this.tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }

    public String getMethodName() {
        return this.methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }
}
