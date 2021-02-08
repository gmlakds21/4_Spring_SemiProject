// list
$('#newgal').on('click', function() {
    location.href = "/gallery/write"; })

function showing(gno) {
    location.href = "/gallery/view?gno=" + gno;
}

// write
$('#newgalbtn').on('click', function( ) {
    if ($('#title').val() == "" ) alert ('제목을 작성하세요');
    else if ($('#contents').val() == "" ) alert ('내용을 작성하세요');
    else if ($('#file1').val() == "" ) alert ('파일을 첨부하세요');
    else {
        $('#newgalfrm').attr('method', 'post');
        $('#newgalfrm').attr('enctype', 'multipart/form-data');
        $('#newgalfrm').attr('action', '/gallery/writeok');
        $('#newgalfrm').submit(); }});

// view
