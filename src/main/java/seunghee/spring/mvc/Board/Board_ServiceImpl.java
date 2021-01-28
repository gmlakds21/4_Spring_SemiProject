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
    public Board_VO readOneBoard(String bno) { return bdao.selectOneBoard(bno); }

    @Override
    public String modifyBoard(Board_VO bvo) {
        return null;
    }

    @Override
    public String deleteBoard(String bno) {
        return null;
    }

    // 게시글 총 갯수
    public int countBoard() {
        return bdao.selectcountBoard();
    }




    @Override
    public void nodaga() {
        for(int i = 0; i <100; i++) {
            bdao.nogada();
        }
    }
}
