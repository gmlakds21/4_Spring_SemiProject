package seunghee.spring.mvc.Reply;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("brdao")
public class Reply_DAOImpl implements Reply_DAO {

    @Autowired private SqlSession sqlSession;

    @Override
    public List<Reply_VO> selectReply(String bno) {
        return sqlSession.selectList("reply.selectReply", bno);
    }

    @Override
    public int insertReply(Reply_VO rvo) {

        rvo.setCno(selectLastRno());
        return sqlSession.insert("reply.insertReply", rvo);
    }

    public String selectLastRno() {
        return sqlSession.selectOne("reply.lastRno");
    }
}
