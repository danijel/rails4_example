$(document).on('click', '#browse', function() {
  console.log('browse files button clicked');
  $('#fileupload').trigger('click');
});

$(function () {
    $('#fileupload').fileupload({
        dataType: 'json',
        add: function (e, data) {
          var types = /(\.|\/)(gif|jpe?g|png)$/i;
          var file = data.files[0];
          if (types.test(file.type) || types.test(file.name)) {
            data.submit();
          } else {
            alert('Only png, jpg or gif picture files are allowed');
          }
        },
        progress: function(e, data) {
          if (data.context) {
            var progress = parseInt(data.loaded/data.total * 100, 10)
            data.context.find('.bar').css('width', progress+'%')
          }
        },
        done: function (e, data) {
          var new_url=data.result.file.thumb_url;
          $('#avatar img').attr('src', new_url);
        }
    });
});
