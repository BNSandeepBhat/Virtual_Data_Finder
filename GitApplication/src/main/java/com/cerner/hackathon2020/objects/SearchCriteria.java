package com.cerner.hackathon2020.objects;

/**
 * POJO class to hold search criteria
 * 
 * @author SB062370
 *
 */
public class SearchCriteria {
	
	String repositoryName;
	
	String keyword;

	public String getRepositoryName() {
		return repositoryName;
	}

	public void setRepositoryName(String repositoryName) {
		this.repositoryName = repositoryName;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "SearchCriteria [repositoryName=" + repositoryName + ", keyword=" + keyword + "]";
	}

}
