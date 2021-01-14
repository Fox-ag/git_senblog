window.onload = function(){  // ローディング画面をフェードアウトさせる
    $(function() {
        $("#loading").fadeOut();
    });
}
     
$(function() {   //ロード中はコンテンツの高さをページの高さに合わせる
    var h = $(window).height();
    $('#contents').css('display','none');
    $('#loader-bg ,#loader').height(h).css('display','block');
});
      
// $(window).load(function () {  //全ての読み込みが完了したら実行する
document.addEventListener("turbolinks:load", function() {
    $('#loader-bg').delay(900).fadeOut(800);
    $('#loader').delay(600).fadeOut(300);
    $('#contents').css('display', 'block');
});
 
$(function(){  //10秒たったらロードを終わらせる
    setTimeout('stopload()',10000);
});



// $(window).load("turbolinks:load",function() {
document.addEventListener("turbolinks:load", function() {
  // 一旦hide()で隠してフェードインさせる
  $('.div-blog-block').hide().fadeIn(1500);
  $('.div-for-blog').hide().fadeIn(1500);
  $('.div-for-journal').hide().fadeIn(1000);
  $('.div-block-write-journal').hide().fadeIn(1500);
  $('.main-section-write-blog').hide().fadeIn(1500);
  $('.profile-edit-area').hide().fadeIn(1500);
  $('.pe-show').hide().fadeIn(2000);
  $('.profile-area').hide().fadeIn(1500);
  $('.show-profile-area').hide().fadeIn(2000);
  
});

// $(function () {
document.addEventListener("turbolinks:load",function() {
  $('#searchbox-show').click(function(){
   $('#searchbox-modal').fadeIn(); 
  });
  
  $('.sp_out_box').click(function(){
   $('#searchbox-modal').fadeOut(); 
  });
  
});

document.addEventListener("turbolinks:load",function() {
  $('.sp_droptab').click(function(){
   $('.sp_drop_tab_section').fadeIn(); 
  });
  
  $('.sp_timeline_mainbody').click(function(){
   $('.sp_drop_tab_section').fadeOut();
  });
  
  $('.sp_drop_tab_close').click(function(){
   $('.sp_drop_tab_section').fadeOut();
  });
});

document.addEventListener("turbolinks:load",function() {
  $('.sp_login_buttons').click(function(){
   $('.sp_login_loginarea').fadeIn(); 
  });
  
  $('.sp_login_buttons_two').click(function(){
   $('.sp_login_loginarea').fadeIn(); 
  });
  
  $('.sp_login_close_box').click(function(){
   $('.sp_login_loginarea').fadeOut();
  });
});