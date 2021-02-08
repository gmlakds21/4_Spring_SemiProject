package seunghee.spring.mvc.Gallery;

import java.util.List;

public interface Gallery_DAO {

    int insertGallery(Gallery_VO gvo);

    List<Gallery_VO> selectGallery(int snum);

    int selectCountGallery();

    int updateViewCount(String gno);

    Gallery_VO selectOneGallery(String gno);
}
