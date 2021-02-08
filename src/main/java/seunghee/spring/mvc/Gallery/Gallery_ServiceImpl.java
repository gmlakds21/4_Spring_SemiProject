package seunghee.spring.mvc.Gallery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Service("gsrv")
public class Gallery_ServiceImpl implements Gallery_Service{

    @Autowired private Gallery_DAO gdao;
    @Autowired private ImageUploadUtil imgutil;


    // 업로드 이미지 처리후 디비에 저장
    @Override
    public boolean newGallery(Gallery_VO gvo, MultipartFile[] img) {

        boolean isOk = false;


        // 첨부파일이 존재한다면
        if (imgutil.checkGalleryFiles(img)) {

            // 업로드한 이미지파일명을 저장하기 위해 동적배열 생성
            String fnames = "";
            String fsizes = "";

            // 첨부파일이 존재한다면 서버에 저장하고
            // 그 결과로 파일이름을 받아서 동적배열에 저장
            for (MultipartFile f : img) {
                if (!f.getOriginalFilename().isEmpty()) {
                    fnames += imgutil.ImageUpload(f).split ("[/]")[0] + "/";
                    fsizes += imgutil.ImageUpload(f).split ("[/]")[1] + "/";
                    // 업로드 결과값은 "파일명/사이즈"로 넘어옴
                } else {
                    fnames += "_/";
                    fsizes += "_/";
                }

            }
            gvo.setFnames( fnames );
            gvo.setFsizes( fsizes );
        }

        // 업로드한 이미지 정보를 테이블 저장
        int id = gdao.insertGallery( gvo );
        if (id > 0)
            isOk = true;

        // 업로드한 이미지들 중 첫 번째 이미지를 썸네일 이미지로 만듦
        imgutil.imageCropResize(gvo.getFnames().split("[/]")[0], id+"");

        return isOk;
    }

    ////////////////////////////////////////////////////////

    @Override
    public List<Gallery_VO> readGallery(String cp) {

        int snum = (Integer.parseInt(cp)-1)*24;

        return gdao.selectGallery(snum);
    }

    @Override
    public int countGallery() {
        return gdao.selectCountGallery();
    }

    @Override
    public boolean viewCountGallery(String gno) {

        boolean isOk = false;
        int cnt = gdao.updateViewCount(gno);
        if (cnt > 0) isOk = true;

        return isOk;
    }

    @Override
    public Gallery_VO readOneGallery(String gno) {
        return gdao.selectOneGallery(gno);
    }


}
