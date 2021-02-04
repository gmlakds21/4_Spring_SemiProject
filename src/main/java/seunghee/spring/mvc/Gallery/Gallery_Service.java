package seunghee.spring.mvc.Gallery;

import org.springframework.web.multipart.MultipartFile;

public interface Gallery_Service {


    boolean newGallery(Gallery_VO gvo, MultipartFile[] img);
}
