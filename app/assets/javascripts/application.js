// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require_tree .
//= require bootstrap-sprockets
//= require turbolinks

//ここら辺、ページ遷移後にjs効かせようと苦戦した跡
//$('body').ready(show_modal);
//$(document).on('page:change', modal);
//jQuery(show_modal);

//show icon
$(document).on('click', '#icon-modal', del_icon);
$(document).on('click','#show-icon', show_icon);

//user edit
$(document).on('click','#edit-profile',edit_profile);
$(document).on('click','#cancel-profile',cancel_profile);

//new book
$(document).on('click','#new-book',new_book);
$(document).on('click','#cancel-book',cancel_book);


//新しい本を投稿
function new_book(){
    $('#book-new').css('display','block');
    $('#book-new').css('width',$(window).width());
    $('#book-new').css('height',$(window).height());
}
//投稿をキャンセル
function cancel_book(){
    $('#book-new').css('display','none');
}



//ユーザープロフィール編集モーダル表示
function edit_profile(){
    $('#profile-edit').css('display','block');
    $('#normal').css('display','none'); 
}
//プロフィール編集を閉じる
function cancel_profile(){
    $('#profile-edit').css('display','none');
    $('#normal').css('display','block'); 
}



//アイコンのモーダル表示
function show_icon(){
    $('#icon-modal').css('display','block');
    $('#icon-modal').css('width',$(window).width());
    $('#icon-modal').css('height',$(window).height());
}

//アイコンのモーダル非表示
function del_icon(){
    $('#icon-modal').css('display','none');
}

// オプションを指定してSkipprの実行
$("#theTarget").skippr({
    // スライドショーの変化 ("fade" or "slide")
    transition : 'fade',
    // 変化に係る時間(ミリ秒)
    speed : 1000,
    // easingの種類
    easing : 'easeOutQuart',
    // ナビゲーションの形("block" or "bubble")
    navType : 'block',
    // 子要素の種類("div" or "img")
    childrenElementType : 'img',
    // ナビゲーション矢印の表示(trueで表示)
    arrows : false,
    // スライドショーの自動再生(falseで自動再生なし)
    autoPlay : true,
    // 自動再生時のスライド切替間隔(ミリ秒)
    autoPlayDuration : 5000,
    // キーボードの矢印キーによるスライド送りの設定(trueで有効)
    keyboardOnAlways : true,
    // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
    hidePrevious : false
});