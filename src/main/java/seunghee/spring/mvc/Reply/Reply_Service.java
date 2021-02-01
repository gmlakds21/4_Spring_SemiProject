package seunghee.spring.mvc.Reply;

import java.util.List;

public interface Reply_Service {
    List<Reply_VO> readReply(String bno);

    boolean newReply(Reply_VO rvo);
}
