$('.addPlayer').click(function() {
  $('.playerForm').css('display', 'block');
});

$('.gamesTable').click(function() {
  $('.gameTable').css('display', 'block');
});

$('.hideTable').click(function() {
  $('.gameTable').css('display', 'none');
});

$('.seePlayer').click(function() {
  $('.singleInfo').css('display', 'block');
});

$('.completeGame').click(function() {
  window.location = '/games/' + $(this).attr('id');
});