package seunghee.spring.mvc.Reply;

import java.util.List;

public interface Reply_DAO {

    List<Reply_VO> selectReply(String bno);

    int insertReply(Reply_VO rvo);
}
