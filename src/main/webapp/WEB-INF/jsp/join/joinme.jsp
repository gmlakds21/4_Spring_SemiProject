<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script src="https://www.google.com/recaptcha/api.js"></script>
<%-- google captcha 관련 코드 --%>

<div class="main margin30">
    <div class="margin30">
        <h3><i class="bi bi-people-fill"></i> 회원가입</h3>
        <hr>
    </div>
    <ul class="breadcrumb">
        <li class="breadcrumb-item disabled "><button type="button" class="btn btn-success btn-sm" disabled>이용약관</button></li>
        <li class="breadcrumb-item disabled"><button type="button" class="btn btn-success btn-sm" disabled>실명확인</button></li>
        <li class="breadcrumb-item disabled"><button type="button" class="btn btn-success btn-sm" disabled>정보입력</button></li>
        <li class="breadcrumb-item disabled"><button type="button" class="btn btn-light btn-sm" disabled>가입완료</button></li>
    </ul>

    <div class="margin100">
        <h2>회원정보 입력</h2>
        <small class="text-muted">
            회원정보는 개인정보 취급방침에 따라 안전하게 보호되며, 회원님의 명백한 동의없이 공개 또는 제3자에게 공개되지 않습니다.
        </small>
        <hr>
    </div>

    <div class="card card-body bg-light margin1050">
        <h3>일반회원</h3>
        <form name="joinfrm" id="joinfrm">

            <div class="body col-11 offset-1">
                <div class="form-group row">
                    <label for="name"
                           class="col-3 col-form-label text-right text-danger">이름</label>
                    <input type="text" id="name" name="name" readonly value="${param.name}"
                           class="col-2 form-control border-danger">
                </div>

                <div class="form-group row">
                    <label for="jumin1"
                           class="col-3 col-form-label text-right text-danger">주민등록번호</label>
                    <input type="text" id="jumin1" name="jumin1" readonly value="${param.jumin1}"
                           class="col-2 form-control border-danger">&nbsp;-&nbsp;
                    <input type="text" id="jumin2" name="jumin2" readonly value="${param.jumin2}"
                           class="col-2 form-control border-danger">
                </div>

                <div class="form-group row">
                    <label for="newuid"
                           class="col-3 col-form-label text-right text-danger">아이디</label>
                    <input type="text" id="newuid" name="userid"
                           class="col-2 form-control border-danger"
                            value="${mvo.userid}">&nbsp;&nbsp;
                    <span id="uidmsg" class="col-form-label text-danger">6~16 자의 영문 소문자, 숫자와 특수기호(_) 만 사용할 수 있습니다.</span>
                </div>

                <div class="form-group row">
                    <label for="newpass1"
                           class="col-3 col-form-label text-right text-danger">비밀번호</label>
                    <input type="password" id="newpass1" name="passwd"
                           class="col-2 form-control border-danger">&nbsp;&nbsp;
                    <span class="col-form-label text-danger">6~16 자의 영문 대소문자, 숫자 및 특수문자 사용할 수 있습니다.</span>
                </div>

                <div class="form-group row">
                    <label for="newpass2"
                           class="col-3 col-form-label text-right text-danger">비밀번호 확인</label>
                    <input type="password" id="newpass2" name="newpass2"
                           class="col-2 form-control border-danger">&nbsp;&nbsp;
                    <span class="col-form-label text-danger">이전 항목에서 입력했던 비밀번호를 한번 더 입력하세요</span>
                </div>

                <div class="form-group row">
                    <label for="zip1"
                           class="col-3 col-form-label text-right text-danger">우편번호</label>
                    <input type="text" id="zip1" name="zip1" readonly
                           class="col-1 form-control border-danger"
                            value="${fn:split(mvo.zipcode,'-')[0]}">&nbsp;-&nbsp;
                    <input type="text" id="zip2" name="zip2" readonly
                           class="col-1 form-control border-danger"
                           value="${fn:split(mvo.zipcode,'-')[1]}">&nbsp;
                    <span class="">
                        &nbsp;&nbsp;
                        <button type="button" data-toggle="modal" data-target="#zipmodal"
                                class="btn btn-dark"><i class="bi bi-question-circle"></i>&nbsp;&nbsp;우편번호 찾기</button>
                    </span>
                </div>

                <div class="form-group row">
                    <label for="addr1"
                           class="col-3 col-form-label text-right text-danger">주소</label>
                    <input type="text" id="addr1" name="addr1" readonly
                           class="col-4 form-control border-danger"
                            value="${mvo.addr1}">&nbsp;
                    <input type="text" id="addr2" name="addr2"
                           class="col-4 form-control border-danger">
                </div>

                <div class="form-group row">
                    <label for="email1"
                           class="col-3 col-form-label text-right text-danger">전자우편 주소</label>
                    <input type="text" id="email1" name="email1"
                           class="col-2 form-control border-danger"
                           value="${fn:split(mvo.email,'@')[0]}">
                    <div class="input-group-append">
                        <span class="input-group-text border-danger">@</span>
                    </div>
                    <input type="text" id="email2" name="email2" readonly
                           class="col-2 form-control border-danger"
                           value="${fn:split(mvo.email,'@')[1]}">
                    <select id="email3" name="email3"
                            class="form-control col-2 border-danger text-danger">
                        <option>선택하세요</option>
                        <option>naver.com</option>
                        <option>직접 입력하기</option>
                    </select>
                </div>

                <div class="form-group row">
                    <label for="phone1"
                           class="col-3 col-form-label text-right text-danger">개인 연락처</label>
                    <select id="phone1" name="phone1"
                            class="col-2 form-control border-danger">
                        <option>국번</option>
                        <option>02</option>
                    </select>
                    <span class="col-form-label">&nbsp;&ndash;&nbsp;</span>
                    <input type="text" id="phone2" name="phone2"
                           class="col-1 form-control border-danger"
                           value="${fn:split(mvo.phone,'-')[1]}">
                    <span class="col-form-label">&nbsp;&ndash;&nbsp;</span>
                    <input type="text" id="phone3" name="phone3"
                           class="col-1 form-control border-danger"
                           value="${fn:split(mvo.phone,'-')[2]}">
                </div>

                <div class="form-group row">
                    <label class="col-3 col-form-label text-right text-danger">자동 가입 방지</label>
                    <div class="g-recaptcha"
                         data-sitekey="6Lc01zoaAAAAAAF-3bI9dsRi0lL1jnEqvsIIMwF-"></div>
                    <input type="hidden" id="g-recaptcha" name="g-recaptcha">
                    <span style="color:red">${checkCaptcha}</span>
                </div>
            </div>

            <div class="row margin30">
                <div class="col-12 text-center">
                    <button type="button" id="joinbtn" class="btn btn-primary"><i class="bi bi-check"></i> 입력완료</button>
                    <button type="button" id="cancelbtn" class="btn btn-danger"><i class="bi bi-x"></i> 취소하기</button>
                </div>
            </div>

            <input type="hidden" name="jumin" id="jumin">
            <input type="hidden" name="zipcode" id="zipcode">
            <input type="hidden" name="email" id="email">
            <input type="hidden" name="phone" id="phone">
        </form>
    </div>
</div>

<div class="modal fade" id="zipmodal" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">우편번호 찾기</h3>
                <button type="button" id="modalx" data-dismiss="modal"
                        class="close">&times;</button>
            </div>

            <div class="modal-body">
                <form id="zipfrm">
                    <div class="form-group row margin25">
                        <div class="col-1"></div>
                        <label for="dong"
                               class="col-form-label col-4 text-right text-danger ">
                            검색하실 주소의<br>동 이름을 입력하세요
                        </label>
                        <input type="text" id="dong" name="dong"
                               class="form-control col-3 border-danger">
                        <span class="col-3">
                            <button type="button" id="findbtn"
                                    class="btn btn-primary"><i class="bi bi-search"></i>검색하기</button>
                        </span>
                        <div class="col-1"></div>
                    </div>
                    <hr>
                    <div class="form-group row justify-content-center">
                        <span class="text-center text-primary">지역의 읍/면/동의 이름을 공백없이 입력하신 후 [검색하기]버튼을 클릭하세요</span>
                        <select id="addrlist" name="addrlist"
                                class="form-control text-center col-8 margin25" size="10">
                            <option>123-456 서울 종로구 창신동</option>
                            <option>123-456 서울 종로구 창신동</option>
                            <option>123-456 서울 종로구 창신동</option>
                            <option>123-456 서울 종로구 창신동</option>
                            <option>123-456 서울 종로구 창신동</option>
                            <option>123-456 서울 종로구 창신동</option>
                            <option>123-456 서울 종로구 창신동</option>
                            <option>123-456 서울 종로구 창신동</option>
                            <option>123-456 서울 종로구 창신동</option>
                            <option>123-456 서울 종로구 창신동</option>
                            <option>123-456 서울 종로구 창신동</option>
                        </select>
                    </div>
                </form>
            </div>

            <div class="modal-footer justify-content-end">
                <button type="button" id="sendbtn"
                        class="btn btn-danger">
                    <i class="bi bi-check2-circle"></i>&nbsp;&nbsp;선택하고 닫기</button>
            </div>

        </div>
    </div>

</div>