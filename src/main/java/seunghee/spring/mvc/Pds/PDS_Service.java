package seunghee.spring.mvc.Pds;

import java.util.List;
import java.util.Map;

public interface PDS_Service {

    boolean newPds(Map<String, String> frmdata, PDS_VO pvo);

    List<PDS_VO> readPds(String cp);
    List<PDS_VO> readPds(String cp, String findType, String findKey);

    int countPds();
    int countPds(String findType, String findKey);

    PDS_VO readOnePds(String pno);

    boolean viewCountPds(String pno);

    PDS_VO readOneFname(String pno, String order);

    boolean downCountPds(String pno, String order);
}
