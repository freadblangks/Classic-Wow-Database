{include file='header.tpl'}	
<div id="main">		
	<div id="main-precontents"></div>		
	<div id="main-contents" class="main-contents">			
	<script type="text/javascript">				
	{if $ss_conf!=null}{include file='bricks/screenshots_table.tpl'}{/if}
				{include file='bricks/allcomments.tpl'}
				var g_pageInfo = {ldelim}type: 1, typeId: {$npc.entry}, name: '{$npc.name|escape:"quotes"}'{rdelim};
				g_initPath([0,4,{$npc.type}]);
			</script>
			{include file='bricks/info.tpl'}
			{if $npc.entry!=null}<table class="infobox">
				<tr><th>{#Quick_Facts#}</th></tr>
				<tr><td><div class="infobox-spacer"></div><div id="markup-e826d6c6"></div>
				<script type="text/javascript">Markup.printHtml("{strip}[ul]
					[li]{#Level#}: {if $npc.level_min<>$npc.level_max}{$npc.level_min} - {/if}{$npc.level_max}[/li]
					[li]{#Classification#}: [span{if $npc.rank==Boss} class=\"icon-boss\"{/if}]{$npc.rank}[/span][/li]
					[li]{#React#}: [span class=\"q{if $npc.A==-1}10{elseif $npc.A==1}2{else}{/if}\"]A[/span] [span class=\"q{if $npc.H==-1}10{elseif $npc.H==1}2{else}{/if}\"]H[/span][/li]
					[li]{#Faction#}: [url=\"?faction={$npc.faction_num}\"]{$npc.faction}[/url][/li]
					[li]{#Health#}: {if $npc.health_min<>$npc.health_max}{$npc.health_min} - {/if}{$npc.health_max}[/li]
					{if $npc.mana > 0}[li]{#Mana#}: {if $npc.minmana<>$npc.maxmana}{$npc.minmana} - {/if}{$npc.maxmana}[/li]{/if}
					{if $npc.money > 0}[li]{#Wealth#}: [tooltip=tooltip_avgmoneydropped][money={$npc.money}][/tooltip][/li]{/if}
					[li]{#Damage#}: {$npc.dmg_min} - {$npc.dmg_max} [span class=\"school-{$npc.dmgschool}\"]({$npc.school})[/span][/li]
					{if $npc.armor > 0}[li]{#Armor#}: {$npc.armor}[/li]{/if}
					[li]{#Model#}: {$npc.model}[/li]
					{if $npc.scripted}[li][tooltip=mangos_npc_scripted_{if $npc.scripted==mob_eventai}eai{else}sd2{/if}][color=green]{#Scripted#}[/color][/tooltip][/li]{/if}[/ul]{/strip}", "markup-e826d6c6");</script>
					</td></tr>
						{if $ss_conf!= null}
						<th>{#Screenshots#}<span id="ss_num"></span>
						<div id="infobox-sticky" class="infobox-sticky"></div>
						<script type="text/javascript">ss_appendSticky()</script>
						</th>
						{/if}
			</table>{/if}
			<div class="text">
				{if $option.wp_button==1}<a {if $npc.entry!=null} onmouseover="Tooltip.showAtCursor(event, '<sub><img width=15 src=templates/wowhead/images/wowpedia.ico></sub> {#Wsearch#} {"WoWpedia.org"}', 0, 0, 'q')" onmousemove="Tooltip.cursorUpdate(event)" onmouseout="Tooltip.hide()" href="https://www.wowpedia.org/index.php?title=Special:Search&amp;search={$npc.name}&amp;go=Go"{/if} class="button-red{if $npc.entry==null}-disabled{/if}"><em><b><i>Wowpedia</i></b><span>Wowpedia</span></em></a>{/if}
				{if $option.wh_button==1}<a {if $option.wh_tooltip==1}rel="wowhead" href="https://www.wowhead.com/?{$query}"{else}onmouseover="Tooltip.showAtCursor(event, '<sub><img width=15 src=templates/wowhead/images/wowhead.png></sub> {#Wsearch#} {"Wowhead.com"}', 0, 0, 'q')" onmousemove="Tooltip.cursorUpdate(event)" onmouseout="Tooltip.hide()" href="https://www.wowhead.com/{$query}"{/if} class="button-red"><em><b><i>Wowhead</i></b><span>Wowhead</span></em></a>{/if}
				{if $option.button==1}
					<a {if $npc.entry!=null} id="dsgndslgn464d" onclick="this.blur();ModelViewer.show({ldelim}type: 1,typeId: {$npc.entry},displayId: {$npc.model}{rdelim})"{/if} class="button-red{if $npc.entry==null}-disabled{/if}"><em><b><i>{#Viewin3D#}</i></b><span>{#Viewin3D#}</span></em></a>{/if}
				{if $npc.entry!=null}<h1>{$npc.name}{if $npc.subname} &lt;{$npc.subname}&gt;{/if}</h1>
				<div id="minibox"></div>
					{if $option.image==1}
						<script type="text/javascript">Markup.printHtml("[minibox][modelviewer img=https://wow.zamimg.com/modelviewer/thumbs/npc/{$npc.model}.png npc={$npc.model} {if $npc.type==7}humanoid=1{/if}]{$npc.name} {#Viewin3D#}", "minibox");</script>
					{elseif $option.image==2}
						<script type="text/javascript">Markup.printHtml("[minibox][img src=https://wow.zamimg.com/modelviewer/thumbs/npc/{$npc.model}.png]", "minibox");</script>
					{/if}
				{else}<br><div class="inputbox"><h1><b>{$npc.name}</b></h1><div id="inputbox-error"><br><span class=q10>This NPC doesn't exist in our database</span>.</div><!--  --></div><br>{/if}{if $npc.entry!=null}{if $npc.heroic}
				<div>{if $npc.heroic.type == 1}{#This_is_heroic_NPC#}{else}{#This_is_normal_NPC#}{/if} <a href="?npc={$npc.heroic.entry}">{$npc.heroic.name}</a>.</div>
				<div class="pad"></div>{/if}{if $npc.position}
				<div>{#This_NPC_can_be_found_in#} {strip}<span id="locations">
					{foreach from=$npc.position item=zone name=zone}
						<a href="javascript:;" onclick="
						{if $zone.atid}
							myMapper.update(
								{ldelim}
									zone:{$zone.atid}
									{if $zone.points}
										,
									{/if}
								{if $zone.points}
									coords:[
										{foreach from=$zone.points item=point name=point}
												[{$point.x},{$point.y},
												{ldelim}
													label:'$<br>
													<div class=q0>
														<small>
															{if isset($point.rmin)}
																{#Respawn#}:
																{if isset($point.rmin.h)} {$point.rmin.h}{#hr#}{/if}
																{if isset($point.rmin.m)} {$point.rmin.m}{#min#}{/if}
																{if isset($point.rmin.s)} {$point.rmin.s}{#sec#}{/if}
																{if isset($point.rmax)}	
																	&nbsp;to
																	{if isset($point.rmax.h)} {$point.rmax.h}{#hr#}{/if}
																	{if isset($point.rmax.m)} {$point.rmax.m}{#min#}{/if}
																	{if isset($point.rmax.s)} {$point.rmax.s}{#sec#}{/if}
																{/if}
															{else}
																{#Waypoint#}															{/if}															{if isset($point.events)}<br>{$point.events|escape:"quotes"}{/if}														</small>													</div>',type:'{$point.type}'												{rdelim}]												{if !$smarty.foreach.point.last},{/if}										{/foreach}									]								{/if}								{rdelim});							ge('mapper-generic').style.display='block';						{else}							ge('mapper-generic').style.display='none';						{/if}								g_setSelectedLink(this, 'mapper'); return false" onmousedown="return false">							{$zone.name}</a>{if $zone.population > 1}&nbsp;({$zone.population}){/if}{if $smarty.foreach.zone.last}.{else}, {/if}					{/foreach}				</span></div>{/strip}
				<div id="mapper-generic"></div>
				{if ($npc.kill_rep_value1 or $npc.kill_rep_value2)}
					<div class="clear"></div>
						<div><h3>{#Onkill#}: </h3>{strip}
							{if $npc.kill_rep_value1}<li>{$npc.kill_rep_value1|string_format:"%+d"} {#reputationwith#} <a href="?faction={$npc.kill_rep_faction_id1}">{$npc.kill_rep_faction1}</a> {#until#} {$npc.kill_rep_until1}{/if}
							{if ($npc.kill_rep_value1 and $npc.kill_rep_value2)}<span style="visibility: hidden;">{#Onkill#}: </span>{/if}
 							{if $npc.kill_rep_value2}<li>{$npc.kill_rep_value2|string_format:"%+d"} {#reputationwith#} <a href="?faction={$npc.kill_rep_faction_id2}">{$npc.kill_rep_faction2}</a> {#until#} {$npc.kill_rep_until2}{/if}
                                                {/strip}</div></li>{/if}
				<div class="clear"></div>
				<script type="text/javascript">
					var myMapper = new Mapper({ldelim}parent: 'mapper-generic', zone: '{$npc.position[0].atid}'{rdelim});
					gE(ge('locations'), 'a')[0].onclick();
				</script>{else}
				{#This_NPC_cant_be_found#}{/if}
				<h2>{#Related#}</h2>
			</div>
			<div id="tabs-generic"></div>
			<div id="listview-generic" class="listview"></div><script type="text/javascript">var tabsRelated = new Tabs({ldelim}parent: ge('tabs-generic'){rdelim});
{if isset($npc.sells)}{include 			file='bricks/item_table.tpl'			id='sells'				name='sells'			tabsid='tabsRelated' data=$npc.sells			}{/if}
{if isset($npc.drop)}{include 			file='bricks/item_table.tpl'			id='drop'				name='drops'			tabsid='tabsRelated' data=$npc.drop				}{/if}
{if isset($npc.pickpocketing)}{include	file='bricks/item_table.tpl'			id='pick-pocketing'		name='pickpocketing'	tabsid='tabsRelated' data=$npc.pickpocketing	}{/if}
{if isset($npc.skinning)}{include		file='bricks/item_table.tpl'			id='skinning'			name='skinning'			tabsid='tabsRelated' data=$npc.skinning			}{/if}
{if isset($npc.starts)}{include			file='bricks/quest_table.tpl'			id='starts'				name='starts'			tabsid='tabsRelated' data=$npc.starts			}{/if}
{if isset($npc.ends)}{include			file='bricks/quest_table.tpl'			id='ends'				name='ends'				tabsid='tabsRelated' data=$npc.ends				}{/if}
{if isset($npc.abilities)}{include		file='bricks/spell_table.tpl'			id='abilities'			name='abilities'		tabsid='tabsRelated' data=$npc.abilities		}{/if}
{if isset($npc.objectiveof)}{include	file='bricks/quest_table.tpl'			id='objective-of'		name='objectiveof'		tabsid='tabsRelated' data=$npc.objectiveof		}{/if}
{if isset($npc.teaches)}{include		file='bricks/spell_table.tpl'			id='teaches-ability'	name='teaches'			tabsid='tabsRelated' data=$npc.teaches			}{/if}
{if isset($npc.criteria_of)}{include 	file='bricks/achievement_table.tpl' 	id='criteria-of'		name='criteriaof'		tabsid='tabsRelated' data=$npc.criteria_of		}{/if}
new Listview({ldelim}template: 'comment', id: 'comments', name: LANG.tab_comments, tabs: tabsRelated, parent: 'listview-generic', data: allCommentz{rdelim});{if $ss_conf<=2  && $ss_conf != null}new Listview({ldelim}template: 'screenshot', id: 'screenshots', name: LANG.tab_screenshots, tabs: tabsRelated, parent: 'listview-generic', data: lv_screenshots{rdelim});{/if}tabsRelated.flush();</script>{include file='bricks/contribute.tpl'}{/if}
			<div class="clear"></div>
			</div>
		</div>
	</div>{include file='footer.tpl'}