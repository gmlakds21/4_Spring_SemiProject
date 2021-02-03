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
<fmt:parseNumber var="pp" value="10"/>

<fmt:parseNumber var="tp" value="${pdcnt/pp}" integerOnly="true"/>
<c:if test="${(pdcnt%pp) gt 0}">
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
    <c:set var="navlink" value="/pds/list?cp=" />
    <c:if test="${not empty param.findKey}">
        <c:set var="navlink"
               value="/pds/find?findType=${param.findType}&findKey=${param.findKey}&cp=">
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

<fmt:parseNumber var="snum" integerOnly="true"
                 value="${pdcnt - (cp-1) * pp}"/>


<div class="main margin30">
    <div class="margin30">
        <h3><i class="bi bi-cloud-download-fill" style="position: relative; top: -3px;"></i>&nbsp;자료실</h3>
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
                <button type="button" id="pdfindbtn" class="btn btn-dark">
                    <i class="bi bi-search"></i>검색</button>
            </div>
        </div>
        <div class="col-4 text-right">
            <c:if test="${not empty UID}">
                <button type="button" id="newpd"
                        class="btn btn-info">
                    <i class="bi bi-plus-circle" style="position: relative; top: -2px;"></i> 글쓰기</button>
            </c:if>
        </div>
    </div>

    <div class="row margin1050">
        <div class="col-12">
            <table class="table table-striped tblines text-center tt">
                <thead style="background: #dff0d8">
                <tr>
                    <th style="width:7%">번호</th>
                    <th>제목</th>
                    <th style="width:12%">작성자</th>
                    <th style="width:10%">작성일</th>
                    <th style="width:7%">추천</th>
                    <th style="width:7%">조회</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th class="text-danger">공지</th>
                    <th><span class="badge badge-danger">Hot</span> 긴급 알림</th>
                    <th>운영자</th>
                    <th>2021.01.15</th>
                    <th>10</th>
                    <th>128</th>
                </tr>

                <c:forEach var="p" items="${pds}">
                <tr>
                    <td>${snum}</td>
                    <td><a href="/pds/view?cp=${cp}&pno=${p.pno}">${p.title}</a></td>
                    <td>${p.userid}</td>
                    <td>${fn: substring(p.regdate,0,10)}</td>
                    <td>${p.thumbs}</td>
                    <td>${p.views}</td>
                </tr>
                <c:set var="snum" value="${snum-1}"/>
                </c:forEach>

                </tbody>
            </table>
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
