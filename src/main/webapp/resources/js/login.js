// login
$('#loginbtn').on('click', function() {
    if($('#userid').val() == '' ) alert('아이디를 입력하세요');
    else if ($('#passwd').val() == '' ) alert('비밀번호를 입력하세요');
    else {
        $('#loginfrm').attr("method", "post");
        $('#loginfrm').attr("action", "/login/login");
        $('#loginfrm').submit();
    }});

// join
$('#join2btn').on('click', function() {
   location.href = "/join/agree";});

// logout
$('#logoutbtn').on('click', function() {
    location.href = "/login/logout";});