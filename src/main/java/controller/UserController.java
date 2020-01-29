package controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.LoginException;

import logic.Mileage;
import logic.Postaddr;

import logic.ShopService;
import logic.ShopService_pr;
import logic.User;

@Controller //@Component + Controller : ��ü�� ����� ��Ʈ�ѷ��� ��ɱ��� ���� ����
@RequestMapping("user") //user/xxx.shop
public class UserController {
   @Autowired
   private ShopService service;
   
   @Autowired
   private ShopService_pr service_pr;
   
   
   @GetMapping("*")
   public String form(Model model) {
      model.addAttribute(new User());
      return null;
   }
   @PostMapping("userEntry")
   public ModelAndView userEntry(@Valid Mileage mileage, User user, BindingResult bresult, HttpSession session) throws Exception{
      ModelAndView mav = new ModelAndView();
      if(bresult.hasErrors()) {
         bresult.reject("error.input.user");
         mav.getModel().putAll(bresult.getModel());
         return mav;
      }
      //useraccount ���̺� ���� ���. ����� login.jsp�� �̵�
      try {
         service.userInsert(user);
         /* service.mileageInsert(mileage, user.getEmailid(), "ȸ������ ����Ʈ", 4000); */
         User dbUser = service.getUser(user.getEmailid());
         session.setAttribute("loginUser",dbUser);
         mav.setViewName("redirect:main.shop");
         /* service.mileageupdate(dbUser.getEmailid()); */
         // mav.setViewName("user/login"); //redirect �� ����ϸ� ���̵��� ���� ����
      }catch(DataIntegrityViolationException e) {
         e.printStackTrace();
         bresult.reject("error.duplicate.user");
      }
      return mav;
   }
   @PostMapping("login")
   public ModelAndView login(User user,BindingResult bresult,HttpSession session) throws Exception{
      ModelAndView mav = new ModelAndView();
      try {
         User dbUser = service.getUser(user.getEmailid());
         if(!dbUser.getPass().equals(user.getPass())) {
            bresult.reject("error.login.pass");
            return mav;
         }else {
            session.setAttribute("loginUser",dbUser);
            mav.setViewName("redirect:main.shop");
         }
      }catch(EmptyResultDataAccessException e) {
         e.printStackTrace();
         bresult.reject("error.login.id");
      }
      return mav;
   }
   
   @RequestMapping("logout")
   public String logout(HttpSession session) {
      session.invalidate();
      return "redirect:main.shop";
   }
   
   @RequestMapping("main") //UserLoginAspect Ŭ������ �ش��ϴ� �ٽɷ���
   public String checkmain() { //session�� ���� ������ �α��ξ��ѻ���� ���ٰ���
      return "user/main";
   }
   
   //�α��� ����, (�α��� ���� != �Ķ�������� ���� �Ұ�, admin�� ����)
   @RequestMapping("mypage")
   public ModelAndView page(String id, HttpSession session) {
      ModelAndView mav = new ModelAndView();
      User user = service.getUser(id);
      mav.addObject("user", user);
      mav.addObject(new Postaddr()); // �� ��ü�� ����
      
      // ����� ����� ��� ��ȸ
      List<Postaddr> postList = service_pr.postList(user.getEmailid());
      System.out.println("user.getEmailid() = "+user.getEmailid());
      mav.addObject("postList", postList);
      
      // ����� ����
      int postListCnt= service_pr.postListCnt(user.getEmailid());
      System.out.println(postListCnt);
      mav.addObject("postListCnt", postListCnt);
      
      return mav;
   }
   
   //delete.shop�� update.shop������ ����� �� �ְ� ���� : * �� ������� ��� ���
   @GetMapping(value= {"update","delete"}) //ȸ����������ȭ��,Ż��Ȯ��ȭ��
   public ModelAndView checkview(String id,HttpSession session) {
      ModelAndView mav = new ModelAndView();
      User user = service.getUser(id);
      mav.addObject("user", user);
      return mav;
   }
   
   @PostMapping("update")//ȸ������ ���� ��������
   public ModelAndView checkupdate(@Valid User user, BindingResult bresult,HttpSession session) {
      ModelAndView mav = new ModelAndView();
      if(bresult.hasErrors()) {
         bresult.reject("error.input.user");
         return mav;
      }
      //��й�ȣ ���� : �Էµ� ��й�ȣ , db�� ��ϵ� ��й�ȣ ��
      // ��ġ:update
      // ����ġ:�޼����� ��ȿ��������� ȭ�鿡 ���
      User loginUser = (User)session.getAttribute("loginUser");//admin���� Ȯ���ϱ� ����
      if(!user.getPass().equals(loginUser.getPass())){
         bresult.reject("error.login.password");
         return mav;
      }
      try{
         service.userupdate(user);
         mav.setViewName("redirect:mypage.shop?id="+user.getEmailid());
         if(!loginUser.getEmailid().equals("admin")) {
            session.setAttribute("loginUser", user); //������Ʈ ������ login������ �ٲ���
         }
      }catch(Exception e) {
         e.printStackTrace();
         bresult.reject("error.user.update");
      }
      return mav;
   }
   
   //�����ڵ� ����Ż�𰡴��ؾ���, ��ȿ�� ���� �����ʾ���
   @PostMapping("delete")//       user�� �޾ƿ͵� �ǰ�, String id, String password�� �޾ƿ͵� ��
   public ModelAndView checkdelete(User user , HttpSession session) {
      ModelAndView mav = new ModelAndView();
      User loginUser = (User)session.getAttribute("loginUser");
      if(!user.getPass().equals(loginUser.getPass())){
         throw new LoginException("��й�ȣ�� Ʋ���ϴ�.","delete.shop?id="+user.getEmailid());
      }
      try {
         service.userDelete(user.getEmailid());
         if(loginUser.getEmailid().equals("admin")) {
            mav.setViewName("redirect:/admin/list.shop");
         }else {
            session.invalidate();
            mav.addObject("msg",user.getEmailid()+"ȸ����. Ż�� �Ǿ����ϴ�.");
            mav.addObject("url","login.shop");
            mav.setViewName("alert");
         }
      }catch(Exception e) {
         e.printStackTrace();
         throw new LoginException("ȸ�� Ż��� ������ �߻��߽��ϴ�. ����� ���� ���","delete.shop?id="+user.getEmailid());
      }
      return mav;
   }
}