// write
$('#newpdbtn').on('click', function( ) {
    if ($('#title').val() == "" ) alert ('제목을 작성하세요');
    else if ($('#contents').val() == "" ) alert ('내용을 작성하세요');
    else if ($('#file1').val() == "" ) alert ('파일을 첨부하세요');
    else {
        $('#newpdfrm').attr('method', 'post');
        $('#newpdfrm').attr('enctype', 'multipart/form-data');
        $('#newpdfrm').attr('action', '/pds/writeok');
        $('#newpdfrm').submit(); }});