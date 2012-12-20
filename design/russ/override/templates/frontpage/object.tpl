{*?template charset="koi8-r"?*}
{* Frontpage View - Embed Content Object *}
<div class="content-view-embed">
<!-- {$object_parameters.id} -->
{def $lines_test000=hash('video', array(
				'����� ���', '', 
				'��� �����', '',
				'������ ���� �����', '')) 


$lines=hash( 'video', array('����� ���', '/video',
				'��� �����', '/video',
				'������ ���� �����', '/mt/add/video' ),
		'foto', array( '���� ���', '',
				'��� ����', '' ,
				'������ ���� ����', '' ),
		'news', array( '������� � ������', '',
				'��� �������', '',
				'�������� � �������', '' ),
		'indicators', array( 
				'����������', '',
				'', '',
				'������ ���������','' ),
		'today_group', array( 
				'����� ���', '',
				'��� �����', '',
				'����� ���� �����', '' ),
		'poll', array( 
				'�����', '',
				'��� ������', '',
				'������ ���� �����', '' ),
		'activizm', array( 
				'��������', '',
				'', '',
				'������ ��������','' ),
		'blogs', array( 
				'�����', '',
				'��� ��������� �����', '', 
				'������ ���� ����', '' ),
		'letters', array( 
				'������ ������', '',
				'��� ������', '', 
				'������ ������', '' ),
		'forum', array( 
				'���������', '',
				'��� ���������', '', 
				'�������� � ���������', '' ),
		'', 	array( 
				'', '',
				'', '',
				'' ,''),
	)

}

{def
	 $line1=$lines[$object_parameters.id].0
	 $line2=$lines[$object_parameters.id].2
	 $line3=$lines[$object_parameters.id].4
}

{* $lines[$object_parameters.id] |attribute(show, 1) *}


<div class="border-box box-3">
<div class="box-header"><a href="#" class="topics">{$line1}</a> <a href="#" class="alltopics">{$line2}</a></div>

<div class="border-tl"><div class="border-tr"><div class="border-tc">
</div></div></div>
<div class="border-ml"><div class="border-mr"><div class="border-mc float-break">

<!-- <h2 class="custom_block_hdr"><a href={$object.main_node.url_alias|ezurl}>{$object.name|wash()}</a></h2> -->


    {def $children = array()
         $limit = 3
         $offset = 0}

    {if is_set( $object_parameters.limit )}
        {set $limit = $object_parameters.limit}
    {/if}

    {if is_set( $object_parameters.offset )}
        {set $offset = $object_parameters.offset}
    {/if}

    {set $children=fetch( content, list, hash( 'parent_node_id', $object.main_node_id, 
                                               'limit', $limit,
                                               'offset', $offset,
                                               'class_filter_type', 'include',
                                               'class_filter_array', array( 'article', 'gallery', 'poll', 'article_blog' ),
                                               'sort_by', $object.main_node.sort_array ) ) }

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

</div></div></div>
<div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>

<div class="box-footer"><a class="add_comment" href="#">{$line3}</a></div>
</div>

</div>