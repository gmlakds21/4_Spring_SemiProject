package seunghee.spring.mvc.Gallery;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("gdao")
public class Gallery_DAOimpl implements Gallery_DAO{

    @Autowired private SqlSession sqlsesion;

    @Override
    public int insertGallery(Gallery_VO gvo) {
        return sqlsesion.insert("gallery.insertGallery", gvo);
    }
}