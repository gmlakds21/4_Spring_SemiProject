package seunghee.spring.mvc._01_25_01_Member5;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import seunghee.spring.mvc._01_26_01_Zipcode.Zipcode_VO;

import java.util.List;

@Repository("mdao")
public class Member_DAOimpl implements Member_DAO {

    @Autowired
    private SqlSession sqlSession;

    @Override // 회원정보 추가
    public int insertMember(Member_VO mvo) {
        return sqlSession.insert("member.insertMember",mvo);
    }

    @Override // 우편번호 조회
    public List<Zipcode_VO> selectZipcode(String dong) {

        return sqlSession.selectList("member.zipcode", dong);
    }

    @Override
    public int selectOneUserid(String uid) {
        return sqlSession.selectOne("member.checkUserid", uid);
    }

    @Override
    public int selectLogin(Member_VO mvo) {

        return sqlSession.selectOne("member.checkLogin",mvo);
    }

}
