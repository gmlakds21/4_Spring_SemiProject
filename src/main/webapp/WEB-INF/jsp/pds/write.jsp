<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${empty UID}">
    <c:redirect url="/pds/list?cp=1"/>
</c:if>

<div class="main margin30">
    <div class="margin30">
        <h3><i class="bi bi-cloud-download-fill" style="position: relative; top: -3px;"></i>&nbsp;자료실</h3>
        <hr>
    </div>
    <form id="newpdfrm" class="margin1050">
        <div class="row">
            <div class="col-6">
                <h4><i class="bi bi-plus-circle-fill" style="position: relative; top:-5px"></i> 새글쓰기</h4>
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
                       class="form-control col-9">
            </div>
            <div class="form-group row">
                <div class="col-1"></div>
                <label for="uid"
                       class="col-form-label col-2">작성자</label>
                <input type="text" id="uid" name="userid"
                       class="form-control col-9" readonly value="${UID}">
            </div>
            <div class="form-group row">
                <div class="col-1"></div>
                <label for="contents"
                       class="col-form-label col-2">본문내용</label>
                <textarea type="text" id="contents" name="contents"
                          class="form-control col-9" rows="15"></textarea>
            </div>
            <!-- 파일 첨부 시작 -->
            <div class="form-group row" >
                <label for="file1"
                       class="col-form-label col-2 offset-1">파일 첨부</label>
                <div class="custom-file col-9">
                    <input type="file" id="file1" name="file" class="custom-file-input">
                    <label class="custom-file-label"> 첨부할 파일을 선택하세요 </label>
                </div>
                <div class="custom-file col-9 offset-3">
                    <input type="file" id="file2" name="file" class="custom-file-input">
                    <label class="custom-file-label"> 첨부할 파일을 선택하세요 </label>
                </div>
                <div class="custom-file col-9 offset-3">
                    <input type="file" id="file3" name="file" class="custom-file-input">
                    <label class="custom-file-label"> 첨부할 파일을 선택하세요 </label>
                </div>
            </div>
            <!-- 파일 첨부 끝 -->
            <div class="row">
                <div class="col-1"></div>
                <label class="col-2">자동가입방지</label>
                <img src="/image/google_recaptcha.gif"
                     width=50%" height="66%" style="margin-left: -5px; margin-top: -5px">
            </div>
        </div>
        <div class="row">
            <div class="col-12 text-center">
                <button type="button" id="newpdbtn"
                        class="btn btn-primary">
                    <i class="bi bi-check"></i> 입력완료</button>
                <button type="button" id="cancelbtn"
                        class="btn btn-danger">
                    <i class="bi bi-x"></i> 취소하기</button>
            </div>
        </div>
    </form>
</div>