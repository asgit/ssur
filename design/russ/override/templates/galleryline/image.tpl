{* Image - Gallery line view *}
<div class="content-view-galleryline">
    <div class="class-image">

    <div class="attribute-name"{if is_set($#image_style)} style="{$#image_style|explode(';').0}"{/if}>
        <p>{$node.name|wash}</p>
    </div>

    <div class="attribute-image"{if is_set($#image_style)} style="{$#image_style}"{/if}>
        <p>{attribute_view_gui attribute=$node.data_map.image image_class=comicslarge}</p>
    </div>

    </div>
</div>
