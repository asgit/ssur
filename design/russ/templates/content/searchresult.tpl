
{let use_url_translation=ezini('URLTranslator','Translation')|eq('enabled')}

{section show=$search_result}
<table class="list" width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
    <th>{"Date"|i18n("design/standard/content/search")}</th>
    <th>{"Title"|i18n("design/standard/content/search")}</th>
    <th>{"Author"|i18n("design/standard/content/search")}</th>
{*
<!--    <th width="1">{"Class"|i18n("design/standard/content/search")}</th> -->
*}
</tr>
<tr>
  {section name=SearchResult loop=$search_result show=$search_result sequence=array(bglight,bgdark)}
      {node_view_gui view=search sequence=$:sequence use_url_translation=$use_url_translation content_node=$:item}
  {delimiter modulo=1}
</tr>
<tr>
  {/delimiter}
  {section-else}
  {/section}
</tr>
</table>
{/section}

{/let}
