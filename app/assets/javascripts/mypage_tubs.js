$(function() {
	//クリックしたときのファンクションをまとめて指定
	$('.transaction-tabs li').click(function() {

		//.index()を使いクリックされたタブが何番目かを調べ、
		//indexという変数に代入します。
		var index = $('.transaction-tabs li').index(this);

		//コンテンツを一度すべて非表示にし、
		$('.tab-content-transaction ul').css('display','none');

		//クリックされたタブと同じ順番のコンテンツを表示します。
		$('.tab-content-transaction ul').eq(index).css('display','block');

		//一度タブについているクラスselectを消し、
		$('.transaction-tabs li').removeClass('select');

		//クリックされたタブのみにクラスselectをつけます。
		$(this).addClass('select')
	});
});

$(function() {
	//クリックしたときのファンクションをまとめて指定
	$('.tabs li').click(function() {

		//.index()を使いクリックされたタブが何番目かを調べ、
		//indexという変数に代入します。
		var index = $('.tabs li').index(this);

		//コンテンツを一度すべて非表示にし、
		$('.tab-content-notification-todo ul').css('display','none');

		//クリックされたタブと同じ順番のコンテンツを表示します。
		$('.tab-content-notification-todo ul').eq(index).css('display','block');

		//一度タブについているクラスselectを消し、
		$('.tabs li').removeClass('select');

		//クリックされたタブのみにクラスselectをつけます。
		$(this).addClass('select')
	});
});