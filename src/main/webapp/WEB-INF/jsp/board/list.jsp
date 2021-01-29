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

<fmt:parseNumber var="tp" value="${bdcnt/pp}" integerOnly="true"/>
<c:if test="${(bdcnt%pp) gt 0}">
    <fmt:parseNumber var="tp" value="${tp + 1}"/>
</c:if>

<fmt:parseNumber var="sp" integerOnly="true" value="${((cp-1)/pp)}"/>
<fmt:parseNumber var="sp" value="${sp*10+1}"/>
<fmt:parseNumber var="ep" value="${sp+9}"/>





<div class="main margin30">
    <div class="margin30">
        <h3><i class="bi bi-chat-dots-fill" style="position: relative; top: -3px;"></i>&nbsp;게시판</h3>
        <hr>
    </div>

    <div class="row margin1050">
        <div class="col-12 text-right">
            <c:if test="${not empty UID}">
                <button type="button" id="newbd"
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

                <c:forEach var="b" items="${bds}">
                <tr>
                    <td>${b.bno}</td>
                    <td><a href="/board/view?cp=${cp}&bno=${b.bno}">${b.title}</a></td>
                    <td>${b.userid}</td>
                    <td>${fn: substring(b.regdate,0,10)}</td>
                    <td>${b.thumbs}</td>
                    <td>${b.views}</td>
                </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>

    <div class="row margin1050">
        <div class="col-12">
            <ul class="pagination justify-content-center">
                <li class="page-item <c:if test='${sp lt 10}'> disabled </c:if> ">
                    <a href="/board/list?cp=${sp-10}" class="page-link">이전</a></li>
                <c:forEach var="i" begin="${sp}" end="${ep}" step="1">
                    <c:if test="${i le tp}">
                        <li class="page-item
                            <c:if test="${cp eq i}">active</c:if>">
                            <a href="/board/list?cp=${i}" class="page-link">${i}</a>
                        </li>
                    </c:if>
                </c:forEach>
                <li class="page-item <c:if test='${ep lt tp}'> disabled </c:if> ">
                    <a href="/board/list?cp=${sp+10}" class="page-link">다음</a></li>
            </ul>
        </div>
    </div>
</div>
