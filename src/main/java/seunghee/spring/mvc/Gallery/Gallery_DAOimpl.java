package seunghee.spring.mvc.Gallery;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("gdao")
public class Gallery_DAOimpl implements Gallery_DAO{

    @Autowired private SqlSession sqlsession;

    @Override
    public int insertGallery(Gallery_VO gvo) {
        sqlsession.insert("gallery.insertGallery", gvo);
        return sqlsession.selectOne("gallery.lastGalleryID");
    }

    @Override
    public List<Gallery_VO> selectGallery(int snum) {
        return sqlsession.selectList("gallery.selectList", snum);
    }

    @Override
    public int selectCountGallery() {
        return sqlsession.selectOne("gallery.countGallery");
    }

    @Override
    public int updateViewCount(String gno) {
        return sqlsession.update("gallery.viewCount", gno);
    }

    @Override
    public Gallery_VO selectOneGallery(String gno) {
        return sqlsession.selectOne("gallery.selectOne", gno);
    }
}
