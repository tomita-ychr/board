<html>
    <head>
        <meta charset="UTF-8">
    </head>
    <body>
{*extends file='default/base.tpl'*}
{block title append} indexです{/block}
{block main_contents}
<div class="panel panel-default">
  <div class="panel-heading">
    <h1 class="panel-title">indexです</h1>
  </div>
</div>
<div>
    <table class="table">
        <tr class="success">
            <th>スレッド番号</th>
            <th>スレッド名</th>
            <th>スレ立て日時</th>
            <th>最終エントリ日時</th>
        </tr>
       {foreach $thread_list as $record}
        <tr>
             <td>{$record->getId()}</td>
             <td><a href="thread/{$record->getId()}/list">{$record->getTitle()}</a></td>
             <td>{$record->getCreated_at()}</td>
               {foreach $record->getEntryList() as $entry}
                 <td>{$entry->getCreated_at()}</td>
               {/foreach}
        </tr>
        {/foreach}
    </table>
     
</div>

{/block}
</body>
</html>