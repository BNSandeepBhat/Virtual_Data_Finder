package com.cerner.hackathon2020.objects;

/**
 * POJO class to hold output fields.
 * 
 * @author SB062370
 *
 */
public class FileDetails {

  String fileName;

  String url;

  public String getFileName() {
    return fileName;
  }

  public void setFileName(String fileName) {
    this.fileName = fileName;
  }

  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }

  @Override
  public String toString() {
    return "OutputFields [fileName=" + fileName + ", url=" + url + "]";
  }
}
