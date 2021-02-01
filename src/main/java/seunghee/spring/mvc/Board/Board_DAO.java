package seunghee.spring.mvc.Board;

import java.util.List;
import java.util.Map;

public interface Board_DAO {

    int insertBoard(Board_VO bvo);

    List<Board_VO> selectBoard(int snum);

    Board_VO selectOneBoard(String bno);

    int updateBoard(Board_VO bvo);

    int deleteBoard(String bno);

    void nogada();

    int selectcountBoard();

    int updateViewCount(String bno);

    List<Board_VO> findselectBoard(Map<String, Object> param);


    int findcountBoard(Map<String, String> param);

}
