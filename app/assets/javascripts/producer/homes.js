jQuery(document).on('turbolinks:load', function(){
$(function(){

//プロフィールのプレビュー機能
    // inputのidから情報の取得
    $('#producer-image').on('change', function (e) {
	// ここから既存の画像のurlの取得
    var reader = new FileReader();
    reader.onload = function (e) {
        $(".producer_image").attr('src', e.target.result);
    }
	// ここまで
    reader.readAsDataURL(e.target.files[0]); //取得したurlにアップロード画像のurlを挿入
});
});
});