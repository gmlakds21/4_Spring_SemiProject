package seunghee.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import seunghee.spring.mvc.Pds.FileUpDownUtil;
import seunghee.spring.mvc.Pds.PDS_Service;
import seunghee.spring.mvc.Pds.PDS_VO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@Controller
public class PDSController {

    @Autowired private FileUpDownUtil fud;
    @Autowired private PDS_Service psrv;

    @GetMapping("/pds/write")
    public String write(HttpSession sess) {

        String returnPage = "redirect:/index";

        if (sess.getAttribute("UID") != null)
            returnPage = "pds/write.tiles";

        return returnPage;
    }

    // commons File Upload 로 구현한 자료실
    // @PostMapping("/pds/writeok") // 파일 업로드
    // public String writeok(PDS_VO pvo, HttpServletRequest req) {

        // 파일 업로드 리졸버를 이용하지 않은 기존 방식
            // Map<String, String> frmdata = fud.procUpload(req);
            /* 파일 업로드 리졸버를 사용하지 않고 commons FileUpload 를 사용하는 경우
             * pvo 에 폼 데이터가 자동으로 주입되지 않음
             * System.out.println(pvo.getTitle());
             * System.out.println(pvo.getContents());
             */
            // psrv.newPds(frmdata, pvo);
    //    return "redirect:/pds/list?cp=1";
    //}


    // MultipartFile 로 구현한 자료실
    @PostMapping("/pds/writeok") // 파일 업로드
    public String writeok(PDS_VO pvo, MultipartFile[] file) {

             psrv.newPds(file, pvo);
        return "redirect:/pds/list?cp=1";
    }





    @GetMapping("/pds/list")
    public ModelAndView list(ModelAndView mv, String cp) {

        mv.setViewName("pds/list.tiles");
        mv.addObject("pds", psrv.readPds(cp));
        mv.addObject("pdcnt", psrv.countPds());

        return mv;
    }


    //////////////////////////////////////////////////////



    @GetMapping("/pds/view")
    public ModelAndView view(String pno, ModelAndView mv) {

        mv.setViewName("pds/view.tiles");
        mv.addObject("pd", psrv.readOnePds(pno));
//        mv.addObject("rp",psrv.readReply(pno));
        psrv.viewCountPds(pno);

        return mv;
    }


    /* 첨부파일 다운로드하기
     * 파일 다운로드시 보안사항
     * 업로드한 파일들은 웹서버와 동일한 디렉토리에 저장하지 말것!
     * 업로드한 파일을 다운로드할 때 다운로드할 파일 이름이 노출되지 않도록 함
     * 다운르도할 파일이름은 원본 + 식별코드를 이용해서 설정
     * 컨트롤러 메서드에 ResponseBody 어노테이션을 사용함 view 를 이용해서 데이터를 출력하지 않고
     * Http 응답으로 직접 데이터를 브라우져로 출력할 수 있음
     */
    @ResponseBody
    @GetMapping("/pds/down")
    public void pdown(String pno, String order, HttpServletResponse res) {

        try {
            PDS_VO p = psrv.readOneFname(pno, order);
            psrv.downCountPds(pno, order); // 첨부파일 다운수 처리
            fud.procDownloadV2(p.getFname1(), p.getUuid(), res);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //////////////////////////////////////////////
    }
}
