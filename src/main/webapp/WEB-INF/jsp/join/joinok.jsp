<%@ page pageEncoding="UTF-8"%>

<div class="main margin30">
    <div class="margin30">
        <h3><i class="bi bi-people-fill"></i> 회원가입</h3>
        <hr>
    </div>

    <ul class="breadcrumb">
        <li class="breadcrumb-item disabled "><button type="button" class="btn btn-success btn-sm" disabled>이용약관</button></li>
        <li class="breadcrumb-item disabled"><button type="button" class="btn btn-success btn-sm" disabled>실명확인</button></li>
        <li class="breadcrumb-item disabled"><button type="button" class="btn btn-success btn-sm" disabled>정보입력</button></li>
        <li class="breadcrumb-item disabled"><button type="button" class="btn btn-success btn-sm" disabled>가입완료</button></li>
    </ul>

    <div class="margin100">
        <h2>회원가입 완료</h2>
        <small class="text-muted">
            안전하고 편리한 홈페이지 이용을 위해 회원님의 아이디와 비밀번호 관리에 주의해 주시기 바랍니다.
        </small>
        <hr>
    </div>

    <div class="jumbotron margin1050">
        <h1>회원가입을 축하합니다.</h1>
        <p class="margin30">
            게시판 글작성, 쇼핑몰 이용등의 일부 서비스는 실명확인 후 이용하실 수 있습니다<br>
            실명확인 후에도 가입하신 아이디는 변경할 수 없습니다.
        </p>
        <hr>
        <p>회원가입 이후 아이디와 비밀번호로 일반회원으로
            로그인하셔서 추가 인적사항등을 등록해주시기 바랍니다.<br>
            lorem Ipsum과 함께 즐거운 시간 되십시오.
        </p>
        <p>이름 : ${name}</p>
        <p>이메일 : ${email}</p>
        <p>가입일시 : ${regdate}</p>
    </div>

    <div class="text-center">
        <button type="button" id="go2index"
                class="btn btn-success">
            <i class="bi bi-house-fill">&nbsp;메인으로 이동</i>
        </button>
    </div>
</div>
