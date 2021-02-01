package seunghee.spring.mvc.Reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("brsrv")
public class Reply_ServiceImpl implements Reply_Service {

    @Autowired private Reply_DAO brdao;

    @Override
    public List<Reply_VO> readReply(String bno) {
        return brdao.selectReply(bno);
    }

    @Override
    public boolean newReply(Reply_VO rvo) {

        boolean isOk = false;
        int cnt = brdao.insertReply(rvo);
        if (cnt > 0) isOk = true;
        return isOk;
    }
}
