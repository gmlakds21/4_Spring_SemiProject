package seunghee.spring.mvc.Pds;

import java.util.List;
import java.util.Map;

public interface PDS_DAO {

    int insertPds(PDS_VO pvo);

    List<PDS_VO> selectPds(int snum);

    int selectCountPds();

    int updateViewCount(String pno);

    PDS_VO selectOnePds(String pno);

    PDS_VO selectOneFname(Map param);

    int updateDownCount(Map param);
}
