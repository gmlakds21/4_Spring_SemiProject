package seunghee.spring.mvc.Member;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service("msrv")
public class Member_Serviceimpl implements Member_Service {

    @Autowired
    private Member_DAO mdao;

    @Override
    public String newMember(Member_VO mvo) {

        String result = "회원가입 실패!";
        int cnt = mdao.insertMember(mvo);
        if (cnt > 0) result = "회원가입 성공!!";

        return result;
    }

    /* 조회 결과 출력방법 1 : csv (쉼표로 구분)
     * 서울, 강남구, 논현동
     *
     * 조회 결과 출력방법 2 : xml
     * <zip> <sido>서울</sido> <gugun>강남구</gugun> <dong>논현동</dong> </zip>
     *
     * 조회 결과 출력방법 3 : json
     * {'sido':'서울', 'gugun':'강남구', 'dong':'논현동'}
     *
     * 코드로 json 형태로 결과물을 만들려면 상당히 복잡함
     * ObjectMapper 라이브러리를 이용하면 손쉽게 JSON 유형의 데이터를 생성할 수 있음
     */
    @Override // 동이름으로 우편번호 검색
    public String findZipcode(String dong) {

        ObjectMapper mapper = new ObjectMapper();
        String json = "";

        dong = dong + "%";

        try {
            json = mapper.writeValueAsString(mdao.selectZipcode(dong));
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return json;
    }

    @Override
    public String checkUserid(String uid) {

        String result = "0";
        int cnt = mdao.selectOneUserid(uid);
        if (cnt > 0) result = "1";

        return result;
    }

    @Override
    public boolean checkLogin(Member_VO mvo, HttpSession sess) {

        boolean isLogin = false;

        // 로그인 성공시 회원정보를 세션에 저장
        // 입력한 아이디/비밀번호가 member 테이블에 있는지 확인
        // 있으면 1을 반환, 없으면 0을 반환
        if(mdao.selectLogin(mvo) > 0) {
            sess.setAttribute("UID", mvo.getUserid());
            isLogin = true;
        }

        return isLogin;
    }
}
