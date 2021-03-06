{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{*?template charset=latin1?*}

<form method="post" action="{$script}">

  <div align="center">
    <h1>{"Site packages"|i18n("design/standard/setup/init")}</h1>
  </div>

  <p>
    {"Please choose one or more of the demo sites you would like to test or base your sites on. Use Plain if you want to start from scratch."|i18n("design/standard/setup/init")}
  </p>
  
  <table border="0" cellspacing="2" cellpadding="0">
    
    <tr>

    {section name=SiteTemplate loop=$site_templates}
    
      <td class="setup_site_templates">
            {section show=$:item.image_file_name}
              <img src={$:item.image_file_name|ezroot} alt="{$:item.name|wash}" />
              <input type="hidden" name="eZSetup_site_templates[{$:index}][image]" value="{$:item.image_file_name}" />
            {section-else}
              <img src={"design/standard/images/setup/eZ_setup_template_default.png"|ezroot} alt="{$:item.name|wash}" />
              <input type="hidden" name="eZSetup_site_templates[{$:index}][image]" value="" />
            {/section}
      </td>
    {delimiter modulo=4}
      </tr>
      <tr>
      </tr>
	  <td colspan="4">
	    &nbsp;
	  </td>
      <tr>
      {section name=SiteTemplateInner loop=$site_templates max=4}
	  <td align="bottom" class="normal">
	    <input type="checkbox" name="eZSetup_site_templates[{$:index}][checked]" value="{$:item.identifier}">{$:item.name}</input>
            <input type="hidden" name="eZSetup_site_templates[{$:index}][identifier]" value="{$:item.identifier}" />
            <input type="hidden" name="eZSetup_site_templates[{$:index}][name]" value="{$:item.name}" />
	  </td>
      {/section}
      </tr>
      <tr>   
    {/delimiter}
    {/section}
    </tr>

    {section show=count($site_templates)|gt(4)}
    <tr>
        {section name=SiteTemplateInner loop=$site_templates offset=4 max=4}
	  <td align="bottom" class="normal">
	    <input type="checkbox" name="eZSetup_site_templates[{sum(4, $:index)}][checked]" value="{$:item.identifier}">{$:item.name}</input>
            <input type="hidden" name="eZSetup_site_templates[{sum(4, $:index)}][identifier]" value="{$:item.identifier}" />
            <input type="hidden" name="eZSetup_site_templates[{sum(4, $:index)}][name]" value="{$:item.name}" />
	  </td>
        {/section}
    </tr>
    {/section}

    {section show=count($site_templates)|le(4)}
    <tr>
        {section name=SiteTemplateInner loop=$site_templates max=4}
	  <td align="bottom" class="normal">
	    <input type="checkbox" name="eZSetup_site_templates[{$:index}][checked]" value="{$:item.identifier}">{$:item.name}</input>
            <input type="hidden" name="eZSetup_site_templates[{$:index}][identifier]" value="{$:item.identifier}" />
            <input type="hidden" name="eZSetup_site_templates[{$:index}][name]" value="{$:item.name}" />
	  </td>
        {/section}
    </tr>
    {/section}

  </table>      
  
  {include uri="design:setup/persistence.tpl"}

  {include uri='design:setup/init/navigation.tpl'}

</form>
