jQuery(document).on('turbolinks:load', function(){
$(function() {
  $('.full-screen').slick({
  		centerMode: true,
  		centerPadding: '5%', // センターモード時のサイドパディング。見切れるスライドの幅。’px’または’％’。
    	dots: true, // ドットインジケーターの表示
    	autoplay: true, // 自動再生を設定
    	autoplaySpeed: 2500, // 自動再生のスピード（ミリ秒単位）
   		speed: 1000, // スライド/フェードアニメーションの速度を設定
   		infinite: true
  });
});
});