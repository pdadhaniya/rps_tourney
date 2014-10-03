

$('.gamesTable').click(function() {
  $('.gameTable').css('display', 'block');
});

$('.hideTable').click(function() {
  $('.gameTable').css('display', 'none');
});

$('.seePlayer').click(function() {
  $('.singleInfo').toggle('show');
});

$('.completeGame').click(function() {
  window.location = '/games/' + $(this).attr('id');
});

// $(document).ready(function(){
//   $('.playerForm').show();
// })
