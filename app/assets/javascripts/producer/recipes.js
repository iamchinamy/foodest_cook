$(function(){

//レシピ完成イメージのプレビュー機能
    // inputのidから情報の取得
    $('#recipe_image').on('change', function (e) {
	// ここから既存の画像のurlの取得
    var reader = new FileReader();
    reader.onload = function (e) {
        $(".recipe_image").attr('src', e.target.result);
    }
	// ここまで
    reader.readAsDataURL(e.target.files[0]); //取得したurlにアップロード画像のurlを挿入
});
//レシピの材料を複数投稿するためのクローン
    // var ingredient_num = $('.ingredients').length;//ingredientsの要素がいくつあるか数える
    var ingredient_num = 0
    console.log(ingredient_num)//chromeディペッロッパーツールに表示させる
    $('#btn1').click(function(){
    	ingredient_num ++
	    console.log(ingredient_num)
    	var input =
			'<div class="ingredients from-group justify-content-md-center row">'
				+ '<div class="row col-sm-4">'
					+ '<label class="col-form-label col-sm-2" for="recipe_ingredients_attributes_' + ingredient_num + '_item">材料</label>'
					+ '<div class="col-sm-10">'
						+ '<input placeholder="鶏胸肉" class="form-control" type="text" name="recipe[ingredients_attributes][' + ingredient_num + '][item]" id="recipe_ingredients_attributes_' + ingredient_num + '_item" />'
					+ '</div>'
				+ '</div>'
				+ '<div class="row col-sm-4">'
					+ '<label class="col-form-label col-sm-2" for="recipe_ingredients_attributes_' + ingredient_num + '_amout">数量</label>'
					+ '<div class="col-sm-10">'
						+ '<input placeholder="１枚" class="form-control" type="text" name="recipe[ingredients_attributes][' + ingredient_num + '][amount]" id="recipe_ingredients_attributes_' + ingredient_num + '_amount" />'
					+ '</div>'
				+ '</div>'
			+ '</div>';

		$('.ingredient-box').append(input);
  });
});
