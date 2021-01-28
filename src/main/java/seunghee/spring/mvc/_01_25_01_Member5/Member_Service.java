package seunghee.spring.mvc._01_25_01_Member5;

import javax.servlet.http.HttpSession;

public interface Member_Service {

    String newMember(Member_VO mvo);

    String findZipcode(String dong);

    String checkUserid(String uid);

    boolean checkLogin(Member_VO mvo, HttpSession sess);
}
