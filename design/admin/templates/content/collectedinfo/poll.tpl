{set-block scope=global variable=title}{'Poll %pollname'|i18n( 'design/admin/content/collectedinfo/poll',, hash( '%pollname', $node.name ) )|wash}{/set-block}

{section show=$error}

{section show=$error_anonymous_user}
<div class="message-warning">
    <h2><span class="time">[{currentdate()|l10n( shortdatetime )}]</span> {'Anonymous users are not allowed to vote in this poll. Please log in.'|i18n('design/admin/content/collectedinfo/poll')}</h2>
</div>
{/section}

{section show=$error_existing_data}
<div class="message-warning">
    <h2><span class="time">[{currentdate()|l10n( shortdatetime )}]</span> {'You have already voted in this poll.'|i18n('design/admin/content/collectedinfo/poll')}</h2>
</div>
{/section}

{/section}

<div class="context-block">

{* DESIGN: Header START *}<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">

<h1 class="context-title">{'Poll results'|i18n( 'design/admin/content/collectedinfo/poll' )}</h1>

{* DESIGN: Mainline *}<div class="header-mainline"></div>

{* DESIGN: Header END *}</div></div></div></div></div></div>

{* DESIGN: Content START *}<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-bl"><div class="box-br"><div class="box-content">

{section var=Attributes loop=$object.contentobject_attributes}
    {section show=$Attributes.item.contentclass_attribute.is_information_collector}

        <div class="block">
        <label>{$Attributes.item.contentclass_attribute.name|wash}:</label>
        {attribute_result_gui view=count attribute=$Attributes.item}
        </div>

    {section-else}

        {section show=$attribute_hide_list|contains( $Attributes.item.contentclass_attribute.identifier )|not}
            <div class="block">
            <label>{$Attributes.item.contentclass_attribute.name|wash}:</label>
            {attribute_view_gui attribute=$Attributes.item}
            </div>
        {/section}

    {/section}

{/section}
<div class="block">
<p>{'%count total votes'|i18n( 'design/admin/content/collectedinfo/poll',, hash( '%count', fetch( content, collected_info_count, hash( object_id, $object.id ) ) ) )}</p>
</div>

{* DESIGN: Content END *}</div></div></div></div></div></div>

</div>
