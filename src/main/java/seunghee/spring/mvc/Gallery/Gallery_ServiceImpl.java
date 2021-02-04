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
            List<String> imgs = new ArrayList<>();

            // 첨부파일이 존재한다면 서버에 저장하고
            // 그 결과로 파일이름을 받아서 동적배열에 저장
            for (MultipartFile f : img) {
                if (!f.getOriginalFilename().isEmpty())
                    imgs.add(imgutil.ImageUpload(f));
                    // 업로드 결과값은 "파일명/사이즈"로 넘어옴
                else
                    imgs.add("_/_");
            }

            String fnames = "";
            String fsizes = "";
            for( int i = 0; i < imgs.size(); i++ ) {
                fnames += imgs.get(i).split("[/]")[0] + "/";
                fsizes += imgs.get(i).split("[/]")[1] + "/";
            }

            gvo.setFnames( fnames );
            gvo.setFsizes( fsizes );
        }

        int cnt = gdao.insertGallery( gvo );
        if( cnt > 0 )
            isOk = true;

        return isOk;
    }



}
