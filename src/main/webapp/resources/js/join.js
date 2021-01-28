// Jquery 로 이벤트 추가하기 : $(대상).on(이벤트종류, function() { });


// agree
$('#okagree').on('click', function () { // 동의함
    if (!$('#agree1').is(':checked'))
        alert('이용 약관에 동의하세요') ;
    else if (!$('#agree2').is(':checked'))
        alert('개인정보 활용에 동의하세요');
    else
        location.href = '/join/checkme';
    })
$('#noagree').on('click', function () { location.href = '/index' }); // 동의하지 않음


// checkme
$('#checkbtn2').on('click', function() {
    if ($('#name2').val() == '' ) alert('이름을 입력하세요');
    else if ($('#jumin1').val() == '') alert('주민번호를 입력하세요');
    else if ($('#jumin2').val() == '') alert('주민번호를 입력하세요');
    else if (!$('#usejm').is(':checked')) alert('주민번호이용에 체크하세요');
    // 그냥 joinme 로 가는 방법
    // else location.href = '/join/joinme';

    // joinme 에 정보를 같이 가져가는 방법
    else location.href = '/join/joinme?' +
            'name=' + $('#name2').val() +
            '&jumin1=' + $('#jumin1').val() +
            '&jumin2=' + $('#jumin2').val(); }); // 실명확인하기
    // 결과 /join/joinme=?name=이름&jumin1=123&jumin2=456

$('#cancelbtn2').on('click', function () {
    if (confirm('정말로 취소하시겠습니까?'))
        location.href= '/index'; })

// joinme
// check me 에서 보낸 정보들을 받을때는
// input 에서 value="${param.name}" 으로 받으면 된다.
$('#joinbtn').on('click', function() {
    if ($('#newid').val() == '') alert('아이디를 입력하세요');
    else if ($('#newpass1').val() == '') alert('비밀번호를 입력하세요');
    else if ($('#newpass2').val() != $('#newpass1').val()) alert('비밀번호를 확인하세요');
    else if ($('#zip1').val() == '' || $('#zip2').val() == '' ||
        $('#addr1').val() == '') alert('우편번호 검색을 하세요')
    else if ($('#addr2').val() == '') alert('상세주소를 입력하세요');
    else if ($('#email1').val() == '' || $('#email2').val() == '') alert('이메일을 입력하세요');

    else if ($('#phone1').val() == '국번' || $('#phone2').val() == '' ||
        $('#phone3').val() == '') alert('핸드폰 번호를 입력하세요');
        // google captcha
        // jsp 파일에 상단에 https 도 설정
        // 여기서 grecaptcha 는 id랑 상관없는 js에 들어있는 captcha 명령어, 눌렀는지 안눌렀는지만 판단
        // 코드 확인시엔 alert(grecaptcha.getResponse()) 찍어보면 된다.
    else if ( grecaptcha.getResponse() == "" ) alert('자동가입방지 확인 필요!');
    else {

        // 분리된 데이터 합치기
        $('#jumin').val( $('#jumin1').val()+'-'+$('#jumin2').val() );
        $('#zipcode').val( $('#zip1').val()+'-'+$('#zip2').val() );
        $('#email').val( $('#email1').val()+'@'+$('#email2').val() );
        $('#phone').val( $('#phone1').val()+'-'+$('#phone2').val()+'-'+$('#phone3').val() );

        // recaptcha 코드 유효성 검사를 위한 변수값 설정, 눌렀을 때 나온 값을 g-recaptcha 에 넣음
        // 클라이언트에서 생성한 코드를 서버에서도 확인하기 위한 목적
        $('#g-recaptcha').val( grecaptcha.getResponse() )
        // 물론 g-recaptcha 뿐만 아니라 uid 나 모든 부분들도 다 서버로 전송해 확인하는 것이 좋다.
        // googlecaptchautil 클래스와 imageUploadUtil 클래스 생성후, secret key(비밀키) 만 변경)

        $('#joinfrm').attr('action', '/join/joinme');
        $('#joinfrm').attr('method', 'post');
        $('#joinfrm').submit();}})
        // 변수명은 input 에서 name 에 해당하는곳으로 변수명이 저장된다. id 는 매칭만 시킬 뿐

$('#cancelbtn').on('click', function () {
    if (confirm('정말로 취소하시겠습니까?'))
        location.href = '/index';}) // 동의하지 않음

// 우편번호 처리
$('#findbtn').on('click', function() {
   $.ajax({
       url : '/join/zipcode',
       type : 'GET',
       data : { dong: $('#dong').val() }
   })
       .done(function(data) {
           // 서버로 넘어온 데이터는 json 형식이므로 출력시 object 로 보여짐
           // alert(data);
           let opts = " ";
           $.each(data, function() { // 행 단위 반복처리
               let zip = "";
               $.each(this, function(k, v) { // 열 단위 반복처리
                   if (v != null) zip += v +" ";
               })
               opts += '<option>' + zip + '</option>';
           })
           // 기존 option 태그 제거
           $('#addrlist').find("option").remove();
           // 새로 만든 option 태그를 추가함
           $('#addrlist').append(opts);
       })
       .fail(function(xhr, status, error) {
           alert(xhr,status, +'/'+ error);});});


// 우편번호 보내기
$('#sendbtn').on('click', function() {
    let addr = $('#addrlist option:selected').val();

    if(addr == undefined) {
        alert('주소를 선택하세요');
        return;
    }

    let addrs = addr.split(' '); // 선택한 주소를 공백으로 나눔

    // 분리된 주소를 지정한 위치로 보냄
    // 우편번호는 - 로 분리해서 zip1, zip2 에 보냄
    $('#zip1').val(addrs[0].split('-')[0]);
    $('#zip2').val(addrs[0].split('-')[1]);
    $('#addr1').val(addrs[1]+' '+addrs[2]+' '+addrs[3]);

    // 기존 검색 결과 제거
    $('#addrlist').find("option").remove();
    $('#dong').val('');

    // 우편 번호 검색을 종료
    $('#zipmodal').modal('hide');});

// 우편번호 모달 닫기
$('modalx').on('click', function() {
    $('#addrlist').find("option").remove();
    $('#dong').val('');
    $('#zipmodal').modal('hide');});

// 이메일 처리
// option:selected => select 요소들 중 선택한 객체를 출력
// <option> 123 </option> 이렇게 쓴경우 '123'을 .text() 로 가져오는데
// <option value="ㄱㄴㄷ"> 123 </option> 이렇게 쓴경우 ㄱㄴㄷ를 .val() 로 가져올 수 있다.
$('#email3').on('change', function() {

    let val = $('#email3 option:selected').text();
    if(val == '직접 입력하기') {
        $('#email2').attr('readonly', false); //readonly 속성해제
        $('#email2').val("");
    } else {
        $('#email2').attr('readonly', true);
        $('#email2').val(val);
    }})

// 아이디 중복 체크
// /join/checkuid?uid=아이디
$('#newuid').on('blur', function() { checkuid(); });

function checkuid() {

    let uid = $('#newuid').val();
    if (uid == '') {
        $('#uidmsg').text("6~16 자의 영문 소문자, 숫자와 특수기호(_) 만 사용할 수 있습니다.");
        return;
    }

    $.ajax({ url: "/join/checkuid", type:"GET", data:{ uid: $('#newuid').val() } }) // 비동기 요청 설정
        .done(function(data) {
            let msg = ' 사용 불가 아이디'
            if(data.trim() == '0') {
                msg = ' 사용 가능 아이디입니다.';
                $('#uidmsg').css('fontcolor', 'blue');
            }
            $('#uidmsg').text(msg);
        }) // 비동기 요청 성공시
        .fail(function(xhr, status, error) {
            alert(xhr.status, + "/" + error);
        }); // 비동기 요청 실패시
}

// joinok
$('#go2index').on('click', function() {
    location.href = '/index'
});