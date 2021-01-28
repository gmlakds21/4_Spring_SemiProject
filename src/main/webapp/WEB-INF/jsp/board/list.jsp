<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<div class="main margin30">
    <div class="margin30">
        <h3><i class="bi bi-chat-dots-fill" style="position: relative; top: -3px;"></i>&nbsp;게시판</h3>
        <hr>
    </div>

    <div class="row margin1050">
        <div class="col-12 text-right">
            <button type="button" id="newbd"
                    class="btn btn-info">
                <i class="bi bi-plus-circle" style="position: relative; top: -2px;"></i> 글쓰기</button>

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
                    <td><a href="/board/view?bno=${b.bno}">${b.title}</a></td>
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
                <li class="page-item disabled"><a href="#" class="page-link">이전</a></li>
                <li class="page-item active"><a href="#" class="page-link">1</a></li>
                <li class="page-item"><a href="#" class="page-link">2</a></li>
                <li class="page-item"><a href="#" class="page-link">3</a></li>
                <li class="page-item"><a href="#" class="page-link">4</a></li>
                <li class="page-item"><a href="#" class="page-link">5</a></li>
                <li class="page-item"><a href="#" class="page-link">6</a></li>
                <li class="page-item"><a href="#" class="page-link">7</a></li>
                <li class="page-item"><a href="#" class="page-link">8</a></li>
                <li class="page-item"><a href="#" class="page-link">9</a></li>
                <li class="page-item"><a href="#" class="page-link">10</a></li>
                <li class="page-item"><a href="#" class="page-link">다음</a></li>

            </ul>
        </div>
    </div>
</div>
