package seunghee.spring.mvc.Board;

import java.util.List;

public interface Board_Service {

    boolean newBoard(Board_VO bvo);

    List<Board_VO> readBoard();

    Board_VO readOneBoard(String bno);

    String modifyBoard(Board_VO bvo);

    String deleteBoard(String bno);

    void nodaga();
}
