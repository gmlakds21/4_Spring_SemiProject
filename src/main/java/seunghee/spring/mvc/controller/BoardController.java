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

    /* 게시판 목록 처리 1 : 페이징
     * ex)
     * counts - 총 게시글 수 : 101 개
     * perpage - 페이지당 출력 게시글 수 : 10
     * pages - 총 페이지 수? : 11개
     * pages = counts / perpage
     *
     * 1page 에 출력할 게시물의 범위
     * count-(page-1)*10 ~ count-(page*10)+1
     * SQL : select bno from Board limit startnum, perpage
     */

    /* 게시판 목록 처러 2 : 검색 처리
     *
     */
    @GetMapping("/board/list")
    public ModelAndView list(ModelAndView mv, String cp) {

        if ( cp == null) cp = "1";

        mv.setViewName("board/list.tiles");
        mv.addObject("bds",bsrv.readBoard(cp));
        mv.addObject("bdcnt",bsrv.countBoard()); // 하단 navbar 출력용

        return mv;
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





    @GetMapping("/board/100")
    public String nogada() {

        bsrv.nodaga();

        return "redirect:/board/list";
    }
}
