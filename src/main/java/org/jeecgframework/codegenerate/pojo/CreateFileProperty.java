package org.jeecgframework.codegenerate.pojo;

public class CreateFileProperty
{
  private boolean actionFlag;
  private boolean serviceIFlag;
  private boolean entityFlag;
  private boolean pageFlag;
  private boolean serviceImplFlag;
  private boolean jspFlag;
  private String jspMode;

  public boolean isActionFlag()
  {
    return this.actionFlag;
  }
  public boolean isServiceIFlag() {
    return this.serviceIFlag;
  }
  public boolean isEntityFlag() {
    return this.entityFlag;
  }
  public boolean isPageFlag() {
    return this.pageFlag;
  }
  public boolean isServiceImplFlag() {
    return this.serviceImplFlag;
  }
  public void setActionFlag(boolean actionFlag) {
    this.actionFlag = actionFlag;
  }
  public void setServiceIFlag(boolean serviceIFlag) {
    this.serviceIFlag = serviceIFlag;
  }
  public void setEntityFlag(boolean entityFlag) {
    this.entityFlag = entityFlag;
  }
  public void setPageFlag(boolean pageFlag) {
    this.pageFlag = pageFlag;
  }
  public void setServiceImplFlag(boolean serviceImplFlag) {
    this.serviceImplFlag = serviceImplFlag;
  }
  public boolean isJspFlag() {
    return this.jspFlag;
  }
  public void setJspFlag(boolean jspFlag) {
    this.jspFlag = jspFlag;
  }
  public String getJspMode() {
    return this.jspMode;
  }
  public void setJspMode(String jspMode) {
    this.jspMode = jspMode;
  }
}