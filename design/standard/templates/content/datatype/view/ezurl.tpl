{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{section show=$attribute.data_text}
<a href="{$attribute.content}">{$attribute.data_text|wash( xhtml )}</a>
{section-else}
<a href="{$attribute.content}">{$attribute.content|wash( xhtml )}</a>
{/section}