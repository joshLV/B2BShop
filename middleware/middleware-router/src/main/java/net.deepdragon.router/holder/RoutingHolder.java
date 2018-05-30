package net.deepdragon.router.holder;

import net.deepdragon.router.holder.RoutingIdentity;

public class RoutingHolder {
    private static final ThreadLocal<RoutingIdentity> routingKeyHolder = new ThreadLocal();

    public RoutingHolder() {
    }

    public static RoutingIdentity getRoutingIdentity() {
        return (RoutingIdentity)routingKeyHolder.get();
    }

    public static void setRoutingIdentity(RoutingIdentity routingIdentity) {
        routingKeyHolder.set(routingIdentity);
    }

    public static void clean() {
        routingKeyHolder.remove();
    }
}

