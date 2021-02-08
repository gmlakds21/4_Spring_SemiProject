package seunghee.spring.mvc.Gallery;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface Gallery_Service {


    boolean newGallery(Gallery_VO gvo, MultipartFile[] img);

    List<Gallery_VO> readGallery(String cp);

    int countGallery();

    boolean viewCountGallery(String gno);

    Gallery_VO readOneGallery(String gno);
}
