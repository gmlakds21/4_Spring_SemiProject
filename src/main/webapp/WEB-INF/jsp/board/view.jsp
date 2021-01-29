<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%--
    변수 선언
    String newChar = "블라블라";
    <c:set var="newChar" value="블라블라" scope="page"/>

    사용기간 (Scope)
        page        : 현재 페이지 내에서만 객체 사용
        request     : 이전 페이지(폼)에서 생성한 객체를 현재페이지(처리)에 요청을 통해 사용
        Session     : 동일 브라우저 내에서 공유할 수 있는 객체
        application : 어플리케이션 내에서 공유할 수 있는 객체체
--%>

<c:set var="newChar" value="
" scope="page" />

<div class="main margin30">
    <div class="margin30">
        <h3><i class="bi bi-chat-dots-fill" style="position: relative; top: -3px;"></i>&nbsp;게시판</h3>
        <hr>
    </div>

    <div class="margin1050">
        <div class="row ">
            <div class="col-6">
                <button type="button" id="prevbtn"
                        class="btn btn-light">
                    <i class="bi bi-chevron-left" style="position: relative; top:-3px"></i>
                    이전게시물</button>
                <button type="button" id="nextvbtn"
                        class="btn btn-light">
                    <i class="bi bi-chevron-right" style="position: relative; top:-3px"></i>
                    다음게시물</button>
            </div>
            <div class="col-6 text-right">
                <c:if test="${not empty UID}">
                    <button type="button" id="newbd"
                            class="btn btn-light">
                        <i class="bi bi-plus-circle-fill" style="position: relative; top:-3px"></i>
                        새글쓰기</button>
                </c:if>
            </div>
        </div>
        <div class="row">
            <table class="table">
                <tr class="tblines2" style="background: #dff0f8">
                    <th colspan="2" class="text-center"><h1>${bd.title}</h1></th>
                </tr>
                <tr style="background: #ccff99">
                    <td class="text-left"><h4>${bd.userid}</h4></td>
                    <td class="text-right"><b>${bd.regdate}</b> / ${bd.thumbs} / ${bd.views}</td>
                </tr>
                <tr class="tblines2" style="background: #ffffcc">
                    <td colspan="2">${fn:replace(bd.contents, newChar, "<br>")}</td>
                </tr>
            </table>
        </div>
        <div class="row">
            <div class="col-6">
                <c:if test="${not empty UID and UID eq bd.userid}">
                    <button type="button" id="upbdbtn"
                            class="btn btn-warning">
                        <i class="bi bi-pencil-square" style="position: relative; top:-3px"></i>
                        수정하기</button>
                    <button type="button" id="rmbdbtn"
                            class="btn btn-danger">
                        <i class="bi bi-trash-fill" style="position: relative; top:-3px"></i>
                        삭제하기</button>
                </c:if>
            </div>
            <div class="col-6 text-right">
                <c:if test="${not empty UID}">
                    <button type="button" id="thumbbtn"
                            class="btn btn-success">
                        <i class="bi bi-hand-thumbs-up" style="position: relative; top:-3px"></i>
                        추천하기</button>
                </c:if>
                <button type="button" id="listbdbtn"
                        class="btn btn-dark">
                    <i class="bi bi-card-list" style="position: relative; top:-3px"></i>
                    목록으로</button>
            </div>
        </div>

        <input type="hidden" id="bno" value="${param.bno}">
        <input type="hidden" id="cp" value="${param.cp}">
        <input type="hidden" id="userid" value="${bd.userid}">


        <div class="row" style="margin-top: 100px">
            <h3><i class="bi bi-chat-square-dots-fill" style="position: relative; top:-3px "></i>나도 한마디</h3>
            <table class="table tblines tt2">
                <tr><td><h4>작성자</h4></td>
                    <td>
                        <div class="cmtbg1">2021-01-30 15:15:15</div>
                        <p>Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text</p>
                        <ul class="list-unstyled">
                            <li>
                                <div class="cmtbg2"><span class="h4">Lorem</span><span style="float: right">2021-01-30 16:16:16</span></div>
                                <p>Where does it come from? </p>

                            </li>
                        </ul>
                    </td>
                </tr>
                <tr><td><h4>작성자</h4></td>
                    <td>
                        <div class="cmtbg1">2021-01-30 15:15:15</div>
                        <p>Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text</p>
                    </td>
                </tr>
                <tr><td><h4>작성자</h4></td>
                    <td>
                        <div class="cmtbg1">2021-01-30 15:15:15</div>
                        <p>Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text</p>
                    </td>
                </tr>
                <tr><td><h4>작성자</h4></td>
                    <td>
                        <div class="cmtbg1">2021-01-30 15:15:15</div>
                        <p>Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text</p>
                    </td>
                </tr>
                <tr><td><h4>작성자</h4></td>
                    <td>
                        <div class="cmtbg1">2021-01-30 15:15:15</div>
                        <p>Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text</p>
                    </td>
                </tr>

            </table>
        </div>
        <div class="row">
            <form id="replyfrm" class="card card-body bg-light">
                <div class="form-group row justify-content-center">
                    <label style="margin-top: 55px" class="text-primary">로그인하세요</label>&nbsp;&nbsp;
                    <textarea id="comment" rows="5"
                              class="form-control col-7 border-danger"></textarea>&nbsp;&nbsp;
                    <span>
                            <button id="bdcmtbtn" class="btn btn-dark" style="margin-top: 50px">
                                <i class="bi bi-chat-text-fill" style="position: relative; top:-3px"></i>
                                댓글쓰기</button>
                        </span>
                </div>
            </form>
        </div>
    </div>

</div>