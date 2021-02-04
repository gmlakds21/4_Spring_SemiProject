package seunghee.spring.mvc.Pds;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("psrv")
public class PDS_ServiceImpl implements PDS_Service {

    @Autowired private PDS_DAO pdao;

    @Override
    public boolean newPds(Map<String, String> frmdata, PDS_VO pvo) {

        procFormdata(pvo, frmdata);

        boolean isOk = false;
        int cnt = pdao.insertPds(pvo);
        if (cnt > 0) isOk =true;

        return isOk;
    }

    @Override
    public List<PDS_VO> readPds(String cp) {
        int snum = (Integer.parseInt(cp)-1)*10;
        return pdao.selectPds(snum);
    }


    @Override
    public int countPds() {
        return pdao.selectCountPds();
    }



    // 폼데이터를 PDS_VO 에 나눠 담음
    private void procFormdata(PDS_VO p, Map<String, String> frmdata) {
        for ( String key : frmdata.keySet()) { // Map 으로 부터 키를 하나씩 커냄
            String val = frmdata.get(key); // 키에 해당하는 값을 알아냄

            switch (key) {
                case "uuid" : p.setUuid(val); break;
                case "title" : p.setTitle(val); break;
                case "userid" : p.setUserid(val); break;
                case "contents" : p.setContents(val); break;

                case "file1" : p.setFname1(val); break;
                case "file1size" : p.setFsize1(val); break;
                case "file1type" : p.setFtype1(val); break;

                case "file2" : p.setFname2(val); break;
                case "file2size" : p.setFsize2(val); break;
                case "file2type" : p.setFtype2(val); break;

                case "file3" : p.setFname3(val); break;
                case "file3size" : p.setFsize3(val); break;
                case "file3type" : p.setFtype3(val); break;
            }
        }
    }


    @Override
    public PDS_VO readOnePds(String pno) {
        return pdao.selectOnePds(pno);
    }

    @Override
    public boolean viewCountPds(String pno) {

        boolean isOk = false;
        int cnt = pdao.updateViewCount(pno);
        if (cnt > 0) isOk = true;

        return isOk;
    }

    @Override
    public PDS_VO readOneFname(String pno, String order) {

        Map<String, String> param = new HashMap<>();
        param.put("pno", pno);
        param.put("order", "fname" + order);

        return pdao.selectOneFname(param);
    }

    @Override
    public boolean downCountPds(String pno, String order) {

        boolean isOk = false;

        Map<String, String> param = new HashMap<>();
        param.put("pno", pno);
        param.put("order", "fdown" + order);

        int cnt = pdao.updateDownCount(param);
        if (cnt > 0) isOk = true;

        return isOk;
    }


    @Override
    public List<PDS_VO> readPds(String cp, String findType, String findKey) {
        return null;
    }

    @Override
    public int countPds(String findType, String findKey) {
        return 0;
    }

}
