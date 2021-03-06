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

<%--<c:set var="baseImgURL" value="http://localhost/cdn/galupload/"/>--%>
<c:set var="baseImgURL" value="http://15.165.161.209:7732/cdn/"/>

<div class="main margin30">
    <div class="margin30">
        <h3><i class="bi bi-card-image" style="position: relative; top: -3px;"></i>&nbsp;갤러리</h3>
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
                    <button type="button" id="newgal"
                            class="btn btn-light">
                        <i class="bi bi-plus-circle-fill" style="position: relative; top:-3px"></i>
                        새글쓰기</button>
                </c:if>
            </div>
        </div>
        <div class="row">
            <table class="table">
                <tr class="tblines2" style="background: #dff0f8">
                    <th colspan="2" class="text-center"><h1>${gal.title}</h1></th>
                </tr>
                <tr style="background: #ccff99">
                    <td class="text-left"><h4>${gal.userid}</h4></td>
                    <td class="text-right"><b>${gal.regdate}</b> / ${gal.thumbs} / ${gal.views}</td>
                </tr>
                <tr class="tblines2" style="background: #ffffcc">
                    <td colspan="2">
                        <c:forEach var="i" begin="0" end="2" step="1">
                            <c:if test="${fn:split(gal.fnames, '[/]')[i] ne '_'}">
                                <img src="${baseImgURL}${fn:split(gal.fnames, '[/]')[i]}"
                                    width="650px" height="650px">
                            </c:if>
                        </c:forEach>
                        <p> ${fn:replace(gal.contents, newChar, "<br>")} </p>
                    </td>
                </tr>

                <c:forEach var="i" begin="0" end="2" step="1">
                    <c:if test="${fn:split(gal.fnames, '[/]')[i] ne '_'}">
                        <tr>
                            <td class="text-left">첨부${i+1}</td>
                            <td>
                                ${fn:split(gal.fnames,"[/]")[i]} (${fn:split(gal.fsizes, "[/]")[i]}KB)
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>

            </table>
        </div>
        <div class="row">
            <div class="col-6">
                <c:if test="${not empty UID and UID eq gal.userid}">
                    <button type="button" id="upgalbtn"
                            class="btn btn-warning">
                        <i class="bi bi-pencil-square" style="position: relative; top:-3px"></i>
                        수정하기</button>
                    <button type="button" id="rmgalbtn"
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
                <button type="button" id="listgalbtn"
                        class="btn btn-dark">
                    <i class="bi bi-card-list" style="position: relative; top:-3px"></i>
                    목록으로</button>
            </div>
        </div>

        <input type="hidden" id="gno" value="${param.gno}">
        <input type="hidden" id="cp" value="${param.cp}">
        <input type="hidden" id="userid" value="${gal.userid}">

        <div class="row" style="margin-top: 100px">
            <h3><i class="bi bi-chat-square-dots-fill" style="position: relative; top:-3px "></i>나도 한마디</h3>
            <table class="table tblines tt2">
                <c:forEach var="r" items="${rp}">
                    <c:if test="${r.cno eq r.rno}">
                        <tr>
                            <td><h4>${r.userid}</h4></td>
                            <td>
                                <div class="cmtbg1">${r.regdate}</div>
                                <span style="float:right">
                                    <a href="javascript:addReply('${r.rno}')">[추가]</a>
                                    <a href="javascript:modReply()">[수정]</a>
                                    <a href="javascript:delReply()">[삭제]</a>
                                </span>
                                <p>${r.reply}</p>
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${r.cno ne r.rno}">
                        <tr>
                            <td></td>
                            <td>
                                <ul class="list-unstyled">
                                    <li>
                                        <div class="cmtbg2">
                                            <span class="h4">${r.userid}</span>
                                            <span style="float: right">${r.regdate}</span>
                                        </div>
                                        <span style="float:right">
                                            <a href="javascript:modReply()">[수정]</a>
                                            <a href="javascript:delReply()">[삭제]</a>
                                        </span>
                                        <p>${r.reply}</p>
                                    </li>
                                </ul>
                            </td>
                       </tr>
                    </c:if>
                    </c:forEach>
            </table>
        </div>
        <c:if test="${not empty UID}">
            <div class="row">
                <form id="replyfrm" class="card card-body bg-light">
                    <div class="form-group row justify-content-center">
                        <label style="margin-top: 55px" class="text-primary ">
                                ${UID}님 &nbsp;
                        </label>&nbsp;&nbsp;
                        <textarea id="reply" name="reply" rows="5"
                                  class="form-control col-7 border-danger"></textarea>&nbsp;&nbsp;
                        <span>
                            <button type="button" id="pdcmtbtn"
                                    class="btn btn-dark" style="margin-top: 50px">
                                <i class="bi bi-chat-text-fill" style="position: relative; top:-3px"></i>
                                댓글쓰기
                            </button>
                        </span>
                        <input type="hidden" name="gno" value="${param.gno}">
                        <input type="hidden" name="userid" id="uid" value="${UID}">
                    </div>
                </form>
            </div>
        </c:if>
    </div>
</div>


<%-- 대댓글 모달 --%>
<div class="modal hide fade" id="replyModal" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title"> 대댓글 쓰기</h3>
            </div>
            <div class="modal-body">
                <form name="rpfrm" id="rpfrm" class="well form-inline">
                    <textarea name="reply" id="rereply" rows="8" cols="75"
                              class="span4"></textarea>
                    <input type="hidden" name="userid" value="${UID}">
                    <input type="hidden" name="gno" value="${param.gno}">
                    <input type="hidden" name="cno" id="cno">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="rpbtn"
                        class="btn btn-warning">대댓글 작성</button>
           </div>
        </div>
    </div>
</div>