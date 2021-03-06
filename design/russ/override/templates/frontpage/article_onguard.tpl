{*?template charset="koi8-r"?*}
{* Article on frontpage - Line view *}
{*
 ���������� ���� - 2493
*}
{default image_class=imagefrontpage annotation_limit = 100}
<div class="content-view-line" id="onguard">
	<div class="class-article float-break">
	{def $person=$node.data_map.person
	     $image=cond( 
			  $node.data_map.image.has_content, $node.data_map.image)
	}
	{if $node.node_id|eq(106926)}{* $image.content | attribute(show, 1) *}{/if}
	{section show=$image.has_content}
		<div class="attribute-image"><img src={$node.data_map.image.content[onephoto_thumbnail].full_path|ezroot()} height="320" /></div>{/section}
    <div class="one_photo_frame"></div>
    <a class="one_photo_frame_link" href={$node.url_alias|ezurl}></a>
    <div class="one_photo_caption">
		<div class="one_photo_caption_text">
			{section show=$node.data_map.person.content}<a href={$person.content.main_node.url_alias|ezurl} class="one_photo_author">{attribute_view_gui attribute=$node.data_map.person link=false() }</a>{/section}
			{section show=$node.data_map.intro.content.is_empty|not}<div class="attribute-short float-break">{attribute_view_gui attribute=$node.data_map.intro href=$node.url_alias|ezurl}</div>{/section}
		</div>
	</div>
	<div class="one_photo_date">{$node.object.published|datetime( 'custom', '%j %F')}</div>
	</div>
</div>