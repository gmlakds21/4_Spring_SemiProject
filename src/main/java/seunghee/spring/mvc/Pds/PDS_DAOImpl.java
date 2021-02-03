package seunghee.spring.mvc.Pds;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository ("pdao")
public class PDS_DAOImpl implements PDS_DAO {

    @Autowired private SqlSession sqlSession;

    @Override
    public int insertPds(PDS_VO pvo) {
        return sqlSession.insert("pds.insertPds", pvo);
    }

    @Override
    public List<PDS_VO> selectPds(int snum) {
        return sqlSession.selectList("pds.selectList", snum);
    }

    @Override
    public int selectCountPds() {
        return sqlSession.selectOne("pds.countPds");
    }

    @Override
    public int updateViewCount(String pno) {
        return sqlSession.update("pds.viewCount", pno);
    }

    @Override
    public PDS_VO selectOnePds(String pno) {
        return sqlSession.selectOne("pds.selectOne", pno);
    }

    @Override
    public PDS_VO selectOneFname(String pno, String order) {

        Map<String, String> param = new HashMap<>();
        param.put("pno", pno);
        param.put("order", "fname" + order);

        return sqlSession.selectOne("pds.selectOneFname", param);
    }


}
