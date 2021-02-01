package seunghee.spring.mvc.Member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

        return sqlSession.selectOne("member.checkLogin", mvo);
    }

}
