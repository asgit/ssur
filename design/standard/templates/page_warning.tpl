{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{section show=$warning_list}
<div class="error">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  {section name=Warning loop=$warning_list}
<tr>
    <td>
      <h3 class="error">{section show=$Warning:item.identifier}<a href="#{$Warning:item.identifier}">{/section}{$Warning:item.error.type}::{$Warning:item.error.number}{section show=is_set( $Warning:item.error.count )} [{$Warning:item.error.count}]{/section}{section show=$Warning:item.identifier}</a>{/section}</h3>
      <ul class="error">
        <li>{$Warning:item.text}</li>
      </ul>
    </td>
</tr>
  {/section}
</table>
</div>
{/section}
