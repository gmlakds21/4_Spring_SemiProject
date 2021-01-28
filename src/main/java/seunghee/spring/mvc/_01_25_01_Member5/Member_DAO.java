package seunghee.spring.mvc._01_25_01_Member5;

import seunghee.spring.mvc._01_26_01_Zipcode.Zipcode_VO;

import java.util.List;

interface Member_DAO {
    int insertMember(Member_VO mvo);

    List<Zipcode_VO> selectZipcode(String dong);

    int selectOneUserid(String userid);

    int selectLogin(Member_VO mvo);
}
