<div class="content-view-embed">
<div class="class-image">
    <div class="attribute-image">{if is_set( $link_parameters.href )}{attribute_view_gui attribute=$object.data_map.image image_class=$object_parameters.size href=$link_parameters.href|ezurl target=$link_parameters.target}{else}{attribute_view_gui attribute=$object.data_map.image image_class=$object_parameters.size}{/if}</div>

    {if $object.data_map.caption.has_content}
    {if is_set( $object.data_map.image.content[$object_parameters.size].width )}
    <div class="attribute-caption" style="width: {$object.data_map.image.content[$object_parameters.size].width}px"> {else}
        <div class="attribute-caption"> {/if}
            {attribute_view_gui attribute=$object.data_map.caption} </div>
        {/if} </div>
</div>
