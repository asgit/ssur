{*?template charset="koi8-r"?*}<!-- -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$site.http_equiv.Content-language|wash}" lang="{$site.http_equiv.Content-language|wash}" xmlns:og="http://opengraphprotocol.org/schema/" xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
{def $basket_is_empty   = cond( $current_user.is_logged_in, fetch( shop, basket ).is_empty, 1 )
     $current_node_id   = first_set( $module_result.node_id, 0 )
     $user_hash         = concat( $current_user.role_id_list|implode( ',' ), ',', $current_user.limited_assignment_value_list|implode( ',' ) )
     $user_id           = $current_user.contentobject_id}

{if and( $current_node_id|eq(0), is_set( $module_result.path.0 ) , is_set( $module_result.path[$module_result.path|count|dec].node_id ) )}
    {set $current_node_id = $module_result.path[$module_result.path|count|dec].node_id}
{/if}
<!-- cache_ttl: {$module_result.cache_ttl} -->
{def $pagestyle        = 'nosidemenu noextrainfo'
     $locales          = fetch( 'content', 'translation_list' )
     $pagerootdepth    = ezini( 'SiteSettings', 'RootNodeDepth', 'site.ini' )
     $indexpage        = ezini( 'NodeSettings', 'RootNode', 'content.ini' )
     $infobox_count    = 0
     $path_normalized  = ''
     $path_array       = array()
     $pagedesign_class = fetch( 'content', 'class', hash( 'class_id', 'template_look' ) )
     $pagedepth        = $module_result.path|count
     $content_info     = hash()
}

{if $pagedesign_class.object_count|eq( 0 )|not}
    {def $pagedesign = $pagedesign_class.object_list[0]}
{/if}

{if is_set( $module_result.content_info )}
    {set $content_info = $module_result.content_info}
{/if}


{if is_set($module_result.node_id)}
	{include uri="design:parts/opengraph.tpl" node_id=$module_result.node_id}
{/if}
{include uri='design:page_head.tpl'}


<style type="text/css">
    @import url({"stylesheets/core.css"|ezdesign(no)});
    @import url({"stylesheets/debug.css"|ezdesign(no)});
    @import url({"stylesheets/pagelayout.css"|ezdesign(no)});
    @import url({"stylesheets/content.css"|ezdesign(no)});
    {foreach ezini( 'StylesheetSettings', 'CSSFileList', 'design.ini' ) as $css_file}
    @import url({concat( 'stylesheets/', $css_file )|ezdesign});
    {/foreach}
    @import url({ezini('StylesheetSettings','ClassesCSS','design.ini')|ezroot(no)});
    @import url({ezini('StylesheetSettings','SiteCSS','design.ini')|ezroot(no)});

    @import url({"stylesheets/custom.css"|ezdesign});
</style>

{section name=JavaScript loop=ezini( 'JavaScriptSettings', 'JavaScriptList', 'design.ini' ) }
    <script language="JavaScript" type="text/javascript" src={concat( 'javascript/',$:item )|ezdesign}></script>
{/section}

{literal}
<!-- IE conditional comments; for bug fixes for different IE versions -->
<!--[if IE 5]>     <style type="text/css"> @import url({"stylesheets/browsers/ie5.css"|ezdesign(no)});    </style> <![endif]-->
<!--[if lte IE 7]> <style type="text/css"> @import url({"stylesheets/browsers/ie7lte.css"|ezdesign(no)}); </style> <![endif]-->
{/literal}

</head>
<body>
<!-- Complete page area: START -->
{if $pagerootdepth|not}
    {set $pagerootdepth = 1}
{/if}

{set $pagestyle = 'nosidemenu rightcol'}

{if is_set($module_result.section_id)}
    {set $pagestyle = concat( $pagestyle, " section_id_", $module_result.section_id )}
{/if}

{foreach $module_result.path as $index => $path}
    {if $index|ge($pagerootdepth)}
        {set $path_array = $path_array|append($path)}
    {/if}
    {if is_set($path.node_id)}
        {set $path_normalized = $path_normalized|append( concat('subtree_level_', $index, '_node_id_', $path.node_id, ' ' ))}
    {/if}
{/foreach}

<div id="pagemenu" class="float-break">
|<a href="http://russ.ru/"  onclick="this.style.behavior='url(#default#homepage)'; this.setHomePage(document.location.href); return false;">������� ���������</a>|<a href="/about">� �������</a>|<a href="/subscribe">��������</a>|
</div>

{* <!-- Change between "sidemenu"/"nosidemenu" and "extrainfo"/"noextrainfo" to switch display of side columns on or off  --> *}
<div id="page" class="{$pagestyle} {$path_normalized|trim()} current_node_id_{$current_node_id}">

{cache-block keys=$uri_string}
<div id="header" class="float-break">
<!-- <div id="logo_absolute"><a href="/"><img src={"images/logo_russ_ru.gif"|ezdesign} width="140" height="110" border="0" alt=""></a></div>
 -->
	<div id="header-design" class="float-break">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td width="193">		
	<div id="logo"><a href="/"><img src={"images/logo_russ_ru.gif"|ezdesign} width="140" height="110" border="0" alt=""></a></div>
	</td>
	<td align="center">
{def $morda_node_id = 2}
{def $morda_node=fetch( content, node, hash( node_id, $morda_node_id ))}
<!-- $morda_node_id: {$morda_node_id} -->


<!--/* OpenX Javascript Tag v2.8.8 */-->
<script type='text/javascript'><!--//<![CDATA[
   var m3_u = (location.protocol=='https:'?'https://ads.russ.ru/www/delivery/ajs.php':'http://ads.russ.ru/www/delivery/ajs.php');
   var m3_r = Math.floor(Math.random()*99999999999);
   if (!document.MAX_used) document.MAX_used = ',';
   document.write ("<scr"+"ipt type='text/javascript' src='"+m3_u);
   document.write ("?campaignid=3");
   document.write ('&amp;cb=' + m3_r);
   if (document.MAX_used != ',') document.write ("&amp;exclude=" + document.MAX_used);
   document.write (document.charset ? '&amp;charset='+document.charset : (document.characterSet ? '&amp;charset='+document.characterSet : ''));
   document.write ("&amp;loc=" + escape(window.location));
   if (document.referrer) document.write ("&amp;referer=" + escape(document.referrer));
   if (document.context) document.write ("&context=" + escape(document.context));
   if (document.mmm_fo) document.write ("&amp;mmm_fo=1");
   document.write ("'><\/scr"+"ipt>");
//]]>--></script><noscript><a href='http://ads.russ.ru/www/delivery/ck.php?n=a5454edc' target='_blank'><img src='http://ads.russ.ru/www/delivery/avw.php?campaignid=3&amp;n=a5454edc' border='0' alt='' /></a></noscript>

</td>
	<td width="220">
		<div id="logo_en"><a href="/"><img src={"images/logo_russ_en.gif"|ezdesign} width="140" height="110" border="0" alt=""></a></div>
	</td>
</tr>
</table>
	</div>
    
{* Our Mission, Mirovaya-povestka,  Problemnoe Pole,  Academ, Pushkin,
Redaktsyja - 106906, RJ-Newsletter - 87924, Workbooks - 72267, *} 
{def $topmenu = array( 2518, 2491, 2493, 106905, 111607 )} 

{* $module_result.path.1|attribute(show, 1) *}

{if is_set( $module_result.path.1 ) }
    {def $current_top_razdel_id = $module_result.path[1].node_id}
{/if}
        
    <div id="topmenu">
    <div id="topmenu-design">
        <ul>
{foreach $topmenu as $index=>$topmenu_id}{def $razdel=fetch( content, node, hash( node_id, $topmenu_id ))}<li{if $topmenu_id|eq($current_top_razdel_id)} class="selected"{/if}><div class="spacing"><a href={$razdel.url_alias|ezurl}>{$razdel.name}</a></div></li>
{/foreach}		
{* <!-- 
<li ><div class="spacing"><a href="/about">Our mission</a></div></li>
<li ><div class="spacing"><a href="/Mirovaya-povestka">������� ��������</a></div></li>
<li ><div class="spacing"><a href="/editorial">��������</a></div></li>
<li ><div class="spacing"><a href="/newsletter">��-Newsletter</a></div></li>
<li ><div class="spacing"><a href="/workbooks">�� ������� �������</a></div></li>
<li ><div class="spacing"><a href="/pushkin">������ &quot;������&quot;</a></div></li>
<li ><div class="spacing"><a href="http://states2008.russ.ru/">�����-2008</a></div></li>
<li ><div class="spacing"><a href="/pushkin">������ &quot;������&quot;</a></div></li>
<li ><div class="spacing"><a href="/academ">������������� ��������</a></div></li>
 --> *}
<li ><div class="spacing"><a href="http://europublish.ru/">������������ &quot;������&quot;</a></div></li>
<li ><div class="spacing"><a href="http://magazines.russ.ru">���������� ���</a></div></li>
<li class="last"><div class="spacing"><a href="http://old.russ.ru">������</a></div></li>
		</ul>
        	<div class="break"></div>
    </div>
	</div>
<hr class="hide" />

{* <!-- 
	<div id="topmenu">
    {menu name=TopMenu}
	</div>
 --> *}

</div>{* id="header" *}
{/cache-block}

  <!-- Columns area: START -->
  <div id="columns" class="float-break">
    <!-- Main area: START -->
    <div id="main-position">
      <div id="main" class="float-break">
        <div class="overflow-fix">
          <!-- Main area content: START -->
          {$module_result.content}
          <!-- Main area content: END -->
        </div>
      </div>
    </div>
    <!-- Main area: END -->
{cache-block keys=array($uri_string)}
    <div id="rightcol-position"><!-- Right Column area: START -->
      <div id="rightcol">
	  	{include uri='design:rightcol.tpl'}
      </div>
    </div><!-- Right Column area: END -->
  </div> <!-- Columns area: END -->
{/cache-block}

{cache-block keys=array($uri_string)}
  {if is_unset($pagedesign)}
      {if is_unset($pagedesign_class)}
          {def $pagedesign_class = fetch( 'content', 'class', hash( 'class_id', 'template_look' ) )}
      {/if}
      {if $pagedesign_class.object_count|gt( 0 )}
          {def $pagedesign = $pagedesign_class.object_list[0]}
      {/if}
  {/if}
</div>
{include uri='design:page_footer.tpl'}
<!-- Complete page area: END -->
{/cache-block}

<!-- cache_ttl: {$module_result.cache_ttl} -->

{* This comment will be replaced with actual debug report (if debug is on). *}
<!--DEBUG_REPORT-->
</body>
</html>
