package seunghee.spring.mvc.Board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("bsrv")
public class Board_ServiceImpl implements Board_Service{

    @Autowired
    private Board_DAO bdao;

    @Override
    public boolean newBoard(Board_VO bvo) {

        boolean isOk = false;

        // 줄바꿈기호를 <br>로 변환작업 필요할 수 도 있음
        // 지금 예제에서는 뷰단에서 변환작업을 수행하도록 작성함

        int cnt = bdao.insertBoard(bvo);
        if (cnt>0) isOk = true;

        return isOk;
    }

    @Override
    public List<Board_VO> readBoard(String cp) {
        int snum = (Integer.parseInt(cp)-1)*10;



        return bdao.selectBoard(snum);
    }

    @Override
    public Board_VO readOneBoard(String bno) {
        return bdao.selectOneBoard(bno);
    }

    @Override
    public boolean modifyBoard(Board_VO bvo) {

        boolean isOk = false;
        int cnt = bdao.updateBoard(bvo);
        if (cnt > 0) isOk = true;
        return isOk;
    }

    @Override
    public boolean removeBoard(String bno) {

        boolean isOk = false;
        int cnt = bdao.deleteBoard(bno);
        if (cnt > 0) isOk = true;
        return isOk;
    }

    // 게시글 총 갯수
    public int countBoard() {
        return bdao.selectcountBoard();
    }

    // 조회수 증가
    @Override
    public boolean viewCountBoard(String bno) {

        boolean isOk = false;
        int cnt = bdao.updateViewCount(bno);
        if (cnt > 0 ) isOk = true;
        return isOk;
    }


    @Override
    public void nodaga() {
        for(int i = 0; i <100; i++) {
            bdao.nogada();
        }
    }
}
