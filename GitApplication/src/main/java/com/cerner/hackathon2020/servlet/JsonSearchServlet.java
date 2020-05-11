package com.cerner.hackathon2020.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.cerner.hackathon2020.git.GitAccessManager;
import com.cerner.hackathon2020.objects.FileDetails;
import com.cerner.hackathon2020.objects.SearchCriteria;

/**
 * @author SB062370 Servlet implementation class JsonSearchServlet
 */
public class JsonSearchServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public JsonSearchServlet() {
    super();
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.getWriter().append("Served at: ").append(request.getContextPath());
  }

  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String repoName = (String) request.getParameter("repoName");
    String keyword = (String) request.getParameter("keyword");
    SearchCriteria criteria = new SearchCriteria();
    criteria.setRepositoryName(repoName);
    criteria.setKeyword(keyword);
    Map<String, List<FileDetails>> output = GitAccessManager.getSearchedResult(criteria);

    request.setAttribute("repositoryName", repoName);
    request.setAttribute("keyValue", keyword);
    request.setAttribute("output", output);
    request.getRequestDispatcher("result.jsp").forward(request, response);
  }
}
