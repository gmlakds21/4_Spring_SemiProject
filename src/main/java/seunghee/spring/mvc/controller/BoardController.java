package seunghee.spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import seunghee.spring.mvc.Board.BoardReplyService;
import seunghee.spring.mvc.Board.Board_Service;
import seunghee.spring.mvc.Board.Board_VO;
import seunghee.spring.mvc._01_25_01_Member5.GoogleCaptchaUtil;

@Controller
public class BoardController {

    private Board_Service bsrv;
    private GoogleCaptchaUtil gcutil;
    private BoardReplyService brsrv;

    public BoardController(Board_Service bsrv, GoogleCaptchaUtil gcutil) {
        this.bsrv = bsrv;
        this.gcutil = gcutil;
        // this.brsrv = brsrv;
    }

    @GetMapping("/board/list")
    public ModelAndView list(ModelAndView mv) {

        mv.setViewName("board/list.tiles");
        mv.addObject("bds",bsrv.readBoard());

        return mv;
    }

    @GetMapping("/board/100")
    public String nogada() {

        bsrv.nodaga();

        return "redirect:/board/list";
    }



    @GetMapping("/board/update")
    public String update() {

        return "board/update.tiles";
    }

    @GetMapping("/board/view")
    public ModelAndView view(String bno, ModelAndView mv) {

        mv.setViewName("board/view.tiles");
        mv.addObject("bd", bsrv.readOneBoard(bno));

        return mv;
    }

    @GetMapping("/board/write") // 새글 쓰기 폼
    public String write() {

        return "board/write.tiles";
    }

    @PostMapping("/board/write")
    public String writeok(Board_VO bvo) {

        String returnPage = "redirect:/board/write";

        bvo.setUserid("지현수지");
        if (bsrv.newBoard(bvo))
            returnPage = "redirect:/board/list";

        return returnPage;
    }

}
