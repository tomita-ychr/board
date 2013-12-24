{extends file='default/base.tpl'}
{block css}
    {*---------一時使用CSSなので直書きしています--------*}
    <style>
      .sub_menu dd {
        float: left;    
      }

      .loading {
        background-color: #FFF;
        font-family: 'メイリオ','Arial', 'Tahoma', sans-serif;
        padding: 5px;
      }
      
      .data-disp, .sub_menu dt, input[type="submit"] {
        clear:both;
      }
    
    </style>
    <link rel="stylesheet" href="/css/top.css" type="text/css">
    <link rel="stylesheet" href="/css/threadlist.css" type="text/css">
{/block}
{block js}
    <script src="/js/search.js"></script>
{/block}
{block title append} 検索用ページ{/block}
{block main_contents}
<div class="panel panel-default">
  <div class="panel-heading">
    <h1 class="panel-title">検索用ページ</h1>
  </div>
</div>
<h2>検索メニュー</h2>
<ul>
{foreach $thread_list as $record}
    <li>{$record->get()}</li>

{/foreach}
</ul>

<div class="sub_menu">
<form id="search-form" action="javascript:void(0);">
<dl>
  <dt>ジャンル</dt>
    <dd><label><input type="radio" name="genre_id" value="">指定なし</label></dd>
  {foreach $genre_list as $record}
    <dd><label><input type="radio" name="genre_id" value="{$record->getId()}">{$record->getName()}</label></dd>
  {/foreach}
  
  <dt>タグ</dt>
  {foreach $tag_list as $record}
    <dd><label><input type="checkbox" name="tag_id[{$record->getId()}]" value="{$record->getId()}">{$record->getName()}</label></dd>
  {/foreach}  
</dl>
<input type="submit" name="submit" value="検索開始">
<span class="loading"><img src="/img/loading.gif" alt="Now loading...">Now loading... </span>
</form>

  {if $sdx_user->hasId()}
  <dl>
    <dt><i class="fa fa-lock"></i> 管理メニュー</dt>
      <dd><a href="/control/thread">スレッド管理</a></dd>
      <dd><a href="/control/genre">ジャンル管理</a></dd>
      <dd><a href="/control/tag">タグ管理</a></dd>
  </dl>
  {/if}
</div>
  
{*-------------ajaxで取得したdataの表示スペース--------------*}
<h2>スレッドリスト</h2>
<div class="data-disp">

</div>

<input type="button" name="more" value="さらに表示" >
<span class="loading"><img src="/img/loading.gif" alt="Now loading...">Now loading... </span>
{/block}