{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{default with_children=true()
         is_editable=true()
	 is_standalone=true()}

{let page_limit=3
     list_count=and($with_children,fetch('content','list_count',hash(parent_node_id,$node.node_id)))}

{default content_object=$node.object}

{section show=$assignment}
   {node_view_gui view=full with_children=false() versionview_mode=true() is_editable=false() is_standalone=false() content_object=$object node_name=$object.name content_node=$assignment.temp_node node=$node}
{section-else}
  {node_view_gui view=full with_children=false() versionview_mode=true() is_editable=false() is_standalone=false() content_object=$object node_name=$object.name content_node=$node node=$node}
{/section}

<form method="post" action={concat("content/versionview/",$object.id,"/",$object_version,"/",$language)|ezurl}>

{section show=$allow_change_buttons}
<div class="block">
{section show=$version.language_list|count|gt(1)}
<div class="element">
<label>{"Translation"|i18n("design/standard/content/view")}</label><div class="labelbreak"></div>

<select name="SelectedLanguage" >
{section name=Translation loop=$version.language_list}
<option value="{$Translation:item.locale.locale_code}" {section show=eq($Translation:item.locale.locale_code,$object_languagecode)}selected="selected"{/section}>{$Translation:item.locale.intl_language_name}</option>
{/section}
</select>
</div>

{/section}

{let name=Placement node_assignment_list=$version.node_assignments}
{section show=$Placement:node_assignment_list|count|gt(1)}

<div class="element">
<label>{"Placement"|i18n("design/standard/content/view")}</label><div class="labelbreak"></div>

<select name="SelectedPlacement" >
{section loop=$Placement:node_assignment_list}
<option value="{$Placement:item.id}" {section show=eq($Placement:item.id,$placement)}selected="selected"{/section}>{$Placement:item.parent_node_obj.name|wash}</option>
{/section}
</select>
</div>

{/section}
{/let}

{let name=Sitedesign
   sitedesign_list=fetch('layout','sitedesign_list')}
{section show=$Sitedesign:sitedesign_list|count|gt(1)}

<div class="element">
<label>{"Site Design"|i18n("design/standard/content/view")}</label><div class="labelbreak"></div>

<select name="SelectedSitedesign" >
{section loop=$Sitedesign:sitedesign_list}
<option value="{$Sitedesign:item}" {section show=eq($Sitedesign:item,$sitedesign)}selected="selected"{/section}>{$Sitedesign:item|wash}</option>
{/section}
</select>
</div>

{/section}
<div class="break"></div>
</div>

{section show=or( $version.language_list|count|gt( 1 ),
                  $version.node_assignments|count|gt( 1 ),
                  $Sitedesign:sitedesign_list|count|gt( 1 ) )}
<div class="buttonblock">
<input class="button" type="submit" name="ChangeSettingsButton" value="{'Change'|i18n('design/standard/content/view')}" />
</div>
{/section}
{/let}

<input type="hidden" name="ContentObjectID" value="{$object.id}" />
<input type="hidden" name="ContentObjectVersion" value="{$object_version}" />
<input type="hidden" name="ContentObjectLanguageCode" value="{$object_languagecode}" />
<input type="hidden" name="ContentObjectPlacementID" value="{$placement}" />

<div class="buttonblock">
{section show=and(eq($version.status,0),$is_creator,$object.can_edit)}
<input class="button" type="submit" name="PreviewPublishButton" value="{'Publish'|i18n('design/standard/content/view')}" />
<input class="button" type="submit" name="EditButton" value="{'Edit'|i18n('design/standard/content/view')}" />
{/section}

{section show=$allow_versions_button}
<input class="button" type="submit" name="VersionsButton" value="{'Versions'|i18n('design/standard/content/view')}" />
{/section}
</div>

{/section}
</form>
{/default}
{/let}
{/default}