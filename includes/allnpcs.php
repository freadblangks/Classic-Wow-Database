<?php
require_once('includes/alllocales.php');
require_once('includes/game.php');

// Для списка creatureinfo()
$npc_cols[0] = array('name', 'subname', 'level_min', 'level_max', 'type', 'rank', 'A','H');
$npc_cols[1] = array('subname', 'level_min', 'level_max', 'type', 'rank', 'health_min', 'health_max', 'mana_min', 'mana_max', 'gold_min', 'gold_max', 'loot_id', 'spell_id1', 'spell_id2', 'spell_id3', 'spell_id4', 'A', 'H', 'dmg_min', 'dmg_max', 'attack_power', 'dmg_multiplier', 'armor');

// Функция информации о создании
function creatureinfo2(&$Row)
{
	global $smarty;
	// Номер создания
	$creature['entry'] = $Row['entry'];
	// Имя создания
	$creature['name'] = localizedName($Row);
	// Заменяем " (1)" на " (героич.)"
	$creature['name'] = str_replace(' (1)', LOCALE_HEROIC, $creature['name']);
	// Подимя создания
	$creature['subname'] = localizedName($Row, 'subname');
	// Min/Max уровни
	$creature['level_min'] = $Row['level_min'];
	$creature['level_max'] = $Row['level_max'];
	// Get Location
	$creature['location'] = getLocation($creature['entry'], "creature");
	// Reaction
	$creature['react'] = ($Row['A']).','.($Row['H']);
	// Тип NPC
	$creature['type'] = $Row['type'];
	// Тег NPC
	$creature['tag'] = str_normalize($Row['subname']);
	// Ранг NPC
	$creature['classification'] = $Row['rank'];

	return $creature;
}

// Функция информации о создании
function creatureinfo($id)
{
	global $DB;
	global $npc_cols;
	$row = $DB->selectRow('
		SELECT ?#, c.entry
		{
			, l.name_loc'.$_SESSION['locale'].' as `name_loc`
			, l.subname_loc'.$_SESSION['locale'].' as `subname_loc`
			, ?
		}
		FROM ?_factiontemplate, creature_template c
		{
			LEFT JOIN (locales_creature l)
			ON l.entry=c.entry AND ?
		}
		WHERE
			c.entry=?d
			AND factiontemplateID=faction_A
		LIMIT 1
		',
		$npc_cols[0],
		($_SESSION['locale']>0)? 1: DBSIMPLE_SKIP,
		($_SESSION['locale']>0)? 1: DBSIMPLE_SKIP,
		$id
	);
	return creatureinfo2($row);
}

?>