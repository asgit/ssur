{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{section show=$error_list|count|gt( 0 )}
<div class="message-error">
<ul>
{section var=error loop=$error_list}
    <li>{section show=$error.item.field}<em class="field">{$error.item.field|wash}:</em> {/section}{$error.item.description|wash}</li>
{/section}
</ul>
</div>
{/section}
