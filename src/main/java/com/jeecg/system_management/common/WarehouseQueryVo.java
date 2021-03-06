package com.jeecg.system_management.common;

import java.util.Date;

/**
 * 仓储机构信息管理条件查询vo
 *
 * @author 苑希阳
 */
public class WarehouseQueryVo {
    /**
     * 库房名称
     */
    private String repositoryName;
    /**
     * 建成时间开始
     */
    private Date activateTimeStart;
    /**
     * 建成时间结束
     */
    private Date activateTimeEnd;
    /**
     * 库房类型
     */
    private String repositoryCategory;

    public String getRepositoryName() {
        return repositoryName;
    }

    public void setRepositoryName(String repositoryName) {
        this.repositoryName = repositoryName.trim();
    }

    public Date getActivateTimeStart() {
        return activateTimeStart;
    }

    public void setActivateTimeStart(Date activateTimeStart) {
        this.activateTimeStart = activateTimeStart;
    }

    public Date getActivateTimeEnd() {
        return activateTimeEnd;
    }

    public void setActivateTimeEnd(Date activateTimeEnd) {
        this.activateTimeEnd = activateTimeEnd;
    }

    public String getRepositoryCategory() {
        return repositoryCategory;
    }

    public void setRepositoryCategory(String repositoryCategory) {
        this.repositoryCategory = repositoryCategory;
    }
}
