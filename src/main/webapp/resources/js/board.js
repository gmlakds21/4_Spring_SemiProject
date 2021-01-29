// list
$('#newbd').on('click', function() {
    location.href = "/board/write";
})

// view
$('#thumbbtn').on('click', function() {
    location.href = "/board/";
})

$('#listbdbtn').on('click', function() {
    location.href = "/board/list?cp=" + $('#cp').val();
})

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
    location.href = "/board/write"
})

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


//view.jsp 에서