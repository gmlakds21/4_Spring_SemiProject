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
