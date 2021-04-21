<?php
require_once('configs/config.php');

// Директория
global $cwd;
global $AoWoWconf;

$cwd = str_replace("\\", "/", getcwd());

// загружаем библиотеку Smarty
require_once('includes/Smarty-3.1.39/libs/Smarty.class.php');
class Smarty_AoWoW extends Smarty
{
		function Smarty_AoWoW()
		{
			global $cwd;
			global $AoWoWconf;

			parent::__construct();//parent::Smarty(); //$this->Smarty();

			// Папки с шаблонами, кэшом шаблонов и настройками
			$this->setTemplateDir($cwd.'/templates/'.$AoWoWconf['aowow']['template'].'/');
			$this->setCompileDir($cwd.'/cache/templates/'.$AoWoWconf['aowow']['template'].'/');
			$this->setConfigDir($cwd.'/configs/');
			$this->setCacheDir($cwd.'/cache/');
			// Режим отладки
			$this->debugging = $AoWoWconf['debug'];
			// Разделители
			$this->left_delimiter = '{';
			$this->right_delimiter = '}';
			// Общее Кэширование, для этого сайта не работает
			$this->caching = false;
			// Имя сайта
			$this->assign('app_name', $AoWoWconf['aowow']['name']);
			// Ревизия
			$this->assign('AOWOW_REVISION', AOWOW_REVISION);
		}

		function uDebug($name, $val = 'unset')
		{
			$this->append($name,$val);
		}
}

// Объект шаблонизатора
$smarty = new Smarty_AoWoW('wowhead');

?>