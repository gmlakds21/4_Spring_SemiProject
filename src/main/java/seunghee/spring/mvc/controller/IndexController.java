package seunghee.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import seunghee.spring.mvc._01_25_01_Member5.Member_Service;
import seunghee.spring.mvc._01_25_01_Member5.Member_VO;

import javax.servlet.http.HttpSession;

@Controller
public class IndexController {

    @Autowired
    private Member_Service msrv;

    @GetMapping("/index")
    public String index() {
        // 타일즈 템플릿 기반 뷰 호출
        // template.jsp <- semi.jsp (insertAttribute)
        return "index.tiles";
    }


    /* 로그인 체크기능
     * 입력한 아이디/비밀번호로 로그인 가능 여부 확인
     * 로그인 성공시 로그인 여부를 시스템에 저장하기 위해
     * HttpSession 객체를 이용함
     * 즉, 서버가 생성한 정보를 일정기간 동안
     * WAS 에 저장해두고 필요할 떄마다 이것을 활용함으로써
     * 로그인한 사용자를 식별할 수 있음 */
    @PostMapping("/login/login")
    public String loginok(Member_VO mvo, HttpSession sess) {

        String returnPage = "redirect:/login/loginfail";

        if(msrv.checkLogin(mvo, sess)) // 로그인 성공
            returnPage = "redirect:/index";

        return returnPage;
    }

    @GetMapping("/login/loginfail")
    public String fail() {
        return "fail.tiles";
    }


    @GetMapping("/login/logout")
    public String logout(HttpSession sess) {

        // 세션객체 지우기
        sess.invalidate();

        // sess.setAttribute("UID", null);
        // 이렇게 해도 가능은하다. 하지만 중요한 정보는 되도록 로그아웃과 동시에 지우자.

        return "redirect:/index";
    }

}
