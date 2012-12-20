{*?template charset="koi8-r"?*}
{if $current_node_id}{/if}
{def $morda_node_id = 2}
{def $morda_node=fetch( content, node, hash( node_id, $morda_node_id ))}

<div id="newscol">

{*** NEWS ***}
{def 
	$block = fetch( 'content', 'node', hash( 'node_id', '2490' ) )
	$block_name = $block.name	
}
{* $block|attribute(show,1) *}

    {def $children = array()
         $limit = or($block.object.data_map.limit_on_morda.value, 10)
         $offset = 0}
{* <!-- $current_top_razdel.url_alias: '{$current_top_razdel.url_alias}' --> *}
	{if $current_top_razdel.node_id|eq('225')}{def $limit=5}{/if} {* Themes *}
    {set $children=fetch( content, list, hash( 'parent_node_id', $block.node_id, 
                                               'limit', $limit,
                                               'offset', $offset,
                                               'class_filter_type', 'include',
                                               'class_filter_array', array( 'article', 'news', 'link'),
                                               'sort_by', $block.sort_array ) ) }

    {if $children|count()}
    <div class="content-view-children float-break">
    {foreach $children as $child}
         {node_view_gui view=frontpage content_node=$child image_class=listitem}
         {delimiter}
             {include uri='design:content/datatype/view/ezxmltags/separator.tpl'}
         {/delimiter}
    {/foreach}

    </div>
    {/if}

{def $current_node=fetch( content, node, hash( node_id, $current_node_id ))}
<!-- $current_node.class_identifier: {$current_node.class_identifier} -->
<div class="adblock">
{sape_links('5')}
</div>

</div> <!-- / #newscol -->
<div id="extracol">
    
{def $current_top_razdel = $module_result.path.1
}
{* ***  *}
{* $current_top_razdel|attribute( show,1) *}

{*** BEST BLOCK ***}

{def $best=$morda_node.data_map.best.content.relation_list}
{* $best|attribute(show, 2) *}

{if  $best|count()} 
<div class="content-view-children float-break" id="best">
<h1 class="column-d-head">������ ����������</h1>
{** Save current $node **}
{def $tmp_node = $node}

      {foreach $best as $index=>$relation_object }
		{def $node=fetch( content, node, hash( node_id, $relation_object.node_id ))}
		{* node_view_gui view=listitem content_node=$best_node *}
<div class="content-view-listitem{if $index|eq($best|count()|dec())} last{/if}">
    <div class="class-article float-break">

{def $image_class=listitem $show_topic=0 $show_annotation=1 $show_image=0
}

{def $person=$node.data_map.person
     $image=cond( $person.content.data_map.image.has_content, $person.content.data_map.image, 
		  $node.data_map.image.has_content, $node.data_map.image) 
}

{if $image.has_content}
{* $image | attribute(show, 1 ) *}
{/if}

        {section show=and($image.has_content, $show_image)}
        <div class="attribute-image">
            {attribute_view_gui image_class=$image_class href=$node.url_alias|ezurl attribute=$image}
        </div>
        {/section}

    <h3><a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash}</a></h3>

	{section show=$node.data_map.person.content}
	<div class="attribute-byline">
	<p class="author">
		{attribute_view_gui attribute=$node.data_map.person}
	</p>
	</div>
	{/section}

    </div>
</div>

      {/foreach}

{** Restore current $node **}	  
{def $node = $tmp_node}


</div><!-- /sect #best -->
{/if} {* /if $bestblock_array *}

<div id="searchbox">
<form action="/content/advancedsearch">
<input type="hidden" name="SearchPageLimit" value="5" />
<img id="searchtitle" src={"images/search.gif"|ezdesign} width="71" height="28" border="0" alt="">
<label for="searchtext" class="hide">Search text:</label>
<input id="searchtext" name="SearchText" type="text" value="" size="12" />
<!-- <input id="searchbutton" class="button" type="submit" value='{"Search"|i18n("design/base")}' alt="Submit" /> -->
<input id="searchbutton" class="button" type="image" src={"images/go.gif"|ezdesign} value='{"Search"|i18n("design/base")}' alt='{"Search"|i18n("design/base")}' width="28"  height="28">
{* <!-- 	<img src="images/go.gif" width="28" height="28" border="0" alt=""> --> *}
</form>
</div>

{*** WORKBOOKS - 72267  ***}
{def 
	$block = fetch( 'content', 'node', hash( 'node_id', '72267' ) )
	$block_name = $block.name	
}
{* $block|attribute(show,1) *}

    {def $children = array()
         $limit = or($block.object.data_map.limit_on_morda.value, 1)
         $offset = 0}
{* <!-- $current_top_razdel.url_alias: '{$current_top_razdel.url_alias}' --> *}
	{if $current_top_razdel.node_id|eq('225')}{def $limit=5}{/if} {* Themes *}
    {set $children=fetch( content, list, hash( 'parent_node_id', $block.node_id, 
                                               'limit', $limit,
                                               'offset', $offset,
                                               'class_filter_type', 'include',
                                               'class_filter_array', array( 'article', 'link'),
                                               'sort_by', $block.sort_array ) ) }

    {if $children|count()}
    <div class="content-view-children float-break" id="workbook">
    {foreach $children as $child}
         {node_view_gui view=frontpage content_node=$child image_class=articleimage title=0 fullwidth=1}
         {delimiter}
             {include uri='design:content/datatype/view/ezxmltags/separator.tpl'}
         {/delimiter}
    {/foreach}
    </div>
    {/if}
{*** WORKBOOKS END ***}


{*** KNIGA - 2499 ***}
{def 
	$block = fetch( 'content', 'node', hash( 'node_id', '2499' ) )
	$block_name = $block.name	
}
{* $block|attribute(show,1) *}

    {def $children = array()
         $limit = or($block.object.data_map.limit_on_morda.value, 2)
         $offset = 0}
{* <!-- $current_top_razdel.url_alias: '{$current_top_razdel.url_alias}' --> *}
	{if $current_top_razdel.node_id|eq('225')}{def $limit=5}{/if} {* Themes *}
    {set $children=fetch( content, list, hash( 'parent_node_id', $block.node_id, 
                                               'limit', $limit,
                                               'offset', $offset,
                                               'class_filter_type', 'include',
                                               'class_filter_array', array( 'article', 'news'),
                                               'sort_by', $block.sort_array ) ) }

    {if $children|count()}
    <div class="content-view-children float-break" id="book">
    {foreach $children as $child}
         {node_view_gui view=frontpage content_node=$child image_class=articleimage title=0 fullwidth=0}
    {/foreach}
    </div>
    {/if}
	<div><iframe src="http://www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Frussmagazine&amp;width=190&amp;colorscheme=light&amp;show_faces=true&amp;border_color&amp;stream=false&amp;header=true&amp;height=415" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:190px; height:415px;" allowTransparency="true"></iframe></div>
</div>
