package seunghee.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import seunghee.spring.mvc.Gallery.Gallery_Service;
import seunghee.spring.mvc.Gallery.Gallery_VO;
import javax.servlet.http.HttpSession;

@Controller
public class GalleryController {

    @Autowired private Gallery_Service gsrv;


    @GetMapping("/gallery/write")
    public String write(HttpSession sess) {

        String returnPage = "redirect:/index";

        if (sess.getAttribute("UID") != null)
            returnPage = "gallery/write.tiles";

        return returnPage;
    }

    /* servlet 파일 업로드 리졸버로 구현한 갤러러
     * 여러개의 이미지 파일을 업로드하는 경우
     * MultipartFile 이라는 객체를 이용하면 편하게 코딩 가능
     * 즉, input type 이 file 인 객체는 MultipartFile 로 가져올 수 있음
     * 그런데, 업로드하는 이미지파일은 총 3개이므로,
     * MultipartFile file1, file2, file3 형태로 코드 작성해야 함 -> 다소 불편
     * 따라서, 이것들을 배열형태로 받아오도록 코드를 개선함
     * => write.jsp 의 file 형식이 input 의 name 을 모두 하나의 이름으로 통일해야 함
     * img 값들이 순서대로 MultipartFile[] img 로 들어감
     */

    @PostMapping("/gallery/writeok")
    public String writeok(Gallery_VO gvo, MultipartFile[] img) {

        gsrv.newGallery(gvo, img);

        return "redirect:/gallery/list?cp=1";
    }

    ///////////////////////////////////////////////////////////////////////////

    @GetMapping("/gallery/list")
    public ModelAndView list(ModelAndView mv, String cp) {

        mv.setViewName("gallery/list.tiles");
        mv.addObject("gals", gsrv.readGallery(cp));
        mv.addObject("galcnt", gsrv.countGallery());

        return mv;
    }

    @GetMapping("/gallery/view")
    public ModelAndView view(ModelAndView mv, String gno) {

        mv.setViewName("gallery/view.tiles");
        mv.addObject("gal", gsrv.readOneGallery(gno));
        gsrv.viewCountGallery(gno);


        return mv;
    }

}
