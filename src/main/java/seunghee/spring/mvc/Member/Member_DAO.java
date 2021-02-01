package seunghee.spring.mvc.Member;

import java.util.List;

interface Member_DAO {
    int insertMember(Member_VO mvo);

    List<Zipcode_VO> selectZipcode(String dong);

    int selectOneUserid(String userid);

    int selectLogin(Member_VO mvo);
}
