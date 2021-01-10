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