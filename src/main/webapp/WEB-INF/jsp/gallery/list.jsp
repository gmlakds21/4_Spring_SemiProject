<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!--
    게시판 네비게이션
    현재 페이지에 따라 보여줄 페이지 블록을 결정

    startPage : ((floor(cp-1)/10)*10)+1
    endPage : startPage + 9

    integerOnly => 정수값만을 계산한다
-->
<fmt:parseNumber var="cp" value="${param.cp}"/>
<fmt:parseNumber var="pp" value="24"/>

<fmt:parseNumber var="tp" value="${galcnt/pp}" integerOnly="true"/>
<c:if test="${(galcnt%pp) gt 0}">
    <fmt:parseNumber var="tp" value="${tp + 1}"/>
</c:if>

<fmt:parseNumber var="sp" integerOnly="true" value="${((cp-1)/pp)}"/>
<fmt:parseNumber var="sp" value="${sp*10+1}"/>
<fmt:parseNumber var="ep" value="${sp+9}"/>

<%--
    검색여부에 따라 네비게이션 출력을 다르게 함
    일반 목록 출력 : /board/view?cp=
    검색후 목록 출력 : /board/find?findtype=???&findkey=???&cp=??
--%>
    <c:set var="navlink" value="/gallery/list?cp=" />
    <c:if test="${not empty param.findKey}">
        <c:set var="navlink"
               value="/gallery/find?findType=${param.findType}&findKey=${param.findKey}&cp=">
        </c:set>
    </c:if>

<%--
    글번호 재 조정
    총 게시물 수 : 150, 페이지당 게시물 수 : 10
    page 1 : 150 ~ 141
    page 2 : 140 ~ 131
    page 3 : 130 ~ 121
    ...
    page n : {total - (n-1)*10} ~ {total -n*10 +1}
--%>

<%-- 게시판, 자료실과는 달리 갤러리의 페이지당 게시물 수는 10이 아닌 4의 배수로 지정 --%>

<fmt:parseNumber var="snum" integerOnly="true"
                 value="${galcnt - (cp-1) * pp}"/>

<%-- 이미지 출력을 위한 기본 주소 설정 --%>
<%--<c:set var="baseImgURL" value="http://localhost/cdn/galupload"/>--%>
<%--<c:set var="thumbURL" value="${baseImgURL}/_thumb/small_"/>--%>

<%-- 이미지 출력을 위한 기본 주소 설정 AWS 용 --%>
<c:set var="baseImgURL" value="http://15.165.161.209:7732/cdn"/>
<c:set var="thumbURL" value="${baseImgURL}/_thumb/small_"/>


<%--
    bootstrap 의 card image 사용시
    card 박스의 크기는 240px (15rem)
    따라서, 썸네일 이미지의 크기는 220 x 220 px 로 설정
    1920 x 1080 해상도에서는 card 박스는 한 행에 기본적으로 4개씩 배치할 수 있음
    단, 작성자와 작성일 사이 간격이 좁아 작성일이 아이디 아래에 출력되는 경우가 있음
    => 해결책은 아이디 출력시 길이가 길면 말 줄임으로 단축 출력하면 됨
--%>


<div class="main margin30">
    <div class="margin30">
        <h3><i class="bi bi-cloud-download-fill" style="position: relative; top: -3px;"></i>&nbsp;갤러리</h3>
        <hr>
    </div>

    <div class="row margin1050">
        <div class="col-8">
            <div class="form-group row">
                <select name="findType" id="findType" class="form-control col-4">
                    <option value="title">제목</option>
                    <option value="ticon">제목 + 내용</option>
                    <option value="contents">내용</option>
                    <option value="userid">작성자</option>
                </select>&nbsp;
                <input type="text" name="findKey" id="findKey" class="form-control col-5">&nbsp;
                <button type="button" id="galfindbtn" class="btn btn-dark">
                    <i class="bi bi-search"></i>검색</button>
            </div>
        </div>
        <div class="col-4 text-right">
            <c:if test="${not empty UID}">
                <button type="button" id="newgal"
                        class="btn btn-info">
                    <i class="bi bi-plus-circle" style="position: relative; top: -2px;"></i> 글쓰기</button>
            </c:if>
        </div>
    </div>

    <div class="row margin1050">
        <div class="col-12">
            <ul class="list-inline">
                <c:forEach var="g" items="${gals}">
                    <li class="list-inline-item" style="margin-bottom: 10px">
                        <div class="card" style="width: 235px;">
                            <img src="${thumbURL}${g.gno}_${fn:split(g.fnames,"[/]")[0]}" class="card-img-top" alt=""
                                width="220" height="220"
                                 onclick="javascript:showing('${g.gno}')"
                                 style=" cursor: pointer"
                            >
                            <div class="card-body">
                                <h5 class="card-title">${g.title}</h5>
                                <p class="card-text">
                                    <span style="float: left"> ${g.userid}</span>
                                    <span style="float: right"> ${fn:substring(g.regdate,2,10)}</span>
                                </p>
                                <p class="card-text" style="clear: both">
                                    <span style="float: left">
                                        <i class="bi bi-eye"></i>&nbsp;${g.views}
                                    </span>
                                    <span style="float: right">
                                        <i class="bi bi-hand-thumbs-up"></i>&nbsp;${g.thumbs}
                                    </span>
                                </p>
                                <a href="#" style="clear: both" class="btn btn-primary">Go somewhere</a>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <div class="row margin1050">
        <div class="col-12">
            <ul class="pagination justify-content-center">
                <li class="page-item <c:if test='${sp lt 10}'> disabled </c:if> ">
                    <a href="${navlink}${sp-10}" class="page-link">이전</a></li>
                <c:forEach var="i" begin="${sp}" end="${ep}" step="1">
                    <c:if test="${i le tp}">
                        <li class="page-item
                            <c:if test="${cp eq i}">active</c:if>">
                            <a href="${navlink}${i}" class="page-link">${i}</a>
                        </li>
                    </c:if>
                </c:forEach>
                <li class="page-item <c:if test='${ep gt tp}'> disabled </c:if> ">
                    <a href="${navlink}${sp+10}" class="page-link">다음</a></li>
            </ul>
        </div>
    </div>
</div>
