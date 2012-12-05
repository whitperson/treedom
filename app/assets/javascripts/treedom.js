$(function(){

  $('#input').click(get_text);

});

function get_text()

{
  var url_text = $('#url').val();
  $.ajax({
    type: "POST",
    url: "/search",
    data: { url: url_text }
  }).done(function(msg) {

    display_text(msg);
    console.log(msg);
  });
}

function display_text(words)
{
  $('#display_text').empty();
  $('#display_text').append(words);
}