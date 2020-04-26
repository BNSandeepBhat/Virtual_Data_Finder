package com.cerner.hackathon2020.objects;

import java.util.List;

public class Output {

  String repositoryName;

  List<FileDetails> fileDetails;

  public List<FileDetails> getFileDetails() {
    return fileDetails;
  }

  public void setFileDetails(List<FileDetails> fileDetails) {
    this.fileDetails = fileDetails;
  }

  public String getRepositoryName() {
    return repositoryName;
  }

  public void setRepositoryName(String repositoryName) {
    this.repositoryName = repositoryName;
  }

  @Override
  public String toString() {
    return "Output [repositoryName=" + repositoryName + ", fileDetails=" + fileDetails + "]";
  }

}
