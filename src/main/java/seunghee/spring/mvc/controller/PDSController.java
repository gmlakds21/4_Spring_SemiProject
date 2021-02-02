package seunghee.spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import seunghee.spring.mvc.Pds.FileUpDownUtil;
import seunghee.spring.mvc.Pds.PDS_VO;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class PDSController {

    @GetMapping("/pds/list")
    public String list() {

        return "pds/list.tiles";
    }

    @GetMapping("/pds/write")
    public String write( ) {

        return "pds/write.tiles";
    }

    @PostMapping("/pds/writeok") // 파일 업로드
    public String writeok(PDS_VO pvo, HttpServletRequest req) {

        FileUpDownUtil fud = new FileUpDownUtil();
        Map<String, String> frmdata = fud.procUpload(req);

        // 임시로 찍음
        System.out.println(pvo.getTitle());
        System.out.println(frmdata.get("title"));
        System.out.println(frmdata.get("contents"));
        System.out.println(frmdata.get("file1"));
        System.out.println(frmdata.get("file1size"));
        System.out.println(frmdata.get("file1type"));

        return "redirect:/pds/list?cp=1";
    }















}
