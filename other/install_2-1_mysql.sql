#### ATTENTION: You do not need to run or use this file!  The install.php script does everything for you!
#### Install script for MySQL 4.0.18+

#
# Table structure for table `admin_info_files`
#

CREATE TABLE {$db_prefix}admin_info_files (
  id_file tinyint(4) unsigned NOT NULL auto_increment,
  filename varchar(255) NOT NULL default '',
  path varchar(255) NOT NULL default '',
  parameters varchar(255) NOT NULL default '',
  data text NOT NULL,
  filetype varchar(255) NOT NULL default '',
  PRIMARY KEY (id_file),
  KEY filename (filename(30))
) ENGINE=MyISAM;

#
# Dumping data for table `admin_info_files`
#

INSERT INTO {$db_prefix}admin_info_files
  (id_file, filename, path, parameters, data, filetype)
VALUES
	(1, 'current-version.js', '/smf/', 'version=%3$s', '', 'text/javascript'),
	(2, 'detailed-version.js', '/smf/', 'language=%1$s&version=%3$s', '', 'text/javascript'),
	(3, 'latest-news.js', '/smf/', 'language=%1$s&format=%2$s', '', 'text/javascript'),
	(4, 'latest-packages.js', '/smf/', 'language=%1$s&version=%3$s', '', 'text/javascript'),
	(5, 'latest-smileys.js', '/smf/', 'language=%1$s&version=%3$s', '', 'text/javascript'),
	(6, 'latest-support.js', '/smf/', 'language=%1$s&version=%3$s', '', 'text/javascript'),
	(7, 'latest-themes.js', '/smf/', 'language=%1$s&version=%3$s', '', 'text/javascript');
# --------------------------------------------------------

#
# Table structure for table `approval_queue`
#

CREATE TABLE {$db_prefix}approval_queue (
  id_msg int(10) unsigned NOT NULL default '0'
) ENGINE=MyISAM;

#
# Table structure for table `ban_groups`
#

CREATE TABLE {$db_prefix}ban_groups (
  id_ban_group mediumint(8) unsigned NOT NULL auto_increment,
  name varchar(20) NOT NULL default '',
  ban_time int(10) unsigned NOT NULL default '0',
  expire_time int(10) unsigned,
  cannot_access tinyint(3) unsigned NOT NULL default '0',
  cannot_register tinyint(3) unsigned NOT NULL default '0',
  cannot_post tinyint(3) unsigned NOT NULL default '0',
  cannot_login tinyint(3) unsigned NOT NULL default '0',
  reason varchar(255) NOT NULL default '',
  notes text NOT NULL,
  PRIMARY KEY (id_ban_group)
) ENGINE=MyISAM;

#
# Table structure for table `ban_items`
#

CREATE TABLE {$db_prefix}ban_items (
  id_ban mediumint(8) unsigned NOT NULL auto_increment,
  id_ban_group smallint(5) unsigned NOT NULL default '0',
  ip_low1 smallint(255) unsigned NOT NULL default '0',
  ip_high1 smallint(255) unsigned NOT NULL default '0',
  ip_low2 smallint(255) unsigned NOT NULL default '0',
  ip_high2 smallint(255) unsigned NOT NULL default '0',
  ip_low3 smallint(255) unsigned NOT NULL default '0',
  ip_high3 smallint(255) unsigned NOT NULL default '0',
  ip_low4 smallint(255) unsigned NOT NULL default '0',
  ip_high4 smallint(255) unsigned NOT NULL default '0',
  ip_low5 smallint(255) unsigned NOT NULL default '0',
  ip_high5 smallint(255) unsigned NOT NULL default '0',
  ip_low6 smallint(255) unsigned NOT NULL default '0',
  ip_high6 smallint(255) unsigned NOT NULL default '0',
  ip_low7 smallint(255) unsigned NOT NULL default '0',
  ip_high7 smallint(255) unsigned NOT NULL default '0',
  ip_low8 smallint(255) unsigned NOT NULL default '0',
  ip_high8 smallint(255) unsigned NOT NULL default '0',
  hostname varchar(255) NOT NULL default '',
  email_address varchar(255) NOT NULL default '',
  id_member mediumint(8) unsigned NOT NULL default '0',
  hits mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY (id_ban),
  KEY id_ban_group (id_ban_group)
) ENGINE=MyISAM;

#
# Table structure for table `blog_categories`
#

CREATE TABLE {$db_prefix}blog_categories (
  id_cat mediumint(8) unsigned NOT NULL auto_increment,
  name varchar(255) NOT NULL default '',
  order tinyint(4) NOT NULL  default '0',
  num_blogs mediumint(8) NOT NULL  default '0',
  PRIMARY KEY (id_cat)
) ENGINE=MyISAM;

#
# Table structure for table `blog_comments`
#

CREATE TABLE {$db_prefix}blog_comments (
  id_comment mediumint(8) unsigned NOT NULL auto_increment,
  id_blog int(10) unsigned NOT NULL default '0',
  id_member mediumint(8) unsigned NOT NULL default '0',
  comment_ip varchar(255) NOT NULL default '',
  comment text NOT NULL,
  likes int(10) NOT NULL default '0',
  dislikes int(10) NOT NULL default '0',
  PRIMARY KEY (id_comment)
) ENGINE=MyISAM;

#
# Table structure for table `blog_tags`
#

CREATE TABLE {$db_prefix}blog_tags (
  tag varchar(255) NOT NULL default '',
  id_blog mediumint(8) unsigned NOT NULL default '0',
  status int(1) unsigned NOT NULL default '1',
  PRIMARY KEY (tag)
) ENGINE=MyISAM;

#
# Table structure for table `blog_posts`
#

CREATE TABLE {$db_prefix}blog_posts (
  id_blog mediumint(8) unsigned NOT NULL auto_increment,
  title varchar(255) NOT NULL default '',
  content text NOT NULL,
  id_category mediumint(8) unsigned NOT NULL default '0',
  id_member mediumint(8) unsigned NOT NULL default '0',
  time int(10) unsigned NOT NULL default '0',
  modified_time int(10) unsigned NOT NULL default '0',
  modified_id mediumint(8) unsigned NOT NULL default '0',
  poster_ip varchar(255) NOT NULL default '',
  num_views int(10) unsigned NOT NULL default '0',
  PRIMARY KEY (id_blog)
) ENGINE=MyISAM;

#
# Table structure for table `custom_fields`
#

CREATE TABLE {$db_prefix}custom_fields (
  id_field smallint(5) NOT NULL auto_increment,
  col_name varchar(12) NOT NULL default '',
  field_name varchar(40) NOT NULL default '',
  field_desc varchar(255) NOT NULL default '',
  field_type varchar(8) NOT NULL default 'text',
  field_length smallint(5) NOT NULL default '255',
  field_options text NOT NULL,
  mask varchar(255) NOT NULL default '',
  show_reg tinyint(3) NOT NULL default '0',
  show_display tinyint(3) NOT NULL default '0',
  show_profile varchar(20) NOT NULL default 'forumprofile',
  private tinyint(3) NOT NULL default '0',
  active tinyint(3) NOT NULL default '1',
  bbc tinyint(3) NOT NULL default '0',
  can_search tinyint(3) NOT NULL default '0',
  default_value varchar(255) NOT NULL default '',
  enclose text NOT NULL,
  placement tinyint(3) NOT NULL default '0',
  PRIMARY KEY (id_field),
  UNIQUE col_name (col_name)
) ENGINE=MyISAM;

#
# Table structure for table `group_moderators`
#

CREATE TABLE {$db_prefix}group_moderators (
  id_group smallint(5) unsigned NOT NULL default '0',
  id_member mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY (id_group, id_member)
) ENGINE=MyISAM;

#
# Table structure for table `log_actions`
#

CREATE TABLE {$db_prefix}log_actions (
  id_action int(10) unsigned NOT NULL auto_increment,
  id_log tinyint(3) unsigned NOT NULL default '1',
  log_time int(10) unsigned NOT NULL default '0',
  id_member mediumint(8) unsigned NOT NULL default '0',
  ip char(16) NOT NULL default '                ',
  action varchar(30) NOT NULL default '',
  id_topic mediumint(8) unsigned NOT NULL default '0',
  id_msg int(10) unsigned NOT NULL default '0',
  extra text NOT NULL,
  PRIMARY KEY (id_action),
  KEY id_log (id_log),
  KEY log_time (log_time),
  KEY id_member (id_member),
  KEY id_msg (id_msg)
) ENGINE=MyISAM;

#
# Table structure for table `log_activity`
#

CREATE TABLE {$db_prefix}log_activity (
  date date NOT NULL default '0001-01-01',
  hits mediumint(8) unsigned NOT NULL default '0',
  topics smallint(5) unsigned NOT NULL default '0',
  posts smallint(5) unsigned NOT NULL default '0',
  registers smallint(5) unsigned NOT NULL default '0',
  most_on smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY (date),
  KEY most_on (most_on)
) ENGINE=MyISAM;

#
# Table structure for table `log_banned`
#

CREATE TABLE {$db_prefix}log_banned (
  id_ban_log mediumint(8) unsigned NOT NULL auto_increment,
  id_member mediumint(8) unsigned NOT NULL default '0',
  ip char(16) NOT NULL default '                ',
  email varchar(255) NOT NULL default '',
  log_time int(10) unsigned NOT NULL default '0',
  PRIMARY KEY (id_ban_log),
  KEY log_time (log_time)
) ENGINE=MyISAM;

#
# Table structure for table `log_comments`
#

CREATE TABLE {$db_prefix}log_comments (
  id_comment mediumint(8) unsigned NOT NULL auto_increment,
  id_member mediumint(8) unsigned NOT NULL default '0',
  member_name varchar(80) NOT NULL default '',
  comment_type varchar(8) NOT NULL default 'warning',
  id_recipient mediumint(8) unsigned NOT NULL default '0',
  recipient_name varchar(255) NOT NULL default '',
  log_time int(10) NOT NULL default '0',
  id_notice mediumint(8) unsigned NOT NULL default '0',
  counter tinyint(3) NOT NULL default '0',
  body text NOT NULL,
  PRIMARY KEY (id_comment),
  KEY id_recipient (id_recipient),
  KEY log_time (log_time),
  KEY comment_type (comment_type(8))
) ENGINE=MyISAM;

#
# Table structure for table `log_digest`
#

CREATE TABLE {$db_prefix}log_digest (
  id_topic mediumint(8) unsigned NOT NULL,
  id_msg int(10) unsigned NOT NULL,
  note_type varchar(10) NOT NULL default 'post',
  daily tinyint(3) unsigned NOT NULL default '0',
  exclude mediumint(8) unsigned NOT NULL default '0'
) ENGINE=MyISAM;

#
# Table structure for table `log_errors`
#

CREATE TABLE {$db_prefix}log_errors (
  id_error mediumint(8) unsigned NOT NULL auto_increment,
  log_time int(10) unsigned NOT NULL default '0',
  id_member mediumint(8) unsigned NOT NULL default '0',
  ip char(16) NOT NULL default '                ',
  url text NOT NULL,
  message text NOT NULL,
  session char(64) NOT NULL default '                                                                ',
  error_type char(15) NOT NULL default 'general',
  file varchar(255) NOT NULL default '',
  line mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY (id_error),
  KEY log_time (log_time),
  KEY id_member (id_member),
  KEY ip (ip(16))
) ENGINE=MyISAM;

#
# Table structure for table `log_floodcontrol`
#

CREATE TABLE {$db_prefix}log_floodcontrol (
  ip char(16) NOT NULL default '                ',
  log_time int(10) unsigned NOT NULL default '0',
  log_type varchar(8) NOT NULL default 'post',
  PRIMARY KEY (ip(16), log_type(8))
) ENGINE=MyISAM;

#
# Table structure for table `log_group_requests`
#

CREATE TABLE {$db_prefix}log_group_requests (
  id_request mediumint(8) unsigned NOT NULL auto_increment,
  id_member mediumint(8) unsigned NOT NULL default '0',
  id_group smallint(5) unsigned NOT NULL default '0',
  time_applied int(10) unsigned NOT NULL default '0',
  reason text NOT NULL,
  PRIMARY KEY (id_request),
  UNIQUE id_member (id_member, id_group)
) ENGINE=MyISAM;

#
# Table structure for table `log_mark_read`
#

CREATE TABLE {$db_prefix}log_mark_read (
  id_member mediumint(8) unsigned NOT NULL default '0',
  id_msg int(10) unsigned NOT NULL default '0',
  PRIMARY KEY (id_member)
) ENGINE=MyISAM;

#
# Table structure for table `log_member_notices`
#

CREATE TABLE {$db_prefix}log_member_notices (
  id_notice mediumint(8) unsigned NOT NULL auto_increment,
  subject varchar(255) NOT NULL default '',
  body text NOT NULL,
  PRIMARY KEY (id_notice)
) ENGINE=MyISAM;

#
# Table structure for table `log_notify`
#

CREATE TABLE {$db_prefix}log_notify (
  id_member mediumint(8) unsigned NOT NULL default '0',
  id_topic mediumint(8) unsigned NOT NULL default '0',
  sent tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY (id_member, id_topic),
  KEY id_topic (id_topic, id_member)
) ENGINE=MyISAM;

#
# Table structure for table `log_online`
#

CREATE TABLE {$db_prefix}log_online (
  session varchar(64) NOT NULL default '',
  log_time int(10) NOT NULL default '0',
  id_member mediumint(8) unsigned NOT NULL default '0',
  id_spider smallint(5) unsigned NOT NULL default '0',
  ip int(10) unsigned NOT NULL default '0',
  url text NOT NULL,
  PRIMARY KEY (session),
  KEY log_time (log_time),
  KEY id_member (id_member)
) ENGINE=MyISAM;

#
# Table structure for table `log_packages`
#

CREATE TABLE {$db_prefix}log_packages (
  id_install int(10) NOT NULL auto_increment,
  filename varchar(255) NOT NULL default '',
  package_id varchar(255) NOT NULL default '',
  name varchar(255) NOT NULL default '',
  version varchar(255) NOT NULL default '',
  id_member_installed mediumint(8) NOT NULL default '0',
  member_installed varchar(255) NOT NULL default '',
  time_installed int(10) NOT NULL default '0',
  id_member_removed mediumint(8) NOT NULL default '0',
  member_removed varchar(255) NOT NULL default '',
  time_removed int(10) NOT NULL default '0',
  install_state tinyint(3) NOT NULL default '1',
  failed_steps text NOT NULL,
  themes_installed varchar(255) NOT NULL default '',
  db_changes text NOT NULL,
  credits varchar(255) NOT NULL default '',
  PRIMARY KEY (id_install),
  KEY filename (filename(15))
) ENGINE=MyISAM;

#
# Table structure for table `log_reported`
#

CREATE TABLE {$db_prefix}log_reported (
  id_report mediumint(8) unsigned NOT NULL auto_increment,
  id_msg int(10) unsigned NOT NULL default '0',
  id_topic mediumint(8) unsigned NOT NULL default '0',
  id_member mediumint(8) unsigned NOT NULL default '0',
  membername varchar(255) NOT NULL default '',
  subject varchar(255) NOT NULL default '',
  body mediumtext NOT NULL,
  time_started int(10) NOT NULL default '0',
  time_updated int(10) NOT NULL default '0',
  num_reports mediumint(6) NOT NULL default '0',
  closed tinyint(3) NOT NULL default '0',
  ignore_all tinyint(3) NOT NULL default '0',
  PRIMARY KEY (id_report),
  KEY id_member (id_member),
  KEY id_topic (id_topic),
  KEY closed (closed),
  KEY time_started (time_started),
  KEY id_msg (id_msg)
) ENGINE=MyISAM;

#
# Table structure for table `log_reported_comments`
#

CREATE TABLE {$db_prefix}log_reported_comments (
  id_comment mediumint(8) unsigned NOT NULL auto_increment,
  id_report mediumint(8) NOT NULL default '0',
  id_member mediumint(8) NOT NULL,
  membername varchar(255) NOT NULL default '',
  email_address varchar(255) NOT NULL default '',
  member_ip varchar(255) NOT NULL default '',
  comment varchar(255) NOT NULL default '',
  time_sent int(10) NOT NULL,
  PRIMARY KEY (id_comment),
  KEY id_report (id_report),
  KEY id_member (id_member),
  KEY time_sent (time_sent)
) ENGINE=MyISAM;

#
# Table structure for table `log_scheduled_tasks`
#

CREATE TABLE {$db_prefix}log_scheduled_tasks (
  id_log mediumint(8) NOT NULL auto_increment,
  id_task smallint(5) NOT NULL default '0',
  time_run int(10) NOT NULL default '0',
  time_taken float NOT NULL default '0',
  PRIMARY KEY (id_log)
) ENGINE=MyISAM;

#
# Table structure for table `log_search_messages`
#

CREATE TABLE {$db_prefix}log_search_messages (
  id_search tinyint(3) unsigned NOT NULL default '0',
  id_msg int(10) unsigned NOT NULL default '0',
  PRIMARY KEY (id_search, id_msg)
) ENGINE=MyISAM;

#
# Table structure for table `log_search_results`
#

CREATE TABLE {$db_prefix}log_search_results (
  id_search tinyint(3) unsigned NOT NULL default '0',
  id_topic mediumint(8) unsigned NOT NULL default '0',
  id_msg int(10) unsigned NOT NULL default '0',
  relevance smallint(5) unsigned NOT NULL default '0',
  num_matches smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY (id_search, id_topic)
) ENGINE=MyISAM;

#
# Table structure for table `log_search_subjects`
#

CREATE TABLE {$db_prefix}log_search_subjects (
  word varchar(20) NOT NULL default '',
  id_topic mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY (word, id_topic),
  KEY id_topic (id_topic)
) ENGINE=MyISAM;

#
# Table structure for table `log_search_topics`
#

CREATE TABLE {$db_prefix}log_search_topics (
  id_search tinyint(3) unsigned NOT NULL default '0',
  id_topic mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY (id_search, id_topic)
) ENGINE=MyISAM;

#
# Table structure for table `log_spider_hits`
#

CREATE TABLE {$db_prefix}log_spider_hits (
	id_hit int(10) unsigned NOT NULL auto_increment,
  id_spider smallint(5) unsigned NOT NULL default '0',
  log_time int(10) unsigned NOT NULL default '0',
  url varchar(255) NOT NULL default '',
  processed tinyint(3) NOT NULL default '0',
  PRIMARY KEY (id_hit),
  KEY id_spider(id_spider),
  KEY log_time(log_time),
  KEY processed (processed)
) ENGINE=MyISAM;

#
# Table structure for table `log_spider_stats`
#

CREATE TABLE {$db_prefix}log_spider_stats (
  id_spider smallint(5) unsigned NOT NULL default '0',
  page_hits smallint(5) unsigned NOT NULL default '0',
  last_seen int(10) unsigned NOT NULL default '0',
  stat_date date NOT NULL default '0001-01-01',
  PRIMARY KEY (stat_date, id_spider)
) ENGINE=MyISAM;

#
# Table structure for table `log_subscribed`
#

CREATE TABLE {$db_prefix}log_subscribed (
  id_sublog int(10) unsigned NOT NULL auto_increment,
  id_subscribe mediumint(8) unsigned NOT NULL default '0',
  id_member int(10) NOT NULL default '0',
  old_id_group smallint(5) NOT NULL default '0',
  start_time int(10) NOT NULL default '0',
  end_time int(10) NOT NULL default '0',
  status tinyint(3) NOT NULL default '0',
  payments_pending tinyint(3) NOT NULL default '0',
  pending_details text NOT NULL,
  reminder_sent tinyint(3) NOT NULL default '0',
  vendor_ref varchar(255) NOT NULL default '',
  PRIMARY KEY (id_sublog),
  UNIQUE KEY id_subscribe (id_subscribe, id_member),
  KEY end_time (end_time),
  KEY reminder_sent (reminder_sent),
  KEY payments_pending (payments_pending),
  KEY status (status),
  KEY id_member (id_member)
) ENGINE=MyISAM;

#
# Table structure for table `log_topics`
#

CREATE TABLE {$db_prefix}log_topics (
  id_member mediumint(8) unsigned NOT NULL default '0',
  id_topic mediumint(8) unsigned NOT NULL default '0',
  id_msg int(10) unsigned NOT NULL default '0',
  disregarded tinyint(3) NOT NULL default '0',
  PRIMARY KEY (id_member, id_topic),
  KEY id_topic (id_topic)
) ENGINE=MyISAM;

#
# Table structure for table `mail_queue`
#

CREATE TABLE {$db_prefix}mail_queue (
  id_mail int(10) unsigned NOT NULL auto_increment,
  time_sent int(10) NOT NULL default '0',
  recipient varchar(255) NOT NULL default '',
  body mediumtext NOT NULL,
  subject varchar(255) NOT NULL default '',
  headers text NOT NULL,
  send_html tinyint(3) NOT NULL default '0',
  priority tinyint(3) NOT NULL default '1',
  private tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (id_mail),
  KEY time_sent (time_sent),
  KEY mail_priority (priority, id_mail)
) ENGINE=MyISAM;

#
# Table structure for table `membergroups`
#

CREATE TABLE {$db_prefix}membergroups (
  id_group smallint(5) unsigned NOT NULL auto_increment,
  group_name varchar(80) NOT NULL default '',
  description text NOT NULL,
  online_color varchar(20) NOT NULL default '',
  min_posts mediumint(9) NOT NULL default '-1',
  max_messages smallint(5) unsigned NOT NULL default '0',
  icons varchar(255) NOT NULL default '',
  group_type tinyint(3) NOT NULL default '0',
  hidden tinyint(3) NOT NULL default '0',
  id_parent smallint(5) NOT NULL default '-2',
  PRIMARY KEY (id_group),
  KEY min_posts (min_posts)
) ENGINE=MyISAM;

#
# Dumping data for table `membergroups`
#

INSERT INTO {$db_prefix}membergroups
	(id_group, group_name, description, online_color, min_posts, icons, group_type)
VALUES (1, '{$default_administrator_group}', '', '#FF0000', -1, '5#iconadmin.png', 1),
	(2, '{$default_global_moderator_group}', '', '#0000FF', -1, '5#icongmod.png', 0),
	(4, '{$default_newbie_group}', '', '', 0, '1#icon.png', 0),
	(5, '{$default_junior_group}', '', '', 50, '2#icon.png', 0),
	(6, '{$default_full_group}', '', '', 100, '3#icon.png', 0),
	(7, '{$default_senior_group}', '', '', 250, '4#icon.png', 0),
	(8, '{$default_hero_group}', '', '', 500, '5#icon.png', 0);
# --------------------------------------------------------

#
# Table structure for table `members`
#

CREATE TABLE {$db_prefix}members (
  id_member mediumint(8) unsigned NOT NULL auto_increment,
  member_name varchar(80) NOT NULL default '',
  date_registered int(10) unsigned NOT NULL default '0',
  posts mediumint(8) unsigned NOT NULL default '0',
  id_group smallint(5) unsigned NOT NULL default '0',
  lngfile varchar(255) NOT NULL default '',
  last_login int(10) unsigned NOT NULL default '0',
  real_name varchar(255) NOT NULL default '',
  instant_messages smallint(5) NOT NULL default 0,
  unread_messages smallint(5) NOT NULL default 0,
  new_pm tinyint(3) unsigned NOT NULL default '0',
  buddy_list text NOT NULL,
  pm_ignore_list varchar(255) NOT NULL default '',
  pm_prefs mediumint(8) NOT NULL default '0',
  mod_prefs varchar(20) NOT NULL default '',
  message_labels text NOT NULL,
  passwd varchar(64) NOT NULL default '',
  email_address varchar(255) NOT NULL default '',
  personal_text varchar(255) NOT NULL default '',
  gender tinyint(4) unsigned NOT NULL default '0',
  birthdate date NOT NULL default '0001-01-01',
  website_title varchar(255) NOT NULL default '',
  website_url varchar(255) NOT NULL default '',
  location varchar(255) NOT NULL default '',
  hide_email tinyint(4) NOT NULL default '0',
  show_online tinyint(4) NOT NULL default '1',
  time_format varchar(80) NOT NULL default '',
  signature text NOT NULL,
  time_offset float NOT NULL default '0',
  pm_email_notify tinyint(4) NOT NULL default '0',
  usertitle varchar(255) NOT NULL default '',
  notify_announcements tinyint(4) NOT NULL default '1',
  notify_regularity tinyint(4) NOT NULL default '1',
  notify_send_body tinyint(4) NOT NULL default '0',
  notify_types tinyint(4) NOT NULL default '2',
  member_ip varchar(255) NOT NULL default '',
  member_ip2 varchar(255) NOT NULL default '',
  secret_question varchar(255) NOT NULL default '',
  secret_answer varchar(64) NOT NULL default '',
  id_theme tinyint(4) unsigned NOT NULL default '0',
  is_activated tinyint(3) unsigned NOT NULL default '1',
  validation_code varchar(10) NOT NULL default '',
  id_msg_last_visit int(10) unsigned NOT NULL default '0',
  additional_groups varchar(255) NOT NULL default '',
  smiley_set varchar(48) NOT NULL default '',
  id_post_group smallint(5) unsigned NOT NULL default '0',
  total_time_logged_in int(10) unsigned NOT NULL default '0',
  password_salt varchar(255) NOT NULL default '',
  warning tinyint(4) NOT NULL default '0',
  passwd_flood varchar(12) NOT NULL default '',
  pm_receive_from tinyint(4) unsigned NOT NULL default '1',
  PRIMARY KEY (id_member),
  KEY member_name (member_name),
  KEY real_name (real_name),
  KEY date_registered (date_registered),
  KEY id_group (id_group),
  KEY birthdate (birthdate),
  KEY posts (posts),
  KEY last_login (last_login),
  KEY lngfile (lngfile(30)),
  KEY id_post_group (id_post_group),
  KEY warning (warning),
  KEY total_time_logged_in (total_time_logged_in),
  KEY id_theme (id_theme)
) ENGINE=MyISAM;

#
# Table structure for table `member_logins`
#

CREATE TABLE {$db_prefix}member_logins (
  id_login int(10) NOT NULL auto_increment,
  id_member mediumint(8) NOT NULL default '0',
  time int(10) NOT NULL default '0',
  ip varchar(255) NOT NULL default '0',
  ip2 varchar(255) NOT NULL default '0',
  PRIMARY KEY (id_login),
  KEY id_member (id_member),
  KEY time (time)
) ENGINE=MyISAM;

#
# Table structure for table `messages`
#

CREATE TABLE {$db_prefix}messages (
  id_msg int(10) unsigned NOT NULL auto_increment,
  id_topic mediumint(8) unsigned NOT NULL default '0',
  poster_time int(10) unsigned NOT NULL default '0',
  id_member mediumint(8) unsigned NOT NULL default '0',
  id_msg_modified int(10) unsigned NOT NULL default '0',
  subject varchar(255) NOT NULL default '',
  poster_name varchar(255) NOT NULL default '',
  poster_email varchar(255) NOT NULL default '',
  poster_ip varchar(255) NOT NULL default '',
  smileys_enabled tinyint(4) NOT NULL default '1',
  modified_time int(10) unsigned NOT NULL default '0',
  modified_name varchar(255) NOT NULL default '',
  body text NOT NULL,
  approved tinyint(3) NOT NULL default '1',
  likes int(10) NOT NULL default '0',
  PRIMARY KEY (id_msg),
  UNIQUE topic (id_topic, id_msg),
  UNIQUE id_member (id_member, id_msg),
  KEY approved (approved),
  KEY ip_index (poster_ip(15), id_topic),
  KEY participation (id_member, id_topic),
  KEY id_topic (id_topic),
  KEY id_member_msg (id_member, approved, id_msg),
  KEY current_topic (id_topic, id_msg, id_member, approved),
  KEY related_ip (id_member, poster_ip, id_msg)
) ENGINE=MyISAM;

#
# Dumping data for table `messages`
#

INSERT INTO {$db_prefix}messages
	(id_msg, id_msg_modified, id_topic, poster_time, subject, poster_name, poster_email, poster_ip, modified_name, body)
VALUES (1, 1, 1, UNIX_TIMESTAMP(), '{$default_topic_subject}', 'Simple Machines', 'info@simplemachines.org', '127.0.0.1', '', '{$default_topic_message}');
# --------------------------------------------------------

#
# Table structure for table `package_servers`
#

CREATE TABLE {$db_prefix}package_servers (
  id_server smallint(5) unsigned NOT NULL auto_increment,
  name varchar(255) NOT NULL default '',
  url varchar(255) NOT NULL default '',
  PRIMARY KEY (id_server)
) ENGINE=MyISAM;

#
# Dumping data for table `package_servers`
#

INSERT INTO {$db_prefix}package_servers
	(name, url)
VALUES ('Simple Machines Third-party Mod Site', 'http://custom.simplemachines.org/packages/mods');
# --------------------------------------------------------

#
# Table structure for table `permissions`
#

CREATE TABLE {$db_prefix}permissions (
  id_group smallint(5) NOT NULL default '0',
  permission varchar(30) NOT NULL default '',
  add_deny tinyint(4) NOT NULL default '1',
  PRIMARY KEY (id_group, permission)
) ENGINE=MyISAM;

#
# Dumping data for table `permissions`
#

INSERT INTO {$db_prefix}permissions
	(id_group, permission)
VALUES (-1, 'search_posts'),
	(-1, 'view_stats'),
	(-1, 'profile_view_any'),
	(0, 'remove_own'),
	(0, 'lock_own'),
	(0, 'mark_any_notify'),
	(0, 'mark_notify'),
	(0, 'modify_own'),
	(0, 'post_new'),
	(0, 'post_draft'),
	(0, 'post_autosave_draft'),
	(0, 'post_reply_any'),
	(0, 'post_reply_own'),
	(0, 'post_unapproved_topics'),
	(0, 'post_unapproved_replies_any'),
	(0, 'post_unapproved_replies_own'),
	(0, 'delete_own'),
	(0, 'report_any'),
	(0, 'send_topic'),
	(0, 'view_mlist'),
	(0, 'search_posts'),
	(0, 'profile_view_own'),
	(0, 'profile_view_any'),
	(0, 'pm_read'),
	(0, 'pm_send'),
	(0, 'pm_draft'),
	(0, 'pm_autosave_draft'),
	(0, 'view_stats'),
	(0, 'who_view'),
	(0, 'profile_identity_own'),
	(0, 'profile_extra_own'),
	(0, 'profile_remove_own'),
	(0, 'send_email_to_members'),
	(2, 'moderate_board'),
	(2, 'post_new'),
	(2, 'post_draft'),
	(2, 'post_autosave_draft'),
	(2, 'post_reply_own'),
	(2, 'post_reply_any'),
	(2, 'post_unapproved_topics'),
	(2, 'post_unapproved_replies_any'),
	(2, 'post_unapproved_replies_own'),
	(2, 'report_any'),
	(2, 'lock_own'),
	(2, 'send_topic'),
	(2, 'mark_any_notify'),
	(2, 'mark_notify'),
	(2, 'delete_own'),
	(2, 'modify_own'),
	(2, 'make_sticky'),
	(2, 'lock_any'),
	(2, 'remove_any'),
	(2, 'move_any'),
	(2, 'merge_any'),
	(2, 'split_any'),
	(2, 'delete_any'),
	(2, 'modify_any'),
	(2, 'approve_posts'),
	(2, 'view_mlist'),
	(2, 'search_posts'),
	(2, 'profile_view_own'),
	(2, 'profile_view_any'),
	(2, 'pm_read'),
	(2, 'pm_send'),
	(2, 'pm_draft'),
	(2, 'pm_autosave_draft'),
	(2, 'view_stats'),
	(2, 'who_view'),
	(2, 'profile_identity_own'),
	(2, 'profile_extra_own'),
	(2, 'profile_remove_own'),
	(2, 'send_email_to_members'),
	(2, 'profile_title_own'),
	(2, 'access_mod_center');
# --------------------------------------------------------

#
# Table structure for table `personal_messages`
#

CREATE TABLE {$db_prefix}personal_messages (
  id_pm int(10) unsigned NOT NULL auto_increment,
  id_pm_head int(10) unsigned NOT NULL default '0',
  id_member_from mediumint(8) unsigned NOT NULL default '0',
  deleted_by_sender tinyint(3) unsigned NOT NULL default '0',
  from_name varchar(255) NOT NULL default '',
  msgtime int(10) unsigned NOT NULL default '0',
  subject varchar(255) NOT NULL default '',
  body text NOT NULL,
  PRIMARY KEY (id_pm),
  KEY id_member (id_member_from, deleted_by_sender),
  KEY msgtime (msgtime),
  KEY id_pm_head (id_pm_head)
) ENGINE=MyISAM;

#
# Table structure for table `pm_recipients`
#

CREATE TABLE {$db_prefix}pm_recipients (
  id_pm int(10) unsigned NOT NULL default '0',
  id_member mediumint(8) unsigned NOT NULL default '0',
  labels varchar(60) NOT NULL default '-1',
  bcc tinyint(3) unsigned NOT NULL default '0',
  is_read tinyint(3) unsigned NOT NULL default '0',
  is_new tinyint(3) unsigned NOT NULL default '0',
  deleted tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY (id_pm, id_member),
  UNIQUE id_member (id_member, deleted, id_pm)
) ENGINE=MyISAM;

#
# Table structure for table `pm_rules`
#

CREATE TABLE {$db_prefix}pm_rules (
  id_rule int(10) unsigned NOT NULL auto_increment,
  id_member int(10) unsigned NOT NULL default '0',
  rule_name varchar(60) NOT NULL,
  criteria text NOT NULL,
  actions text NOT NULL,
  delete_pm tinyint(3) unsigned NOT NULL default '0',
  is_or tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY (id_rule),
  KEY id_member (id_member),
  KEY delete_pm (delete_pm)
) ENGINE=MyISAM;

#
# Table structure for table `rates`
#

CREATE TABLE {$db_prefix}rates (
  id_rate int(10) unsigned NOT NULL auto_increment,
  id_member int(10) unsigned NOT NULL default '0',
  id_msg int(10) unsigned NOT NULL default '0',
  action varchar(7) NOT NULL,
  time int(10) unsigned NOT NULL default '0',
  PRIMARY KEY (id_rate)
) ENGINE=MyISAM;

#
# Table structure for table `scheduled_tasks`
#

CREATE TABLE {$db_prefix}scheduled_tasks (
  id_task smallint(5) NOT NULL auto_increment,
  next_time int(10) NOT NULL default '0',
  time_offset int(10) NOT NULL default '0',
  time_regularity smallint(5) NOT NULL default '0',
  time_unit varchar(1) NOT NULL default 'h',
  disabled tinyint(3) NOT NULL default '0',
  task varchar(24) NOT NULL default '',
  PRIMARY KEY (id_task),
  KEY next_time (next_time),
  KEY disabled (disabled),
  UNIQUE task (task)
) ENGINE=MyISAM;

#
# Dumping data for table `scheduled_tasks`
#

INSERT INTO {$db_prefix}scheduled_tasks
	(id_task, next_time, time_offset, time_regularity, time_unit, disabled, task)
VALUES
	(1, 0, 0, 2, 'h', 0, 'approval_notification'),
	(2, 0, 0, 7, 'd', 0, 'auto_optimize'),
	(3, 0, 60, 1, 'd', 0, 'daily_maintenance'),
	(5, 0, 0, 1, 'd', 0, 'daily_digest'),
	(6, 0, 0, 1, 'w', 0, 'weekly_digest'),
	(7, 0, {$sched_task_offset}, 1, 'd', 0, 'fetchSMfiles'),
	(8, 0, 0, 1, 'd', 1, 'birthdayemails'),
	(9, 0, 0, 1, 'w', 0, 'weekly_maintenance'),
	(10, 0, 120, 1, 'd', 1, 'paid_subscriptions'),
	(12, 0, 180, 1, 'd', 1, 'remove_topic_redirect'),
	(13, 0, 240, 1, 'd', 1, 'remove_old_drafts');

# --------------------------------------------------------

#
# Table structure for table `settings`
#

CREATE TABLE {$db_prefix}settings (
  variable varchar(255) NOT NULL default '',
  value text NOT NULL,
  PRIMARY KEY (variable(30))
) ENGINE=MyISAM;

#
# Dumping data for table `settings`
#

INSERT INTO {$db_prefix}settings
	(variable, value)
VALUES ('smfVersion', '{$smf_version}'),
	('news', '{$default_news}'),
	('compactTopicPagesContiguous', '5'),
	('compactTopicPagesEnable', '1'),
	('enableStickyTopics', '1'),
	('todayMod', '1'),
	('enablePreviousNext', '1'),
	('enableVBStyleLogin', '1'),
	('enableCompressedOutput', '{$enableCompressedOutput}'),
	('censorIgnoreCase', '1'),
	('mostOnline', '1'),
	('mostOnlineToday', '1'),
	('mostDate', UNIX_TIMESTAMP()),
	('allow_disableAnnounce', '1'),
	('trackStats', '1'),
	('userLanguage', '1'),
	('titlesEnable', '1'),
	('topicSummaryPosts', '15'),
	('enableErrorLogging', '1'),
	('max_image_width', '0'),
	('max_image_height', '0'),
	('onlineEnable', '0'),
	('smtp_host', ''),
	('smtp_port', '25'),
	('smtp_username', ''),
	('smtp_password', ''),
	('mail_type', '0'),
	('timeLoadPageEnable', '0'),
	('totalMembers', '0'),
	('totalTopics', '1'),
	('totalMessages', '1'),
	('simpleSearch', '0'),
	('censor_vulgar', ''),
	('censor_proper', ''),
	('enablePostHTML', '0'),
	('theme_allow', '1'),
	('theme_default', '1'),
	('theme_guests', '1'),
	('enableEmbeddedFlash', '0'),
	('xmlnews_enable', '1'),
	('rss_limit', '5'),
	('xmlnews_maxlen', '255'),
	('hotTopicPosts', '15'),
	('hotTopicVeryPosts', '25'),
	('registration_method', '0'),
	('send_validation_onChange', '0'),
	('send_welcomeEmail', '1'),
	('allow_editDisplayName', '1'),
	('allow_hideOnline', '1'),
	('guest_hideContacts', '1'),
	('spamWaitTime', '5'),
	('pm_spam_settings', '10,5,20'),
	('reserveWord', '0'),
	('reserveCase', '1'),
	('reserveUser', '1'),
	('reserveName', '1'),
	('reserveNames', '{$default_reserved_names}'),
	('autoLinkUrls', '1'),
	('banLastUpdated', '0'),
	('smileys_dir', '{$boarddir}/Smileys'),
	('smileys_url', '{$boardurl}/Smileys'),
	('failed_login_threshold', '3'),
	('oldTopicDays', '120'),
	('edit_wait_time', '90'),
	('edit_disable_time', '0'),
	('autoFixDatabase', '1'),
	('allow_guestAccess', '1'),
	('time_format', '{$default_time_format}'),
	('number_format', '1234.00'),
	('enableBBC', '1'),
	('max_messageLength', '20000'),
	('signature_settings', '1,300,0,0,0,0,0,0:'),
	('autoOptMaxOnline', '0'),
	('defaultMaxMessages', '15'),
	('defaultMaxTopics', '20'),
	('defaultMaxMembers', '30'),
	('enableParticipation', '1'),
	('maxMsgID', '1'),
	('enableAllMessages', '0'),
	('fixLongWords', '0'),
	('knownThemes', '1,2,3'),
	('who_enabled', '1'),
	('time_offset', '0'),
	('cookieTime', '60'),
	('lastActive', '15'),
	('smiley_sets_known', 'default'),
	('smiley_sets_names', '{$default_smileyset_name}'),
	('smiley_sets_default', 'default'),
	('cal_days_for_index', '7'),
	('requireAgreement', '1'),
	('unapprovedMembers', '0'),
	('default_personal_text', ''),
	('package_make_backups', '1'),
	('databaseSession_enable', '{$databaseSession_enable}'),
	('databaseSession_loose', '1'),
	('databaseSession_lifetime', '2880'),
	('search_cache_size', '50'),
	('search_results_per_page', '30'),
	('search_weight_frequency', '30'),
	('search_weight_age', '25'),
	('search_weight_length', '20'),
	('search_weight_subject', '15'),
	('search_weight_first_message', '10'),
	('search_max_results', '1200'),
	('search_floodcontrol_time', '5'),
	('permission_enable_deny', '0'),
	('permission_enable_postgroups', '0'),
	('mail_next_send', '0'),
	('mail_recent', '0000000000|0'),
	('settings_updated', '0'),
	('next_task_time', '1'),
	('warning_settings', '1,20,0'),
	('warning_watch', '10'),
	('warning_moderate', '35'),
	('warning_mute', '60'),
	('admin_features', ''),
	('last_mod_report_action', '0'),
	('pruningOptions', '30,180,180,180,30,0'),
	('cache_enable', '1'),
	('reg_verification', '1'),
	('visual_verification_type', '3'),
	('enable_buddylist', '1'),
	('birthday_email', 'happy_birthday'),
	('dont_repeat_theme_core', '1'),
	('dont_repeat_smileys_20', '1'),
	('dont_repeat_buddylists', '1'),
	('enable_disregard', '0');
# --------------------------------------------------------

#
# Table structure for table `sessions`
#

CREATE TABLE {$db_prefix}sessions (
  session_id char(64) NOT NULL,
  last_update int(10) unsigned NOT NULL,
  data text NOT NULL,
  PRIMARY KEY (session_id)
) ENGINE=MyISAM;

#
# Table structure for table `smileys`
#

CREATE TABLE {$db_prefix}smileys (
  id_smiley smallint(5) unsigned NOT NULL auto_increment,
  code varchar(30) NOT NULL default '',
  filename varchar(48) NOT NULL default '',
  description varchar(80) NOT NULL default '',
  smiley_row tinyint(4) unsigned NOT NULL default '0',
  smiley_order smallint(5) unsigned NOT NULL default '0',
  hidden tinyint(4) unsigned NOT NULL default '0',
  PRIMARY KEY (id_smiley)
) ENGINE=MyISAM;

#
# Dumping data for table `smileys`
#

INSERT INTO {$db_prefix}smileys
	(code, filename, description, smiley_order, hidden)
VALUES (':)', 'smiley.gif', '{$default_smiley_smiley}', 0, 0),
	(';)', 'wink.gif', '{$default_wink_smiley}', 1, 0),
	(':D', 'cheesy.gif', '{$default_cheesy_smiley}', 2, 0),
	(';D', 'grin.gif', '{$default_grin_smiley}', 3, 0),
	('>:(', 'angry.gif', '{$default_angry_smiley}', 4, 0),
	(':(', 'sad.gif', '{$default_sad_smiley}', 5, 0),
	(':o', 'shocked.gif', '{$default_shocked_smiley}', 6, 0),
	('8)', 'cool.gif', '{$default_cool_smiley}', 7, 0),
	('???', 'huh.gif', '{$default_huh_smiley}', 8, 0),
	('::)', 'rolleyes.gif', '{$default_roll_eyes_smiley}', 9, 0),
	(':P', 'tongue.gif', '{$default_tongue_smiley}', 10, 0),
	(':-[', 'embarrassed.gif', '{$default_embarrassed_smiley}', 11, 0),
	(':-X', 'lipsrsealed.gif', '{$default_lips_sealed_smiley}', 12, 0),
	(':-\\', 'undecided.gif', '{$default_undecided_smiley}', 13, 0),
	(':-*', 'kiss.gif', '{$default_kiss_smiley}', 14, 0),
	(':\'(', 'cry.gif', '{$default_cry_smiley}', 15, 0),
	('>:D', 'evil.gif', '{$default_evil_smiley}', 16, 1),
	('^-^', 'azn.gif', '{$default_azn_smiley}', 17, 1),
	('O0', 'afro.gif', '{$default_afro_smiley}', 18, 1),
	(':))', 'laugh.gif', '{$default_laugh_smiley}', 19, 1),
	('C:-)', 'police.gif', '{$default_police_smiley}', 20, 1),
	('O:-)', 'angel.gif', '{$default_angel_smiley}', 21, 1);
# --------------------------------------------------------

#
# Table structure for table `spiders`
#

CREATE TABLE {$db_prefix}spiders (
  id_spider smallint(5) unsigned NOT NULL auto_increment,
  spider_name varchar(255) NOT NULL default '',
  user_agent varchar(255) NOT NULL default '',
  ip_info varchar(255) NOT NULL default '',
  PRIMARY KEY id_spider(id_spider)
) ENGINE=MyISAM;

#
# Dumping data for table `spiders`
#

INSERT INTO {$db_prefix}spiders
	(id_spider, spider_name, user_agent, ip_info)
VALUES (1, 'Google', 'googlebot', ''),
	(2, 'Yahoo!', 'slurp', ''),
	(3, 'MSN', 'msnbot', ''),
	(4, 'Google (Mobile)', 'Googlebot-Mobile', ''),
	(5, 'Google (Image)', 'Googlebot-Image', ''),
	(6, 'Google (AdSense)', 'Mediapartners-Google', ''),
	(7, 'Google (Adwords)', 'AdsBot-Google', ''),
	(8, 'Yahoo! (Mobile)', 'YahooSeeker/M1A1-R2D2', ''),
	(9, 'Yahoo! (Image)', 'Yahoo-MMCrawler', ''),
	(10, 'MSN (Mobile)', 'MSNBOT_Mobile', ''),
	(11, 'MSN (Media)', 'msnbot-media', ''),
	(12, 'Cuil', 'twiceler', ''),
	(13, 'Ask', 'Teoma', ''),
	(14, 'Baidu', 'Baiduspider', ''),
	(15, 'Gigablast', 'Gigabot', ''),
	(16, 'InternetArchive', 'ia_archiver-web.archive.org', ''),
	(17, 'Alexa', 'ia_archiver', ''),
	(18, 'Omgili', 'omgilibot', ''),
	(19, 'EntireWeb', 'Speedy Spider', '');

#
# Table structure for table `subscriptions`
#

CREATE TABLE {$db_prefix}subscriptions(
  id_subscribe mediumint(8) unsigned NOT NULL auto_increment,
  name varchar(60) NOT NULL default '',
  description varchar(255) NOT NULL default '',
  cost text NOT NULL,
  length varchar(6) NOT NULL default '',
  id_group smallint(5) NOT NULL default '0',
  add_groups varchar(40) NOT NULL default '',
  active tinyint(3) NOT NULL default '1',
  repeatable tinyint(3) NOT NULL default '0',
  allow_partial tinyint(3) NOT NULL default '0',
  reminder tinyint(3) NOT NULL default '0',
  email_complete text NOT NULL,
  PRIMARY KEY (id_subscribe),
  KEY active (active)
) ENGINE=MyISAM;

#
# Table structure for table `themes`
#

CREATE TABLE {$db_prefix}themes (
  id_member mediumint(8) NOT NULL default '0',
  id_theme tinyint(4) unsigned NOT NULL default '1',
  variable varchar(255) NOT NULL default '',
  value text NOT NULL,
  PRIMARY KEY (id_theme, id_member, variable(30)),
  KEY id_member (id_member)
) ENGINE=MyISAM;

#
# Dumping data for table `themes`
#

INSERT INTO {$db_prefix}themes
	(id_theme, variable, value)
VALUES (1, 'name', '{$default_theme_name}'),
	(1, 'theme_url', '{$boardurl}/Themes/default'),
	(1, 'images_url', '{$boardurl}/Themes/default/images'),
	(1, 'theme_dir', '{$boarddir}/Themes/default'),
	(1, 'show_bbc', '1'),
	(1, 'show_latest_member', '1'),
	(1, 'show_modify', '1'),
	(1, 'show_user_images', '1'),
	(1, 'show_blurb', '1'),
	(1, 'show_gender', '0'),
	(1, 'show_newsfader', '0'),
	(1, 'number_recent_posts', '5'),
	(1, 'show_member_bar', '1'),
	(1, 'show_profile_buttons', '1'),
	(1, 'show_mark_read', '1'),
	(1, 'show_stats_index', '1'),
	(1, 'newsfader_time', '5000'),
	(1, 'allow_no_censored', '0'),
	(1, 'additional_options_collapsable', '1'),
	(1, 'use_image_buttons', '1'),
	(1, 'enable_news', '1'),
	(1, 'forum_width', '90%');

INSERT INTO {$db_prefix}themes (id_member, id_theme, variable, value) VALUES (-1, 1, 'display_quick_reply', '1');
INSERT INTO {$db_prefix}themes (id_member, id_theme, variable, value) VALUES (-1, 1, 'posts_apply_ignore_list', '1');
# --------------------------------------------------------

#
# Table structure for table `topics`
#

CREATE TABLE {$db_prefix}topics (
  id_topic mediumint(8) unsigned NOT NULL auto_increment,
  is_sticky tinyint(4) NOT NULL default '0',
  id_first_msg int(10) unsigned NOT NULL default '0',
  id_last_msg int(10) unsigned NOT NULL default '0',
  id_member_started mediumint(8) unsigned NOT NULL default '0',
  id_member_updated mediumint(8) unsigned NOT NULL default '0',
  id_previous_topic mediumint(8) NOT NULL default '0',
  num_replies int(10) unsigned NOT NULL default '0',
  num_views int(10) unsigned NOT NULL default '0',
  locked tinyint(4) NOT NULL default '0',
  redirect_expires int(10) unsigned NOT NULL default '0',
  id_redirect_topic mediumint(8) unsigned NOT NULL default '0',
  unapproved_posts smallint(5) NOT NULL default '0',
  approved tinyint(3) NOT NULL default '1',
  PRIMARY KEY (id_topic),
  KEY is_sticky (is_sticky),
  KEY approved (approved)
) ENGINE=MyISAM;

#
# Dumping data for table `topics`
#

INSERT INTO {$db_prefix}topics
	(id_topic, id_first_msg, id_last_msg, id_member_started, id_member_updated)
VALUES (1, 1, 1, 0, 0);
# --------------------------------------------------------

#
# Table structure for table `user_drafts`
#

CREATE TABLE {$db_prefix}user_drafts (
  id_draft int(10) unsigned NOT NULL auto_increment,
  id_topic mediumint(8) unsigned NOT NULL default '0',
  id_reply int(10) unsigned NOT NULL default '0',
  type tinyint(4) NOT NULL default '0',
  poster_time int(10) unsigned NOT NULL default '0',
  id_member mediumint(8) unsigned NOT NULL default '0',
  subject varchar(255) NOT NULL default '',
  smileys_enabled tinyint(4) NOT NULL default '1',
  body mediumtext NOT NULL,
  locked tinyint(4) NOT NULL default '0',
  is_sticky tinyint(4) NOT NULL default '0',
  to_list varchar(255) NOT NULL default '',
  outbox tinyint(4) NOT NULL default '0',
  PRIMARY KEY (id_draft),
  UNIQUE id_member (id_member, id_draft, type)
) ENGINE=MyISAM;
