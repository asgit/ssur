{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<div class="toolbar-item {$placement}">
    {section show=or($show_subtree|count_chars()|eq(0),
                     fetch(content, node, hash( node_id, $module_result.node_id ) ).path_string|contains( concat( '/', $show_subtree, '/' ) ),
                     $requested_uri_string|begins_with( $show_subtree ))}
    {let bestseller_list=false()}
        {switch match=$module_result.content_info.class_identifier}
        {case match=product}
            {set bestseller_list=fetch( shop, best_sell_list, hash( top_parent_node_id, $DesignKeys:used.parent_node,
                                                              limit, 5 ) )}
        {/case}
        {case match=folder}
            {switch match=$module_result.path[1].node_id}
            {case match=$product_parent_node}
                {set bestseller_list=fetch( shop, best_sell_list, hash( top_parent_node_id, $DesignKeys:used.node,
                                                                  limit, 5 ) )}
            {/case}
            {case}
                {set bestseller_list=fetch( shop, best_sell_list, hash( top_parent_node_id, $product_parent_node,
                                                                  limit, 5 ) )}
            {/case}
            {/switch}
        {/case}
        {case}
            {set bestseller_list=fetch( shop, best_sell_list, hash( top_parent_node_id, $product_parent_node,
                                                              limit, 5 ) )}
        {/case}
        {/switch}
        <div class="toollist">
            <div class="toollist-design">
                <h2>{"Best sellers"|i18n("design/standard/toolbar")}</h2>
                <div class="content-view-children">
                {section var=productObject loop=$bestseller_list sequence=array(bglight,bgdark)}
                    {node_view_gui view=listitem content_node=$productObject.main_node}
                {/section}
                </div>
            </div>
        </div>
    {/let}
    {/section}
</div>