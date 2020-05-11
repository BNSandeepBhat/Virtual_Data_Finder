package com.cerner.hackathon2020.git;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import com.cerner.hackathon2020.objects.FileDetails;
import com.cerner.hackathon2020.objects.SearchCriteria;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

/**
 * Class to hit the url and fetch the result from GIT API
 * 
 * @author SB062370
 *
 */
public class GitAccessManager {

  public static Map<String, List<FileDetails>> getSearchedResult(final SearchCriteria criteria) {
    String inline = "";
    String repoFilterString = "";
    String urlString = "";
    Map<String, List<FileDetails>> outputObject = new HashMap<String, List<FileDetails>>();

    try {
      if (criteria.getRepositoryName() != null && !criteria.getRepositoryName().isEmpty()) {
        repoFilterString = "EggPlant/" + criteria.getRepositoryName();
        urlString = "https://github.cerner.com/api/v3/search/code?q=\"" + criteria.getKeyword()
            + "\"+in:file+extension:json+repo:" + repoFilterString;
      } else {
        urlString = "https://github.cerner.com/api/v3/search/code?q=\"" + criteria.getKeyword()
            + "\"+in:file+extension:json";
      }

      final URL url = new URL(urlString.replace("\"", "%22").replace(" ", "%20"));
      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
      conn.setRequestMethod("GET");
      conn.connect();
      int responsecode = conn.getResponseCode();
      if (responsecode != 200) {
        System.out.println("failed to fetch data.");
        return null;
      } else {
        Scanner sc = new Scanner(url.openStream());
        while (sc.hasNext()) {
          inline += sc.nextLine();
        }
        sc.close();
      }
      Gson gson = new Gson();
      JsonElement jelem = gson.fromJson(inline, JsonElement.class);
      JsonObject jobj = jelem.getAsJsonObject();
      JsonArray jsonArray = jobj.getAsJsonArray("items");

      String repo = "";
      String name = "";
      String htmlUrl = "";

      for (JsonElement val : jsonArray) {
        JsonObject repoObj = (JsonObject) val.getAsJsonObject().get("repository");
        repo = repoObj.get("name").toString().replace("\"", "");
        name = val.getAsJsonObject().get("name").toString().replace("\"", "");
        htmlUrl = val.getAsJsonObject().get("html_url").toString().replace("\"", "");
        FileDetails fields = new FileDetails();
        fields.setFileName(name);
        fields.setUrl(htmlUrl);

        if (!outputObject.containsKey(repo)) {
          List<FileDetails> fieldsObjectList = new ArrayList<FileDetails>();
          fieldsObjectList.add(fields);
          outputObject.put(repo, fieldsObjectList);
        } else {
          outputObject.get(repo).add(fields);
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return outputObject;
  }
}
