package seunghee.spring.mvc.Pds;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("psrv")
public class PDS_ServiceImpl implements PDS_Service {

    @Autowired private PDS_DAO pdao;
    @Autowired private FileUpDownUtil fud;

    @Override
    public boolean newPds(Map<String, String> frmdata, PDS_VO pvo) {

        procFormdata(pvo, frmdata);

        boolean isOk = false;
        int cnt = pdao.insertPds(pvo);
        if (cnt > 0) isOk =true;

        return isOk;
    }

    // MultipartFile로 구현된 자료실 소스
    @Override
    public boolean newPds(MultipartFile[] file, PDS_VO pvo) {

        boolean isOk = false;
        List<String> files = new ArrayList<>();
        // 파일 업로드시 사용할 UUID 생성
        String uuid = fud.makeUUID();

        for (MultipartFile f : file ) {
            if (!f.getOriginalFilename().isEmpty())
                files.add(fud.procUpload2(f, uuid));
                // 파일 업로드시 앞서 만든 uuid 값을 매개변수로 넘김
                // 업로드한 뒤 결과값은 "파일명/파일크기/파일종류"로 넘어옴
            else
                files.add("_/_/_");
                // 업로드를 하지 못한 경우 "_/_/_" 만 넘김
        }

        System.out.println(files.get(0));

        // 업로드한 파일 정보를 vo로 나눠 저장
        pvo.setFname1(files.get(0).split("[/]")[0]);
        pvo.setFsize1(files.get(0).split("[/]")[1]);
        pvo.setFtype1(files.get(0).split("[/]")[2]);

        pvo.setFname2(files.get(1).split("[/]")[0]);
        pvo.setFsize2(files.get(1).split("[/]")[1]);
        pvo.setFtype2(files.get(1).split("[/]")[2]);

        pvo.setFname3(files.get(2).split("[/]")[0]);
        pvo.setFsize3(files.get(2).split("[/]")[1]);
        pvo.setFtype3(files.get(2).split("[/]")[2]);

        // 위에서 생성한 uuid 를 pvo 에 저장
        pvo.setUuid(uuid);

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
