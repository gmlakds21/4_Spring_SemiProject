package seunghee.spring.mvc.Gallery;

import org.apache.commons.io.FileUtils;
import org.imgscalr.Scalr;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.PosixFilePermission;
import java.nio.file.attribute.PosixFilePermissions;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

@Component("imgutil")
public class ImageUploadUtil {

    // 이미지 업로드 경로 설정
    // private String IMG_UPLOAD_PATH = "C:/JAVA/nginx-1.19.6/html/cdn/galupload/";
    private String IMG_UPLOAD_PATH = "/home/centos/imgupload/";

    // 갤러리에 이미지 첨부시 파일 존재 여부 확인
    public boolean checkGalleryFiles(MultipartFile[] img) {
        boolean isFiles = false;

        for(MultipartFile f : img) {
            // 첨부시 파일이름이 존재한다면
            if (!f.getOriginalFilename().isEmpty()) {
                isFiles = true;
                break;
            }
        }

        return isFiles;
    }

    // 업로드한 이미지들 중 첫번째 이미지에 대한 썸내일 생성
    public void imageCropResize(String fname, String id) {
        // 서버에 업로드된 파일이름 (썸내일 대상)
        String ofname = IMG_UPLOAD_PATH + fname;
        // 업로드된 파일이름에서 확장자 부분 추출
        String imgtype = fname.substring(fname.lastIndexOf(".")+1);
        // 썸내일 이미지 이름 설정
        String tfname = IMG_UPLOAD_PATH + "_thumb/small_"
                + id + "_" + fname;

        try {
            // 원본이미지를 읽어서 메모리상에 이미지 객체(갠버스)로 만들어 둠
            BufferedImage image = ImageIO.read(new File(ofname));

            int imgwidth = Math.min(image.getHeight(), image.getWidth());
            int imgheight = imgwidth;

            // 지정한 위치를 기준으로 잘라냄
            BufferedImage scaledImg = Scalr.crop( image,
                    (image.getWidth() - imgwidth) / 2,
                    (image.getHeight() - imgheight) / 2,
                    imgwidth, imgheight, null );

            // 잘라낸 이미지를 230x200으로 재조정
            BufferedImage resizedImg = Scalr.resize(
                    scaledImg, 220, 220, null);

            // 재조정한 이미지를 실제경로에 저장함
            ImageIO.write(resizedImg, imgtype, new File(tfname));

            // linux
            // 업로드한 파일의 퍼미션을 설정 (읽고 쓰고 수정)
            // 즉, 업로드한 파일의 권한을 755로 설정
            // read : 4, write : 2, execute : 1
            String perms = "rwxr-xr-x";
            Path img = Paths.get(tfname);
            Set<PosixFilePermission> pfp = PosixFilePermissions.fromString(perms);
            Files.setPosixFilePermissions(img, pfp);

        } catch (Exception ex) {
            ex.printStackTrace();
        }


    }

    // 겹치치 않는 파일명을 위해 유니크한 임의의 값 생성
    private String makeUUID() {
        String fmt = "yyyyMMddHHmmss";
        SimpleDateFormat sdf = new SimpleDateFormat(fmt);

        return sdf.format(new Date());
    }

    // 이미지 파일 업로드
    public String ImageUpload(MultipartFile mf) {
        // 업로드시 첨부파일의 원래 이름
        String ofname = mf.getOriginalFilename();
        // 업로드한 파일을 서버에 저장할때 사용할
        // 수정된 파일 이름
        String nfname = makeUUID() + "_" + ofname;

        try {
            // 업로드한 이미지는 웹 서버의 임시 폴더에 저장됨
            // 이것을 원하는 위치에 다시 옮기기위해 transferTo 메서드를 사용

             mf.transferTo(new File(IMG_UPLOAD_PATH + nfname));

            // linux
            // 업로드한 파일의 퍼미션을 설정 (읽고 쓰고 수정)
            // 즉, 업로드한 파일의 권한을 755로 설정
            // read : 4, write : 2, execute : 1
            String perms = "rwxr-xr-x";
            Path img = Paths.get(IMG_UPLOAD_PATH + nfname);
            Set<PosixFilePermission> pfp = PosixFilePermissions.fromString(perms);
            Files.setPosixFilePermissions(img, pfp);


        } catch (Exception ex) {
            ex.printStackTrace();
        }

        // 업로드한 파일명과 파일크기를 리턴함
        return nfname + "/" + (mf.getSize()/1024);
    }
}
