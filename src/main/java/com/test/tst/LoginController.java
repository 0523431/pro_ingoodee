package com.test.tst;

import java.io.IOException;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class LoginController 
{
   private NaverLoginBO naverLoginBO;
   private String apiResult = null;

   @Autowired
   private void setNaverLoginBO(NaverLoginBO naverLoginBO) 
   {
      this.naverLoginBO = naverLoginBO;
   }

   @RequestMapping(value = "user/naver_login", method = { RequestMethod.GET, RequestMethod.POST })
   public String login(Model model, HttpSession session) 
   {
      String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
      System.out.println("네이버:" + naverAuthUrl);
      model.addAttribute("naver_url", naverAuthUrl);
      return "user/naver_login";
   }

   @RequestMapping(value = "/user/naver_join", method = { RequestMethod.GET, RequestMethod.POST })
   public String join(Model model, HttpSession session) 
   {
      String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
      System.out.println("네이버:" + naverAuthUrl);
      model.addAttribute("naver_url", naverAuthUrl);
      return "/user/naver_join";
   }

   @RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
   public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException 
   {
      System.out.println("여기는 callback");
      OAuth2AccessToken oauthToken;
      oauthToken = naverLoginBO.getAccessToken(session, code, state);
      apiResult = naverLoginBO.getUserProfile(oauthToken);
      JSONParser parser = new JSONParser();
      Object obj = parser.parse(apiResult);
      JSONObject jsonObj = (JSONObject) obj;
      JSONObject response_obj = (JSONObject) jsonObj.get("response");
      String nickname = (String) response_obj.get("nickname");
      System.out.println(nickname);
      session.setAttribute("sessionId", nickname);
      model.addAttribute("result", apiResult);
      return "login";
   }

   @RequestMapping(value = "/user/naver_logout", method = { RequestMethod.GET, RequestMethod.POST })
   public String logout(HttpSession session) throws IOException 
   {
      System.out.println("여기는 naver_logout");
      session.invalidate();
      return "redirect:main.jsp";
   }
}