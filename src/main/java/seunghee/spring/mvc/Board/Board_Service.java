package seunghee.spring.mvc.Board;

import java.util.List;

public interface Board_Service {

    boolean newBoard(Board_VO bvo);

    List<Board_VO> readBoard(String cp);

    Board_VO readOneBoard(String bno);

    boolean modifyBoard(Board_VO bvo);

    boolean removeBoard(String bno);

    void nodaga();

    int countBoard();

    boolean viewCountBoard(String bno);
}
