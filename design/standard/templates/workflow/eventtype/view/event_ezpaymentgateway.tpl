{* DO NOT EDIT THIS FILE! Use an override template instead. *}

<div class="element">
{let selectedGatewaysTypes=$event.selected_gateways_types}
{"Type"|i18n("design/standard/workflow/eventtype/view")}:

{section show=$selectedGatewaysTypes|contains(-1)}
{"Any"|i18n("design/standard/workflow/eventtype/view")}
{section-else}

{let comma=false()}
{section var=type loop=$event.workflow_type.available_gateways}
{section show=$selectedGatewaysTypes|contains($type.value)}
{section show=$comma}, {/section}
{$type.Name|wash}
{set comma=true()}
{/section}
{/section}
{/let}

{/section}

{/let}
</div>
