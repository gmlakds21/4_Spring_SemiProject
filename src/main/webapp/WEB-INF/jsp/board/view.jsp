<%@ page pageEncoding="UTF-8"%>

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
                <button type="button" id="newbdbtn"
                        class="btn btn-light">
                    <i class="bi bi-plus-circle-fill" style="position: relative; top:-3px"></i>
                    새글쓰기</button>
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
                    <td colspan="2">${bd.contents}</td>
                </tr>
            </table>
        </div>
        <div class="row">
            <div class="col-6">
                <button type="button" id="upbdbtn"
                        class="btn btn-warning">
                    <i class="bi bi-pencil-square" style="position: relative; top:-3px"></i>
                    수정하기</button>
                <button type="button" id="rmbdbtn"
                        class="btn btn-danger">
                    <i class="bi bi-trash-fill" style="position: relative; top:-3px"></i>
                    삭제하기</button>
            </div>
            <div class="col-6 text-right">
                <button type="button" id="listbdbtn"
                        class="btn btn-light">
                    <i class="bi bi-card-list" style="position: relative; top:-3px"></i>
                    목록으로</button>
            </div>
        </div>
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