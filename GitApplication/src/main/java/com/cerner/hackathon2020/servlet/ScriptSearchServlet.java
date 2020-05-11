package com.cerner.hackathon2020.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.cerner.hackathon2020.git.GitAccessPreferenceManager;
import com.cerner.hackathon2020.objects.FileDetails;
import com.cerner.hackathon2020.objects.SearchCriteria;

/**
 * @author SB062370 Servlet implementation class ScriptSearchServlet
 */
public class ScriptSearchServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public ScriptSearchServlet() {
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
    String repoName = (String) request.getParameter("scriptRepoName");
    String keyword = (String) request.getParameter("scriptKeyword");
    SearchCriteria criteria = new SearchCriteria();
    criteria.setRepositoryName(repoName);
    criteria.setKeyword(keyword);
    Map<String, List<FileDetails>> output = GitAccessPreferenceManager.getSearchedResult(criteria);

    request.setAttribute("scriptRepositoryName", repoName);
    request.setAttribute("scriptKeyValue", keyword);
    request.setAttribute("scriptOutput", output);
    request.getRequestDispatcher("scriptResult.jsp").forward(request, response);
  }
}
