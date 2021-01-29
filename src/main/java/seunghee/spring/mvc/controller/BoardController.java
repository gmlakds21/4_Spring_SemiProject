package seunghee.spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import seunghee.spring.mvc.Board.BoardReplyService;
import seunghee.spring.mvc.Board.Board_Service;
import seunghee.spring.mvc.Board.Board_VO;
import seunghee.spring.mvc._01_25_01_Member5.GoogleCaptchaUtil;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

        mv.setViewName("board/list.tiles");
        mv.addObject("bds",bsrv.readBoard(cp));
        mv.addObject("bdcnt",bsrv.countBoard()); // 하단 navbar 출력용

        return mv;
    }



    @GetMapping("/board/view")
    public ModelAndView view(String bno, ModelAndView mv) {

        mv.setViewName("board/view.tiles");
        mv.addObject("bd", bsrv.readOneBoard(bno));
        bsrv.viewCountBoard(bno);

        return mv;
    }


    @GetMapping("/board/delete")
    public String delete(String bno, String cp, HttpSession sess, String userid) {

        if(sess.getAttribute("UID").equals(userid))
            bsrv.removeBoard(bno);

        return "redirect:/board/list?cp="+ cp;
    }




    @GetMapping("/board/write") // 새글 쓰기 폼
    public String write(HttpSession sess) {

        String returnPage = "redirect:/index";

        if (sess.getAttribute("UID") != null)
            returnPage = "board/write.tiles";

        return returnPage;
    }

    @PostMapping("/board/write")
    public String writeok(Board_VO bvo, HttpSession sess) {

        String returnPage = "redirect:/board/write";

        if (sess.getAttribute("UID") != null && bsrv.newBoard(bvo))
            returnPage = "redirect:/board/list?cp=1";

        return returnPage;
    }


    @GetMapping("/board/update") // 수정하기 폼
    public ModelAndView update(String bno, ModelAndView mv, HttpSession sess) {

        if(sess.getAttribute("UID") != null && bno != null) {
            mv.setViewName("board/update.tiles");
            mv.addObject("bd", bsrv.readOneBoard(bno));
        } else {
            mv.setViewName("redirect:/index");
        }


        return mv;
    }

    @PostMapping("/board/update") // 수정하기 완료
    public String updateok(Board_VO bvo, String cp, HttpSession sess) {

        String returnPage = "redirect:/board/update?cp="+cp+"&bno="+bvo.getBno();

        if(sess.getAttribute("UID").equals(bvo.getUserid()) && (bsrv.modifyBoard(bvo))) {
            returnPage = "redirect:/board/view?cp="+cp+"&bno="+bvo.getBno();
        }

        return returnPage;
    }



    @GetMapping("/board/100")
    public String nogada() {

        bsrv.nodaga();

        return "redirect:/board/list?cp=1";
    }
}
