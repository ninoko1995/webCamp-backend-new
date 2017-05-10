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

//new interest
$(document).on('click','#add-interest',add_interest);
$(document).on('click','#cancel-interest',cancel_interest);
$(document).on({
"mouseenter": function(){$(this).find('.remove-interest').css('color','red')},
"mouseleave": function(){$(this).find('.remove-interest').css('color','transparent')}
}, ".interest-btn");

//edit header image
$(document).on('click','#edit-header',edit_header);
$(document).on('click','#cancel-header',cancel_header);

//star num when new book
$(document).on('click','.star',change_star);

//new book
$(document).on('click','#new-book',new_book);
$(document).on('click','#cancel-book',cancel_book);

//edit book
$(document).on('click','#edit-book',edit_book);
$(document).on('click','#cancel-book',cancel_book);


//draft list
$(document).on('click','#list-draft',show_draft_list);
$(document).on('click','#cancel-draft',cancel_draft);



//下書きリストを表示
function show_draft_list(){
    $(this).parent().parent().parent().find('#draft-list').css('display','block');
    $(this).parent().parent().parent().find('#draft-list').css('width',$(window).width());
    $(this).parent().parent().parent().find('#draft-list').css('height',$(window).height());
}
//下書きリストを非表示
function cancel_draft(){
    $(this).parent().parent().parent().parent().css('display','none');
}


//新しい本を投稿
function edit_book(){
    $('#book-edit').css('display','block');
    $('#book-edit').css('width',$(window).width());
    $('#book-edit').css('height',$(window).height());
}


//新しい本を投稿
function new_book(){
    $('#book-new').css('display','block');
    $('#book-new').css('width',$(window).width());
    $('#book-new').css('height',$(window).height());
}
//投稿をキャンセル
function cancel_book(){
    $('#book-new').css('display','none');
    $('#book-edit').css('display','none');
}



function change_star(){
    var value = Number($(this).attr('id').slice(5,6));
    for(i=1;i<=value;i++){
        $(this).parent().children("#star-"+i).addClass('glyphicon-star');
        $(this).parent().children("#star-"+i).removeClass('glyphicon-star-empty');
        if(i != value){
            $(this).parent().children("#star-"+i).html("");
        }else{
            $(this).parent().children("#star-"+i).html("<input name='book[valuation]' type='hidden' value='"+i+"' />");
        }
    }
    for(i=value+1;i<=5;i++){
        $(this).parent().children("#star-"+i).addClass('glyphicon-star-empty');
        $(this).parent().children("#star-"+i).removeClass('glyphicon-star');
        $(this).parent().children("#star-"+i).html("");
    }

}

//headerのモーダル表示
function edit_header(){
    $('#edit-header').css('display','none');
    $('.header-edit').fadeIn();
}
//headerのモーダル非表示
function cancel_header(){
    $('.header-edit').fadeOut();
    $('#edit-header').fadeIn();
}



//interest登録の画面
function add_interest(){
    $('#interest-new').css('display','block');
    $(this).css('display','none');
    $('#cancel-interest').css('display','inline');
}
function cancel_interest(){
    $('#interest-new').css('display','none');
    $(this).css('display','none');
    $('#add-interest').css('display','inline');
}

//ユーザープロフィール編集モーダル表示
function edit_profile(){
    $('#profile-edit').css('display','block');
    $('#normal').css('display','none'); 
    $('#edit-profile').css('display','none'); 
    $('#cancel-profile').css('display','block'); 
    $('.interest').css('display','none'); 

}
//プロフィール編集を閉じる
function cancel_profile(){
    $('#profile-edit').css('display','none');
    $('#normal').css('display','block'); 
    $('#edit-profile').css('display','block'); 
    $('#cancel-profile').css('display','none'); 
    $('.interest').css('display','block'); 
}



//アイコンのモーダル表示
function show_icon(){
    $('#icon-modal').css('width',$(window).width());
    $('#icon-modal').css('height',$(window).height());
    $('#icon-modal').fadeIn();
}

//アイコンのモーダル非表示
function del_icon(){
    $('#icon-modal').fadeOut();
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
    arrows : true,
    // スライドショーの自動再生(falseで自動再生なし)
    autoPlay : true,
    // 自動再生時のスライド切替間隔(ミリ秒)
    autoPlayDuration : 5000,
    // キーボードの矢印キーによるスライド送りの設定(trueで有効)
    keyboardOnAlways : true,
    // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
    hidePrevious : false
});
