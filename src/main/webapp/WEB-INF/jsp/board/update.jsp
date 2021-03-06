<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${empty UID}">
    <c:redirect url="/board/list?cp=1"/>
</c:if>

<div class="main margin30">
    <div class="margin30">
        <h3><i class="bi bi-chat-dots-fill" style="position: relative; top: -3px;"></i>&nbsp;게시판</h3>
        <hr>
    </div>
    <form id="upbdfrm" class="margin1050">
        <div class="row">
            <div class="col-6">
                <h4><i class="bi bi-pencil-square" style="position: relative; top:-5px"></i> 수정하기</h4>
            </div>
            <div class="col-6 text-right">
                <button type="button" id="listbdbtn"
                        class="btn btn-light">
                    <i class="bi bi-card-list" style="position: relative; top:-3px"></i> 목록으로</button>
            </div>
        </div>
        <div class="card card-body bg-light">
            <div class="form-group row">
                <div class="col-1"></div>
                <label for="title"
                       class="col-form-label col-2">제목</label>
                <input type="text" id="title" name="title"
                       class="form-control col-9" value="${bd.title}">
            </div>
            <div class="form-group row">
                <div class="col-1"></div>
                <label for="uid"
                       class="col-form-label col-2">작성자</label>
                <input type="text" id="uid" name="userid"
                       class="form-control col-9" value="${bd.userid}" readonly>
            </div>
            <div class="form-group row">
                <div class="col-1"></div>
                <label for="contents"
                       class="col-form-label col-2">본문내용</label>
                <textarea type="text" id="contents" name="contents"
                          class="form-control col-9" rows="15">${bd.contents}</textarea>
            </div>

            <input type="hidden" name="bno" value="${param.bno}">
            <input type="hidden" name="cp" value="${param.cp}">

            <div class="row">
                <div class="col-1"></div>
                <label class="col-2">자동가입방지</label>
                <img src="/image/google_recaptcha.gif"
                     width=50%" height="66%" style="margin-left: -5px; margin-top: -5px">
            </div>
        </div>
        <div class="row">
            <div class="col-12 text-center">
                <button type="button" id="upbdokbtn"
                        class="btn btn-primary">
                    <i class="bi bi-check"></i> 수정완료</button>
                <button type="button" id="ccupbdbtn"
                        class="btn btn-danger">
                    <i class="bi bi-x"></i> 취소하기</button>
            </div>
        </div>
    </form>

</div>