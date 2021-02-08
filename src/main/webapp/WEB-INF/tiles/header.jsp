<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<header class="row">
    <div class="col-7">
        <h1>Lorem Ipsum</h1>
    </div>
    <div class="col-5 text-right">
        <!-- 세션변수 UID 에 값이 존재하지 않는다면, 로그인 안했다면 -->
        <c:if test="${empty UID}">
        <h1>
            <button type="button" class="btn btn-danger"
                    data-toggle="modal" data-target="#loginmodal">로그인</button>
            <button type="button" id="join2btn" class="btn btn-primary">회원가입</button>
        </h1>
        </c:if>
        <c:if test="${not empty UID}">
        <h1>
            <button type="button" id="logoutbtn" class="btn btn-dark">로그아웃</button>
        </h1>
        </c:if>
    </div>
</header>

<nav class="nav navbar-expand navbar-dark bg-dark">
    <ul class="nav navbar-nav nav-fill w-100">
        <li class="nav-item"><a class="nav-link" href="/intro">프로젝트 소개</a></li>
        <c:if test="${empty UID}">
        <li class="nav-item"><a class="nav-link" href="/join/agree">회원 가입</a></li>
        </c:if>
        <c:if test="${not empty UID}">
        <li class="nav-item"><a class="nav-link disabled">회원 가입</a></li>
        </c:if>
        <li class="nav-item"><a class="nav-link" href="/board/list?cp=1">게시판</a></li>
        <li class="nav-item"><a class="nav-link" href="/pds/list?cp=1">자료실</a></li>
        <li class="nav-item"><a class="nav-link" href="/gallery/list?cp=1">갤러리</a></li>
        <li class="nav-item"><a class="nav-link" href="/admin">관리자</a></li>
    </ul>
</nav>
