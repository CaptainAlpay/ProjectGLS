<?php

/**
 * The single function this file contains is used to display the main
 * board index.
 *
 * Simple Machines Forum (SMF)
 *
 * @package SMF
 * @author Simple Machines http://www.simplemachines.org
 * @copyright 2012 Simple Machines
 * @license http://www.simplemachines.org/about/smf/license.php BSD
 *
 * @version 2.1 Alpha 1
 */

if (!defined('SMF'))
	die('Hacking attempt...');

/**
 * This function shows the board index.
 * It uses the BoardIndex template, and main sub template.
 * It updates the most online statistics.
 * It is accessed by ?action=boardindex.
 */
function BoardIndex()
{
	global $txt, $user_info, $sourcedir, $modSettings, $context, $settings, $scripturl;

	loadTemplate('BoardIndex');

	// Set a canonical URL for this page.
	$context['canonical_url'] = $scripturl;

	// Do not let search engines index anything if there is a random thing in $_GET.
	if (!empty($_GET))
		$context['robot_no_index'] = true;

	// Retrieve the categories and boards.
	require_once($sourcedir . '/Subs-BoardIndex.php');
	$boardIndexOptions = array(
		'include_categories' => true,
		'base_level' => 0,
		'parent_id' => 0,
		'set_latest_post' => true,
		'countChildPosts' => !empty($modSettings['countChildPosts']),
	);
	$context['categories'] = getBoardIndex($boardIndexOptions);

	// Get the user online list.
	require_once($sourcedir . '/Subs-MembersOnline.php');
	$membersOnlineOptions = array(
		'show_hidden' => allowedTo('moderate_forum'),
		'sort' => 'log_time',
		'reverse_sort' => true,
	);
	$context += getMembersOnlineStats($membersOnlineOptions);

	$context['show_buddies'] = !empty($user_info['buddies']);

	// Are we showing all membergroups on the board index?
	if (!empty($settings['show_group_key']))
		$context['membergroups'] = cache_quick_get('membergroup_list', 'Subs-Membergroups.php', 'cache_getMembergroupList', array());

	// Track most online statistics? (Subs-MembersOnline.php)
	if (!empty($modSettings['trackStats']))
		trackStatsUsersOnline($context['num_guests'] + $context['num_spiders'] + $context['num_users_online']);

	// Retrieve the latest posts if the theme settings require it.
	if (isset($settings['number_recent_posts']) && $settings['number_recent_posts'] > 1)
	{
		$latestPostOptions = array(
			'number_posts' => $settings['number_recent_posts'],
		);
		$context['latest_posts'] = cache_quick_get('boardindex-latest_posts:' . md5($user_info['query_wanna_see_board'] . $user_info['language']), 'Subs-Recent.php', 'cache_getLastPosts', array($latestPostOptions));
	}

	$settings['display_recent_bar'] = !empty($settings['number_recent_posts']) ? $settings['number_recent_posts'] : 0;
	$settings['show_member_bar'] &= allowedTo('view_mlist');
	$context['show_stats'] = allowedTo('view_stats') && !empty($modSettings['trackStats']);
	$context['show_member_list'] = allowedTo('view_mlist');
	$context['show_who'] = allowedTo('who_view') && !empty($modSettings['who_enabled']);

	$context['page_title'] = sprintf($txt['forum_index'], $context['forum_name']);

	// Mark read button
	$context['mark_read_button'] = array(
		'markread' => array('text' => 'mark_as_read', 'image' => 'markread.png', 'lang' => true, 'url' => $scripturl . '?action=markasread;sa=all;' . $context['session_var'] . '=' . $context['session_id']),
	);

	// Allow mods to add additional buttons here
	call_integration_hook('integrate_mark_read_button');
}

/**
 * Collapse or expand a category
 */
function CollapseCategory()
{
	global $user_info, $sourcedir, $context;

	// Just in case, no need, no need.
	$context['robot_no_index'] = true;

	checkSession('request');

	if (!isset($_GET['sa']))
		fatal_lang_error('no_access', false);

	// Check if the input values are correct.
	if (in_array($_REQUEST['sa'], array('expand', 'collapse', 'toggle')) && isset($_REQUEST['c']))
	{
		// And collapse/expand/toggle the category.
		require_once($sourcedir . '/Subs-Categories.php');
		collapseCategories(array((int) $_REQUEST['c']), $_REQUEST['sa'], array($user_info['id']));
	}

	// And go back to the board index.
	BoardIndex();
}

?>