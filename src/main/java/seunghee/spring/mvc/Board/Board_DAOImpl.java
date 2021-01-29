package seunghee.spring.mvc.Board;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("bdao")
public class Board_DAOImpl implements Board_DAO
{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public int insertBoard(Board_VO bvo) {
        return sqlSession.insert("board.insertBoard", bvo);
    }

    @Override
    public List<Board_VO> selectBoard(int snum) {
        return sqlSession.selectList("board.selectList", snum);
    }

    @Override
    public Board_VO selectOneBoard(String bno) {
        return sqlSession.selectOne("board.selectOne",bno);
    }

    @Override
    public int updateBoard(Board_VO bvo) {
        return sqlSession.update("board.updateBoard", bvo);
    }

    @Override
    public int deleteBoard(String bno) {
        return sqlSession.delete("board.deleteBoard", bno);
    }

    @Override
    public void nogada() {
        sqlSession.insert("board.nogada");
    }

    @Override
    public int selectcountBoard() {
        return sqlSession.selectOne("board.countBoard");
    }

    @Override
    public int updateViewCount(String bno) {
        return sqlSession.update("board.viewCount", bno);
    }

}
