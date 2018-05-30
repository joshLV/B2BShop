package net.deepdragon.router.datasource;

import com.alibaba.druid.pool.DruidDataSource;
import net.deepdragon.router.datasource.support.DefaultDataSourceFailureDetecter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;

public class DataSourceDescriptor implements InitializingBean {
    protected static final Logger logger = LoggerFactory.getLogger(DataSourceDescriptor.class);
    private String identity;
    private DruidDataSource masterDataSource;
    private boolean masterAvailable;
    private DruidDataSource standbyDataSource;
    private boolean standbyAvailable;
    private DruidDataSource slaveDataSource;
    private boolean slaveAvailable;
    private boolean enableMasterSlave;
    private boolean enableMasterStandby;
    private MasterStandbyMonitorThread masterStandbyMonitorThread;

    public DataSourceDescriptor() {
    }

    public String getIdentity() {
        return this.identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    public DruidDataSource getMasterDataSource() {
        return this.masterDataSource;
    }

    public void setMasterDataSource(DruidDataSource masterDataSource) {
        this.masterDataSource = masterDataSource;
    }

    public DruidDataSource getStandbyDataSource() {
        return this.standbyDataSource;
    }

    public void setStandbyDataSource(DruidDataSource standbyDataSource) {
        this.standbyDataSource = standbyDataSource;
    }

    public DruidDataSource getSlaveDataSource() {
        return this.slaveDataSource;
    }

    public void setSlaveDataSource(DruidDataSource slaveDataSource) {
        this.slaveDataSource = slaveDataSource;
    }

    public boolean isMasterAvailable() {
        return this.masterAvailable;
    }

    public void setMasterAvailable(boolean masterAvailable) {
        this.masterAvailable = masterAvailable;
    }

    public boolean isStandbyAvailable() {
        return this.standbyAvailable;
    }

    public void setStandbyAvailable(boolean standbyAvailable) {
        this.standbyAvailable = standbyAvailable;
    }

    public boolean isSlaveAvailable() {
        return this.slaveAvailable;
    }

    public void setSlaveAvailable(boolean slaveAvailable) {
        this.slaveAvailable = slaveAvailable;
    }

    public boolean isEnableMasterSlave() {
        return this.enableMasterSlave;
    }

    public void setEnableMasterSlave(boolean enableMasterSlave) {
        this.enableMasterSlave = enableMasterSlave;
    }

    public boolean isEnableMasterStandby() {
        return this.enableMasterStandby;
    }

    public void setEnableMasterStandby(boolean enableMasterStandby) {
        this.enableMasterStandby = enableMasterStandby;
    }

    public void afterPropertiesSet() throws Exception {
        if(this.isEnableMasterStandby()) {
            this.createMasterStandbyMonitorThread();
        }

        logger.info("Loading DataSourceDescriptor Objects For [" + this.identity + "]");
    }

    protected void createMasterStandbyMonitorThread() {
        String threadName = "Master-Standby-Monitor-" + this.getIdentity();
        this.masterStandbyMonitorThread = new MasterStandbyMonitorThread(threadName, this);
        this.masterStandbyMonitorThread.start();
    }

    public int hashCode() {
        boolean prime = true;
        byte result = 1;
        int result1 = 31 * result + (this.identity == null?0:this.identity.hashCode());
        return result1;
    }

    public boolean equals(Object obj) {
        if(this == obj) {
            return true;
        } else if(obj == null) {
            return false;
        } else if(this.getClass() != obj.getClass()) {
            return false;
        } else {
            DataSourceDescriptor other = (DataSourceDescriptor)obj;
            if(this.identity == null) {
                if(other.identity != null) {
                    return false;
                }
            } else if(!this.identity.equals(other.identity)) {
                return false;
            }

            return true;
        }
    }

    public String toString() {
        return "DataSourceDescriptor [identity=" + this.identity + ", standbyDataSource=" + this.standbyDataSource + ", masterDataSource=" + this.masterDataSource + ", slaveDataSource=" + this.slaveDataSource + "]";
    }

    public void init() {
    }

    public void destroy() {
        if(this.isEnableMasterStandby() && this.masterStandbyMonitorThread != null && this.masterStandbyMonitorThread.isAlive()) {
            this.masterStandbyMonitorThread.stopMasterStandbyMonitor();
        }

        logger.info("Destroy DataSourceDescriptor Objects For [" + this.identity + "]");
    }

    public class MasterStandbyMonitorThread extends Thread {
        private volatile boolean stoped;
        private Thread currentThread;
        private DataSourceDescriptor dataSourceDescriptor;

        public MasterStandbyMonitorThread(String name, DataSourceDescriptor dataSourceDescriptor) {
            super(name);
            this.setDaemon(true);
            this.dataSourceDescriptor = dataSourceDescriptor;
        }

        public void run() {
            this.currentThread = Thread.currentThread();
            this.stoped = false;
            DefaultDataSourceFailureDetecter detecter = new DefaultDataSourceFailureDetecter();

            while(!this.stoped) {
                try {
                    this.dataSourceDescriptor.setMasterAvailable(detecter.isValid(this.dataSourceDescriptor.getMasterDataSource()));
                    this.dataSourceDescriptor.setStandbyAvailable(detecter.isValid(this.dataSourceDescriptor.getStandbyDataSource()));
                    this.dataSourceDescriptor.setSlaveAvailable(detecter.isValid(this.dataSourceDescriptor.getSlaveDataSource()));
                } catch (Exception var3) {
                    DataSourceDescriptor.logger.error("DataSourceFailureDetecter Exception", var3);
                }

                DataSourceDescriptor.logger.debug("[" + this.dataSourceDescriptor.getIdentity() + "] Master=" + this.dataSourceDescriptor.isMasterAvailable() + ",Standby=" + this.dataSourceDescriptor.isStandbyAvailable() + ",Slave=" + this.dataSourceDescriptor.isSlaveAvailable());

                try {
                    Thread.sleep(Long.parseLong(System.getProperty("master.standby.monitor", "10000")));
                } catch (InterruptedException var4) {
                    break;
                }
            }

        }

        public void stopMasterStandbyMonitor() {
            this.stoped = true;
            if(this.currentThread != null) {
                this.currentThread.interrupt();
            }

        }
    }
}
