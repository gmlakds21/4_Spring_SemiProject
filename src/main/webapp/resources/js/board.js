// list
$('#newbd').on('click', function() {
    location.href = "/board/write";
})

$('#findbdbtn').on('click', function() {
    location.href = "/board/find" +
        "?findType=" + $('#findType').val() +
        "&findKey=" + $('#findKey').val() +
        "&cp=1";})

// view
$('#thumbbtn').on('click', function() {
    location.href = "/board/"; })

$('#listbdbtn').on('click', function() {
    location.href = "/board/list?cp=" + $('#cp').val(); })

$('#upbdbtn').on('click', function() {
    if (confirm("이글을 수정 하시겠습니까?"))
        location.href = '/board/update?cp=' + $('#cp').val() +
            "&bno=" + $('#bno').val() + "&userid=" + $('#userid').val(); })

$('#rmbdbtn').on('click', function() {
    if (confirm("정말 이글을 삭제 하시겠습니까?"))
        location.href = '/board/delete?cp=' + $('#cp').val() +
            "&bno=" + $('#bno').val() + "&userid=" + $('#userid').val(); })

$('#prevbtn').on('click', function() { })
$('#nextvbtn').on('click', function() { })


$('#newbdbtn').on('click', function() {
    location.href = "/board/write"})

$('#bdcmtbtn').on('click', function() {
    if($('#reply').val() == '') alert ('댓글을 작성하세요');
    else {
        $('#replyfrm').attr('method', 'post');
        $('#replyfrm').attr('action', '/board/replyok');
        $('#uid').val('리플작성');
        $('#replyfrm').submit(); }})


function addReply(cno) {
    $('#replyModal').modal('show');
    $('#cno').val(cno); // 대댓글 작성시 부모댓글 번호를 cno 에 저장
} // 대댓글 대화상자 띄우기

function modReply(){

}

function delReply() {

}

$('#rpbtn').on('click', function() {
    if ($('#rereply').val() == '' ) alert('대댓글을 작성하세요');
    else if ($('#UID').val() == null) alert('로그인을 하세요'); // 또는 location.href = /join/login;
    else {
        $('#rpfrm').attr('method', 'post');
        $('#rpfrm').attr('action', '/board/replyok');
        $('#rpfrm').submit();
    }})  // 대댓글 작성하기


// write
$('#newbdbtn').on('click', function() {
    if ($('#title').val() == '') alert('제목 작성하세요');
    else if ($('#contents').val() == '') alert('본문 작성하세요');
    else {
        $('#newbdfrm').attr("method", "post");
        $('#newbdfrm').attr("action", "/board/write");
        $('#newbdfrm').submit();
    }})

// update
$('#upbdokbtn').on('click', function() {
    if (confirm('정말로 수정하시겠습니까?')) {
        $('#upbdfrm').attr('method', 'post');
        $('#upbdfrm').attr('action', '/board/update');
        $('#upbdfrm').submit();
    } })
