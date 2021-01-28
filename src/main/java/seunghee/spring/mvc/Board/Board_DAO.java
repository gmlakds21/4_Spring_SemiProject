package seunghee.spring.mvc.Board;

import java.util.List;

public interface Board_DAO {

    int insertBoard(Board_VO bvo);

    List<Board_VO> selectBoard();

    Board_VO selectOneBoard(String bno);

    int updateBoard(Board_VO bvo);

    int deleteBoard(String bno);

    void nogada();
}
