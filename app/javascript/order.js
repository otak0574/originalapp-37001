$(document).on('turbolinks:load', function(){
  $('.confirmation').on('click', function(){
    return confirm('本当によろしいですか？');
  });
});
