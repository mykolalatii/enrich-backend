-- Adminer 4.2.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `dap_aff_comm`;
CREATE TABLE `dap_aff_comm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `per_lead_fixed` decimal(7,2) NOT NULL DEFAULT '0.00',
  `per_sale_fixed` decimal(7,2) NOT NULL DEFAULT '0.00',
  `per_sale_percentage` int(3) NOT NULL DEFAULT '0',
  `per_lead_fixed_credits` int(11) DEFAULT NULL,
  `per_sale_fixed_credits` int(11) DEFAULT NULL,
  `per_sale_percentage_credits` int(11) DEFAULT NULL,
  `is_comm_recurring` char(1) NOT NULL DEFAULT '' COMMENT 'Y/N',
  `tier` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`,`product_id`,`tier`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_aff_earnings`;
CREATE TABLE `dap_aff_earnings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aff_referrals_id` int(11) NOT NULL DEFAULT '0',
  `amount_earned` decimal(7,2) NOT NULL DEFAULT '0.00',
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `transaction_id` int(11) NOT NULL DEFAULT '0',
  `earning_type` char(2) NOT NULL COMMENT 'L-Lead, S-Sale, P-Payment, T-Tier',
  `aff_exports_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_aff_exports`;
CREATE TABLE `dap_aff_exports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_status` varchar(20) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_aff_payments`;
CREATE TABLE `dap_aff_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL DEFAULT '0',
  `amount_paid` decimal(7,2) NOT NULL DEFAULT '0.00',
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comments` text,
  `aff_exports_id` int(11) DEFAULT NULL,
  `earning_type` varchar(7) NOT NULL DEFAULT 'CASH',
  PRIMARY KEY (`id`),
  UNIQUE KEY `affiliate_id` (`affiliate_id`,`aff_exports_id`,`earning_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_aff_referrals`;
CREATE TABLE `dap_aff_referrals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `tier` int(3) NOT NULL DEFAULT '1',
  `referral_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE KEY `userproductkey` (`user_id`,`product_id`,`affiliate_id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_aff_stats`;
CREATE TABLE `dap_aff_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `http_referer` varchar(200) NOT NULL DEFAULT '',
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `useragent` varchar(50) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `dest_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_blob`;
CREATE TABLE `dap_blob` (
  `resource_id` int(11) NOT NULL,
  `content` longblob,
  `content_type` varchar(20) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  KEY `resource_id` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_cart`;
CREATE TABLE `dap_cart` (
  `product_id` varchar(20) NOT NULL,
  `show_coupon` char(1) DEFAULT 'N',
  `show_howdidyouhearboutus` char(1) DEFAULT 'N',
  `show_shiptoaddress` char(1) DEFAULT 'N',
  `show_tandc` char(1) DEFAULT NULL,
  `tandc` text,
  `require_tandc_acceptance` char(1) DEFAULT 'N',
  `request_phone` char(1) DEFAULT 'N',
  `request_fax` char(1) DEFAULT 'N',
  `request_address2` char(1) DEFAULT 'N',
  `require_billing_for_paypal` char(1) DEFAULT 'Y',
  `choose_password` char(1) DEFAULT 'N',
  `request_company` char(1) DEFAULT 'N',
  `show_comments` text,
  `cart_header` text,
  `cart_footer` text,
  `checkout_submit_image_url` varchar(100) DEFAULT NULL,
  `custom_fields` text,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_category`;
CREATE TABLE `dap_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_config`;
CREATE TABLE `dap_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `value` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(100) DEFAULT NULL,
  `editable` char(1) NOT NULL DEFAULT 'Y',
  `type` varchar(15) NOT NULL DEFAULT 'textbox',
  `values` text NOT NULL,
  `display_order` tinyint(4) DEFAULT NULL,
  `category` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_coupons`;
CREATE TABLE `dap_coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `description` text,
  `start_date` date NOT NULL DEFAULT '0000-00-00',
  `end_date` date NOT NULL DEFAULT '0000-00-00',
  `discount_amt` decimal(7,2) NOT NULL DEFAULT '0.00',
  `recurring_discount_amt` decimal(7,2) NOT NULL DEFAULT '0.00',
  `discount_rate` int(3) DEFAULT '0',
  `max_usage` int(11) DEFAULT '0',
  `actual_usage` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_credits`;
CREATE TABLE `dap_credits` (
  `userid` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `used` int(11) NOT NULL,
  `postid` bigint(20) NOT NULL,
  `title` varchar(300) DEFAULT NULL,
  `credits` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_cron`;
CREATE TABLE `dap_cron` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `last_update_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_custom_fields`;
CREATE TABLE `dap_custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `label` varchar(200) NOT NULL,
  `description` text,
  `showonlytoadmin` char(1) NOT NULL DEFAULT 'N',
  `allow_delete` char(1) NOT NULL DEFAULT 'Y',
  `required` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_data_mapping`;
CREATE TABLE `dap_data_mapping` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_emailorder_templates`;
CREATE TABLE `dap_emailorder_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `processor` varchar(40) NOT NULL,
  `blocks` varchar(50) NOT NULL,
  `template` text NOT NULL,
  `last_update_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_email_alias`;
CREATE TABLE `dap_email_alias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `source` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emailsource` (`email`,`source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_email_resources`;
CREATE TABLE `dap_email_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `attachment` text,
  `sendTo3rdParty` char(1) DEFAULT 'N' COMMENT 'Y or N',
  `thirdPartyEmailId` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_file_resources`;
CREATE TABLE `dap_file_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL DEFAULT '',
  `name` varchar(100) DEFAULT NULL,
  `display_in_list` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_forum_priority`;
CREATE TABLE `dap_forum_priority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_usergroupId` int(11) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueindex` (`target_usergroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_log`;
CREATE TABLE `dap_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logtime` datetime NOT NULL,
  `level` tinyint(4) NOT NULL,
  `msg` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_mass_actions`;
CREATE TABLE `dap_mass_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actionType` varchar(20) NOT NULL DEFAULT '',
  `actionKey` varchar(200) NOT NULL DEFAULT '000',
  `payload` text NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'NEW' COMMENT 'NEW',
  `comments` varchar(100) NOT NULL DEFAULT '',
  `priority` tinyint(4) NOT NULL DEFAULT '3',
  `last_update_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`actionType`,`actionKey`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_notifications`;
CREATE TABLE `dap_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_type` char(1) NOT NULL DEFAULT '',
  `notification_email` varchar(60) NOT NULL DEFAULT '',
  `notification_url` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_productchaining`;
CREATE TABLE `dap_productchaining` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_operation` varchar(50) NOT NULL,
  `source_product_id` int(11) NOT NULL,
  `target_operation` varchar(50) NOT NULL,
  `target_product_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `add_days` int(11) NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueindex` (`source_operation`,`source_product_id`,`target_operation`,`target_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_productforum`;
CREATE TABLE `dap_productforum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_operation` varchar(50) NOT NULL,
  `source_product_id` int(11) NOT NULL,
  `target_operation` varchar(50) NOT NULL,
  `target_usergroup_id` int(11) NOT NULL,
  `Title` char(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueindex` (`source_operation`,`source_product_id`,`target_operation`,`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_products`;
CREATE TABLE `dap_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` text,
  `error_page_url` varchar(100) DEFAULT NULL,
  `is_recurring` char(1) NOT NULL DEFAULT 'N',
  `price` decimal(7,2) NOT NULL DEFAULT '0.00',
  `trial_price` decimal(7,2) DEFAULT NULL,
  `total_occur` int(5) DEFAULT NULL,
  `recurring_cycle_1` smallint(6) DEFAULT NULL,
  `recurring_cycle_2` smallint(6) DEFAULT NULL,
  `recurring_cycle_3` smallint(6) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'I',
  `notification_id` int(11) NOT NULL DEFAULT '0',
  `thankyou_page_url` varchar(100) DEFAULT NULL,
  `thirdPartyEmailIds` varchar(200) DEFAULT NULL,
  `sales_page_url` varchar(100) DEFAULT NULL,
  `self_service_allowed` char(1) NOT NULL DEFAULT 'N',
  `resell_product` char(1) NOT NULL DEFAULT 'N',
  `is_master` char(1) NOT NULL DEFAULT 'N',
  `allowContentLevelCredits` char(1) DEFAULT 'N',
  `product_image_url` varchar(200) DEFAULT NULL,
  `credits` int(11) DEFAULT '0',
  `double_optin_subject` varchar(100) DEFAULT NULL,
  `double_optin_body` text,
  `thankyou_email_subject` varchar(100) DEFAULT NULL,
  `thankyou_email_body` text,
  `logged_in_url` varchar(100) DEFAULT NULL,
  `selfservice_start_date` date DEFAULT NULL,
  `selfservice_end_date` date DEFAULT NULL,
  `subscribe_to` text,
  `unsubscribe_from` text,
  `price_increment` decimal(7,2) DEFAULT NULL,
  `price_increment_ceil` decimal(7,2) DEFAULT NULL,
  `num_sales` int(5) DEFAULT '0',
  `num_days` smallint(6) DEFAULT '0',
  `timed_pricing_start_date` date DEFAULT '0000-00-00',
  `is_free_product` char(1) NOT NULL DEFAULT 'N',
  `allow_free_signup` char(1) NOT NULL DEFAULT 'N',
  `recurring_credits` int(10) DEFAULT '0',
  `product_image_url_linkedto` varchar(100) DEFAULT NULL,
  `short_description` varchar(127) DEFAULT NULL,
  `long_description` text,
  `access_expiration_action` varchar(100) DEFAULT 'NOACTION',
  `renewal_redirect_url` varchar(100) DEFAULT NULL,
  `renewal_html` text,
  `access_upon_final_payment` smallint(6) DEFAULT NULL,
  `buy_link` text,
  `show_buy_link` char(1) NOT NULL DEFAULT 'N',
  `future_content_access` char(1) NOT NULL DEFAULT 'N',
  `drip_type` int(4) NOT NULL DEFAULT '1',
  `member_product_links_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_products_category_jn`;
CREATE TABLE `dap_products_category_jn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `productcategorykey` (`product_id`,`category_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_products_coupons_jn`;
CREATE TABLE `dap_products_coupons_jn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `productcouponkey` (`product_id`,`coupon_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_products_mc_sss_jn`;
CREATE TABLE `dap_products_mc_sss_jn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `master_product_id` int(11) NOT NULL,
  `child_product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `masterchildkey` (`master_product_id`,`child_product_id`),
  KEY `master_product_id` (`master_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_products_resources_jn`;
CREATE TABLE `dap_products_resources_jn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `resource_id` int(11) NOT NULL DEFAULT '0',
  `sss_enabled` char(1) DEFAULT 'N',
  `credits_assigned` int(4) DEFAULT NULL,
  `excerpt` text,
  `is_free` char(1) NOT NULL DEFAULT 'N',
  `start_day` int(4) DEFAULT '1',
  `end_day` int(4) DEFAULT '9999',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `num_clicks` int(4) DEFAULT NULL,
  `resource_type` char(1) NOT NULL DEFAULT '',
  `status` char(1) NOT NULL DEFAULT 'A',
  `display_order` int(4) DEFAULT '1',
  `file_resource_id` int(11) DEFAULT '0',
  `pay_per_post` decimal(7,2) DEFAULT '0.00',
  `cond_drip_order` decimal(5,3) DEFAULT '0.000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id_2` (`product_id`,`resource_id`,`resource_type`,`start_day`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_smtp_servers`;
CREATE TABLE `dap_smtp_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(30) NOT NULL,
  `server` varchar(50) NOT NULL,
  `port` int(11) NOT NULL DEFAULT '25',
  `ssl` varchar(1) NOT NULL DEFAULT 'N',
  `userid` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `limit_per_hour` int(11) NOT NULL DEFAULT '100',
  `running_total` int(11) NOT NULL DEFAULT '0',
  `active` varchar(1) NOT NULL DEFAULT 'Y',
  `last_updated_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_supportticket`;
CREATE TABLE `dap_supportticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_product_id` int(11) NOT NULL,
  `support_access_url` varchar(200) NOT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueindex` (`source_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_templates`;
CREATE TABLE `dap_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `category` varchar(10) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_transactions`;
CREATE TABLE `dap_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_num` varchar(30) NOT NULL DEFAULT '0',
  `trans_type` varchar(20) NOT NULL DEFAULT '',
  `payment_status` varchar(20) NOT NULL DEFAULT '',
  `payment_currency` varchar(20) NOT NULL DEFAULT '',
  `payment_value` decimal(7,2) DEFAULT '0.00',
  `payer_email` varchar(60) NOT NULL DEFAULT '',
  `sub_trans_num` varchar(20) NOT NULL DEFAULT '',
  `payment_processor` varchar(20) NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `trans_blob` text NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `trans_num` (`trans_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_users`;
CREATE TABLE `dap_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL DEFAULT '',
  `last_name` varchar(20) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `email` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(40) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `company` varchar(40) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `is_affiliate` char(1) NOT NULL DEFAULT 'Y',
  `last_login_date` date DEFAULT '0000-00-00',
  `activation_key` varchar(20) DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT 'U',
  `login_count` int(11) NOT NULL DEFAULT '0',
  `ipaddress` varchar(20) DEFAULT '0.0.0.0',
  `account_type` char(1) NOT NULL DEFAULT 'U',
  `signup_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `paypal_email` varchar(60) DEFAULT NULL,
  `last_update_date` date NOT NULL DEFAULT '0000-00-00',
  `aff_nick` varchar(10) DEFAULT NULL,
  `opted_out` char(1) NOT NULL DEFAULT 'N',
  `self_service_status` char(1) NOT NULL DEFAULT 'I' COMMENT 'A/I (Active, Inactive)',
  `credits_available` int(11) NOT NULL DEFAULT '0',
  `exclude_iplogging` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `dap_users` (`id`, `first_name`, `last_name`, `user_name`, `email`, `password`, `address1`, `address2`, `city`, `state`, `zip`, `country`, `phone`, `fax`, `company`, `title`, `is_affiliate`, `last_login_date`, `activation_key`, `status`, `login_count`, `ipaddress`, `account_type`, `signup_date`, `paypal_email`, `last_update_date`, `aff_nick`, `opted_out`, `self_service_status`, `credits_available`, `exclude_iplogging`) VALUES
(1,	'Tom',	'Mack',	'admin',	'support@feedlead.com',	'Yn3fsTiWUs8P/KhJwkNfyWVloO+1hSxqXmX3tR9mHa8=',	'5840 Red Bug Lake Road',	'Suite 545',	'Winter Springs',	'FL',	'32708',	'US',	'407-359-2220',	'',	'Feed Lead Corporation',	'Pres',	'Y',	'2017-01-09',	'0',	'A',	1298,	'50.88.228.99',	'A',	'2015-07-30 16:38:55',	'',	'2017-01-09',	NULL,	'N',	'I',	127,	'N'),
(2,	'Tom',	'Mack',	'MackTom',	'feedleadcalls@gmail.com',	'Yn3fsTiWUs8P/KhJwkNfyWVloO+1hSxqXmX3tR9mHa8=',	'5840 Red Bug Lake Road',	'',	'Winter Springs',	'FL',	'32708',	'USA',	'407-359-2220',	'',	'Feed Lead Corporation',	'',	'Y',	'2015-08-07',	'55c3bcc1ae34f',	'A',	2,	'72.239.18.211',	'U',	'2015-08-06 16:00:01',	'tmack11@earthlink.net',	'2015-08-07',	NULL,	'N',	'I',	0,	'N'),
(4,	'Mary',	'Carling',	'MaryCarling',	'mary.carling@earthlink.net',	'O/P/zVhT00rseKhBy0Eojym0IaBQ87HnCD6XeFLPgA0=',	'17 Claridge Drive',	'',	'Middletown',	'NJ',	'07748',	'USA',	'732-415-2610',	'',	'',	'',	'Y',	'2015-08-28',	'55c527598d7ee',	'A',	36,	'72.239.18.211',	'U',	'2015-08-07 17:47:05',	'mary.carling@earthlink.net',	'2015-08-28',	NULL,	'N',	'I',	0,	'N'),
(2759,	'Dewey, Cheatem',	'and Howe',	'DCH',	'dch@gmall.com',	'O/P/zVhT00rseKhBy0Eojym0IaBQ87HnCD6XeFLPgA0=',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'Y',	'2015-08-17',	'55d1fa65ae898',	'A',	3,	'72.239.18.211',	'U',	'2015-08-17 11:14:45',	'',	'2015-08-17',	NULL,	'N',	'I',	0,	'N'),
(2760,	'Ron',	'Williams',	'RonWilliams',	'WebmasterProducer@gmail.comx',	'ww+Cjo9lpS8jvAnM5o5MB6Lf7FJnSd8H7IrRtClHOuI=',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'Y',	'2015-08-26',	'55d9592c82b15',	'I',	2,	'72.239.18.211',	'U',	'2015-08-23 01:25:00',	'WebmasterProducer@gmail.comx',	'2015-10-02',	NULL,	'N',	'I',	0,	'N'),
(2761,	'Carl',	'Morais',	'CarlMorais',	'carl.morais@videotron.ca',	'V57lzHIEmQvx88WkhVLsFJMGAo+WxQO2xrvP/gbfEoU=',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'Y',	'2015-11-23',	'55de6344b513c',	'A',	2,	'70.80.143.186',	'U',	'2015-08-26 21:09:24',	'carl.morais@videotron.ca',	'2015-11-23',	NULL,	'N',	'I',	0,	'N'),
(2800,	'Glenn',	'Burgess',	'2gunzoo',	'glenn@2gunzoo.com',	'a0CxMeyZjIVOFk7q6skv2LuYYlDc2Mx6uYMoh05GZws=',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'Y',	'0000-00-00',	'56106a2cc5b18',	'A',	0,	'0.0.0.0',	'U',	'2015-10-03 19:52:12',	'',	'2015-10-23',	NULL,	'N',	'I',	0,	'N'),
(2801,	'Georgina',	'Copley',	'GeorginaCopley9',	'mikulchik.1993@mail.ru',	'oaOTNL5+s27aAtCSBDNGfF9ZJXb43nhKrtvemLfhkE8=',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'Y',	'0000-00-00',	'5620da353053c',	'A',	0,	'0.0.0.0',	'U',	'2015-10-16 07:06:29',	'',	'2015-10-20',	NULL,	'N',	'I',	0,	'N'),
(2802,	'Chris',	'Brown',	'ChrisBrown',	'chris@orlmtgpro.com',	'BCyZtpoUo7oRzuIkGW1zZcVjsDGFQjJ1hRQvmMIJQ4o=',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'Y',	'2015-10-17',	'562248bab8bb3',	'A',	1,	'184.4.123.8',	'U',	'2015-10-17 09:10:18',	'',	'2016-07-18',	NULL,	'N',	'I',	15,	'N'),
(2804,	'Fernando',	'Troutman',	'FernandoTroutman',	'teztarn@conusa.org',	'jkBUGfAH+imjvcRqpzHY9BhiMK3BkkH9IJ+85APyieM=',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'Y',	'0000-00-00',	'56239fa84111d',	'A',	0,	'0.0.0.0',	'U',	'2015-10-18 09:33:28',	'',	'2015-10-20',	NULL,	'N',	'I',	0,	'N'),
(2805,	'Jay',	'Glenna',	'JayItd516941',	'glenna3@c.blog-stuff.com',	'iSoR+ViBSXsdOPQ3xX7Bm+owUCujsGrz6mm3EeNAoDI=',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'Y',	'0000-00-00',	'5627a2a60ddc7',	'A',	0,	'0.0.0.0',	'U',	'2015-10-21 10:35:18',	'',	'2015-10-23',	NULL,	'N',	'I',	0,	'N'),
(2806,	'Celest',	'Raingoetz',	'CelsaR86337021',	'rainagoetz6730@spamavert.com',	'TnTHpv1RnHWJUpkaZxpAnkcIbwwqTZaduLMaapVuyZc=',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'Y',	'0000-00-00',	'5629457a848f9',	'A',	0,	'0.0.0.0',	'U',	'2015-10-22 16:22:18',	'',	'2015-10-23',	NULL,	'N',	'I',	0,	'N'),
(2810,	'Brett',	'Pojunis',	'BrettPojunis',	'brett@pojunis.com',	'1YXWsPiJKpvIn2N8FZUOvC8Pf0j5833b+gwxQ1hMKEE=',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'Y',	'2015-12-14',	'56533c7f665f0',	'A',	12,	'172.56.40.23',	'U',	'2015-11-23 11:19:11',	'',	'2015-12-14',	NULL,	'N',	'I',	0,	'N'),
(2812,	'Jean',	'Mondesir',	'JeanMondesir',	'metleads1@gmail.com',	'bi/D8EwU6OhYCWxU/ZnQv+KqFmNshqGuMdaJOY/2c94=',	'2286 S delaware dr',	'203',	'mt prospect',	'Illinois',	'60056',	'',	'8479710334',	'',	'SBCF',	'Broker',	'Y',	'2015-12-21',	'5665cde078bff',	'A',	20,	'50.153.156.164',	'U',	'2015-12-07 13:20:16',	'jrm8807@gmail.com',	'2016-01-08',	NULL,	'N',	'I',	0,	'N'),
(2817,	'John',	'Hall',	'JohnHall',	'johnhall407@gmail.com',	'oi4FVYaPRyDlutLgReY/lxzatROU7zElskQ9B1VY0co=',	'1799 Lakelet Loop',	'',	'Oviedo',	'FL',	'32765',	'United States',	'4073105755',	'',	'John Hall',	'VP Business Developm',	'Y',	'2016-04-26',	'56906d05eaedd',	'A',	4,	'97.100.167.227',	'U',	'2016-01-08 21:14:29',	'johnhall407@gmail.com',	'2016-04-26',	NULL,	'N',	'I',	0,	'N'),
(2824,	'James',	'Payne',	'myoilguide',	'jc@myoilguide.com',	'vujGT6bleEJ8PxYPIqXh5TcdzIUWRe3EUnplmCvIly8=',	'5326 Wellfleet dr',	'',	'Sarasota',	'Florida',	'34241',	'USA',	'941 321-6433',	'',	'Health Network by JC',	'Owner',	'Y',	'2016-04-04',	'56e200434e077',	'A',	5,	'71.99.48.48',	'U',	'2016-03-10 18:16:19',	'jc@myoilguide.com',	'2016-04-04',	NULL,	'N',	'I',	0,	'N'),
(2831,	'Paul',	'Moore',	'PaulMoore',	'paul@eliteautoshipper.com',	'xUKtIUqXRIS/OqqanlMYZtJMOP+Zb/2oVgB+Y00MLuQ=',	'',	'',	'',	'',	'',	'',	'',	'',	'Elite Auto Shipper',	'',	'Y',	'2016-05-07',	'571e47ccebde3',	'A',	18,	'72.239.18.211',	'U',	'2016-04-25 12:37:32',	'info@eliteautoshipper.com',	'2016-05-07',	NULL,	'N',	'I',	0,	'N'),
(2847,	'Bernie',	'Sands',	'Bsands',	'sands_b_22810@gmail.com',	'/R3sokTyZdVSRjr1b97K6J3tonY8qCVMMZelsZ+OzMo=',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'Y',	'0000-00-00',	'576073a093baf',	'A',	0,	'0.0.0.0',	'U',	'2016-06-14 17:14:08',	NULL,	'2016-06-14',	NULL,	'N',	'I',	0,	'N'),
(2848,	'',	'',	'daisyrinehart4',	'daisy.rinehart12@price.salazza.com',	'qJqNTLDsUAcpe2aKNWUlM60ihfF95LNpV62F+E2Vxb0=',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'Y',	'0000-00-00',	'576200c9ae34f',	'A',	0,	'0.0.0.0',	'U',	'2016-06-15 21:28:41',	NULL,	'2016-06-15',	NULL,	'N',	'I',	0,	'N'),
(2849,	'Veena',	'Prashanth',	'veena',	'veena@feedlead.com',	'ANRfNfOk63F7ArD7v52I4yZ2h6sK9r0FVfTzKNopi8w=',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'Y',	'0000-00-00',	'57675f6871587',	'A',	0,	'0.0.0.0',	'U',	'2016-06-19 23:13:44',	NULL,	'2016-06-19',	NULL,	'N',	'I',	0,	'N'),
(2850,	'Tony',	'Candalino',	'tonyc',	'tony@cmpfl.com',	'AX2ugBteNDEr44T2JrMDAOs3tXktNzyJ6WAXYidKcwg=',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'Y',	'0000-00-00',	'5783cb3c17045',	'A',	0,	'0.0.0.0',	'U',	'2016-07-11 12:37:16',	'',	'2016-07-11',	NULL,	'N',	'I',	0,	'N'),
(2851,	'Robin',	'Winkler',	'RobinWinkler',	'robin.winkler@firstintitle.com',	'1KIcbvyxGNeplDBgHVHhI2X5oo6GDarf2Gnw3XOZe+U=',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'Y',	'2016-08-31',	'57c6deb074c14',	'A',	1,	'64.135.70.34',	'U',	'2016-08-31 09:42:08',	'',	'2016-08-31',	NULL,	'N',	'I',	0,	'N'),
(2853,	'Tom',	'Mack',	'tom.enrich',	'tom@enri.ch',	'lWxOuah9OpK7r1uEOB8NXmLENzAYWWin7RQKdR9Eidw=',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'Y',	'2016-10-26',	'580199a6ec6ea',	'A',	27,	'50.88.238.190',	'U',	'2016-10-14 22:51:18',	'',	'2016-10-26',	NULL,	'N',	'I',	15,	'N'),
(2855,	'Minh',	'Ta',	'tahoangminh269',	'tahoangminh269@gmail.com',	'dc4b56ff4967374b261a29cd4a90580d',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'Y',	'0000-00-00',	'0',	'A',	0,	'0.0.0.0',	'U',	'0000-00-00 00:00:00',	NULL,	'0000-00-00',	NULL,	'N',	'I',	0,	'N'),
(2856,	'Woody De Boss',	'Forest',	'WoodyForest',	'woody@feedlead.com',	'Yn3fsTiWUs8P/KhJwkNfyWVloO+1hSxqXmX3tR9mHa8=',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'Y',	'2016-11-15',	'582aa366183e1',	'A',	2,	'50.88.238.190',	'U',	'2016-11-15 05:55:37',	'',	'2016-11-15',	NULL,	'N',	'I',	15,	'N'),
(2859,	'Richie',	'Robot',	'RichieRobot',	'enrich.robots@gmail.com',	'yN0WnoKb5AA7lwxpIYHkPY/c0Q0g6Ww16oKfG2KYzUA=',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'Y',	'2016-11-15',	'582b22b936c11',	'A',	1,	'50.88.238.190',	'U',	'2016-11-15 14:58:52',	'',	'2016-12-29',	NULL,	'N',	'I',	15,	'N'),
(2861,	'Will',	'Woodlief',	'willwoodlief',	'willwoodlief@gmail.com',	'WDCbm/OAvMgGXpGynX3V/Roc5DBY4MLmIFbb55oorjI=',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'Y',	'0000-00-00',	'582c6c511cb87',	'A',	0,	'0.0.0.0',	'U',	'2016-11-16 14:25:07',	NULL,	'2016-11-16',	NULL,	'N',	'I',	0,	'N');

DROP TABLE IF EXISTS `dap_users_credits`;
CREATE TABLE `dap_users_credits` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL DEFAULT '0',
  `credits_earned` int(11) NOT NULL DEFAULT '0',
  `credits_spent` int(11) NOT NULL DEFAULT '0',
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comments` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_users_custom`;
CREATE TABLE `dap_users_custom` (
  `user_id` int(11) NOT NULL,
  `custom_id` int(11) NOT NULL,
  `custom_value` text,
  UNIQUE KEY `user_custom` (`user_id`,`custom_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_users_logins`;
CREATE TABLE `dap_users_logins` (
  `user_id` varchar(11) NOT NULL DEFAULT '',
  `login_ip` varchar(20) NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`login_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_users_products_jn`;
CREATE TABLE `dap_users_products_jn` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `access_start_date` date NOT NULL DEFAULT '0000-00-00',
  `access_end_date` date NOT NULL DEFAULT '0000-00-00',
  `transaction_id` int(11) DEFAULT '0' COMMENT '-1: direct sign up for free resources // -2: admin sign up for free resources // -3: admin paid sign up for all resources',
  `coupon_id` int(11) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  UNIQUE KEY `userproductkey` (`user_id`,`product_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dap_users_resources_jn`;
CREATE TABLE `dap_users_resources_jn` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `resource_id` int(11) NOT NULL DEFAULT '0',
  `click_count` int(3) NOT NULL DEFAULT '0',
  UNIQUE KEY `user_resource` (`user_id`,`resource_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ost_api_key`;
CREATE TABLE `ost_api_key` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `ipaddr` varchar(16) NOT NULL,
  `apikey` varchar(255) NOT NULL,
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipaddr` (`ipaddr`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ost_config`;
CREATE TABLE `ost_config` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `isonline` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timezone_offset` float(3,1) NOT NULL DEFAULT '0.0',
  `enable_daylight_saving` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `staff_ip_binding` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `staff_max_logins` tinyint(3) unsigned NOT NULL DEFAULT '4',
  `staff_login_timeout` int(10) unsigned NOT NULL DEFAULT '2',
  `staff_session_timeout` int(10) unsigned NOT NULL DEFAULT '30',
  `client_max_logins` tinyint(3) unsigned NOT NULL DEFAULT '4',
  `client_login_timeout` int(10) unsigned NOT NULL DEFAULT '2',
  `client_session_timeout` int(10) unsigned NOT NULL DEFAULT '30',
  `max_page_size` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `max_open_tickets` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `max_file_size` int(11) unsigned NOT NULL DEFAULT '1048576',
  `autolock_minutes` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `overdue_grace_period` int(10) unsigned NOT NULL DEFAULT '0',
  `alert_email_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `default_email_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `default_dept_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `default_priority_id` tinyint(2) unsigned NOT NULL DEFAULT '2',
  `default_template_id` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `default_smtp_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `spoof_default_smtp` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `clickable_urls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allow_priority_change` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `use_email_priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_captcha` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_auto_cron` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_mail_fetch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_email_piping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `send_sql_errors` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `send_mailparse_errors` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `send_login_errors` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `save_email_headers` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `strip_quoted_reply` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `log_ticket_activity` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ticket_autoresponder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_autoresponder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ticket_notice_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ticket_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ticket_alert_admin` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ticket_alert_dept_manager` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ticket_alert_dept_members` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_alert_laststaff` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message_alert_assigned` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message_alert_dept_manager` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `note_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `note_alert_laststaff` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `note_alert_assigned` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `note_alert_dept_manager` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overdue_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overdue_alert_assigned` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `overdue_alert_dept_manager` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `overdue_alert_dept_members` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_assign_reopened_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `show_assigned_tickets` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `show_answered_tickets` tinyint(1) NOT NULL DEFAULT '0',
  `hide_staff_name` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overlimit_notice_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `email_attachments` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allow_attachments` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_email_attachments` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_online_attachments` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_online_attachments_onlogin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `random_ticket_ids` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `log_level` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `log_graceperiod` int(10) unsigned NOT NULL DEFAULT '12',
  `upload_dir` varchar(255) NOT NULL DEFAULT '',
  `allowed_filetypes` varchar(255) NOT NULL DEFAULT '.doc, .pdf',
  `time_format` varchar(32) NOT NULL DEFAULT ' h:i A',
  `date_format` varchar(32) NOT NULL DEFAULT 'm/d/Y',
  `datetime_format` varchar(60) NOT NULL DEFAULT 'm/d/Y g:i a',
  `daydatetime_format` varchar(60) NOT NULL DEFAULT 'D, M j Y g:ia',
  `reply_separator` varchar(60) NOT NULL DEFAULT '-- do not edit --',
  `admin_email` varchar(125) NOT NULL DEFAULT '',
  `helpdesk_title` varchar(255) NOT NULL DEFAULT 'osTicket Support Ticket System',
  `helpdesk_url` varchar(255) NOT NULL DEFAULT '',
  `api_passphrase` varchar(125) NOT NULL DEFAULT '',
  `ostversion` varchar(16) NOT NULL DEFAULT '',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `isoffline` (`isonline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ost_department`;
CREATE TABLE `ost_department` (
  `dept_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tpl_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `autoresp_email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `manager_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_name` varchar(32) NOT NULL DEFAULT '',
  `dept_signature` tinytext NOT NULL,
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ticket_auto_response` tinyint(1) NOT NULL DEFAULT '1',
  `message_auto_response` tinyint(1) NOT NULL DEFAULT '0',
  `can_append_signature` tinyint(1) NOT NULL DEFAULT '1',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`dept_id`),
  UNIQUE KEY `dept_name` (`dept_name`),
  KEY `manager_id` (`manager_id`),
  KEY `autoresp_email_id` (`autoresp_email_id`),
  KEY `tpl_id` (`tpl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ost_email`;
CREATE TABLE `ost_email` (
  `email_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `noautoresp` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `priority_id` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `dept_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `email` varchar(125) NOT NULL DEFAULT '',
  `name` varchar(32) NOT NULL DEFAULT '',
  `userid` varchar(125) NOT NULL,
  `userpass` varchar(125) NOT NULL,
  `mail_active` tinyint(1) NOT NULL DEFAULT '0',
  `mail_host` varchar(125) NOT NULL,
  `mail_protocol` enum('POP','IMAP') NOT NULL DEFAULT 'POP',
  `mail_encryption` enum('NONE','SSL') NOT NULL,
  `mail_port` int(6) DEFAULT NULL,
  `mail_fetchfreq` tinyint(3) NOT NULL DEFAULT '5',
  `mail_fetchmax` tinyint(4) NOT NULL DEFAULT '30',
  `mail_delete` tinyint(1) NOT NULL DEFAULT '0',
  `mail_errors` tinyint(3) NOT NULL DEFAULT '0',
  `mail_lasterror` datetime DEFAULT NULL,
  `mail_lastfetch` datetime DEFAULT NULL,
  `smtp_active` tinyint(1) DEFAULT '0',
  `smtp_host` varchar(125) NOT NULL,
  `smtp_port` int(6) DEFAULT NULL,
  `smtp_secure` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_auth` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email` (`email`),
  KEY `priority_id` (`priority_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ost_email_banlist`;
CREATE TABLE `ost_email_banlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `submitter` varchar(126) NOT NULL DEFAULT '',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ost_email_template`;
CREATE TABLE `ost_email_template` (
  `tpl_id` int(11) NOT NULL AUTO_INCREMENT,
  `cfg_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `ticket_autoresp_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_autoresp_body` text NOT NULL,
  `ticket_notice_subj` varchar(255) NOT NULL,
  `ticket_notice_body` text NOT NULL,
  `ticket_alert_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_alert_body` text NOT NULL,
  `message_autoresp_subj` varchar(255) NOT NULL DEFAULT '',
  `message_autoresp_body` text NOT NULL,
  `message_alert_subj` varchar(255) NOT NULL DEFAULT '',
  `message_alert_body` text NOT NULL,
  `note_alert_subj` varchar(255) NOT NULL,
  `note_alert_body` text NOT NULL,
  `assigned_alert_subj` varchar(255) NOT NULL DEFAULT '',
  `assigned_alert_body` text NOT NULL,
  `ticket_overdue_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_overdue_body` text NOT NULL,
  `ticket_overlimit_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_overlimit_body` text NOT NULL,
  `ticket_reply_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_reply_body` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tpl_id`),
  KEY `cfg_id` (`cfg_id`),
  FULLTEXT KEY `message_subj` (`ticket_reply_subj`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ost_groups`;
CREATE TABLE `ost_groups` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL DEFAULT '',
  `dept_access` varchar(255) NOT NULL DEFAULT '',
  `can_create_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_edit_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_delete_tickets` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_close_tickets` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_transfer_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_ban_emails` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_manage_kb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`group_id`),
  KEY `group_active` (`group_enabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ost_help_topic`;
CREATE TABLE `ost_help_topic` (
  `topic_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `noautoresp` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `priority_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dept_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `topic` varchar(32) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`topic_id`),
  UNIQUE KEY `topic` (`topic`),
  KEY `priority_id` (`priority_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ost_kb_premade`;
CREATE TABLE `ost_kb_premade` (
  `premade_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `isenabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `title` varchar(125) NOT NULL DEFAULT '',
  `answer` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`premade_id`),
  UNIQUE KEY `title_2` (`title`),
  KEY `dept_id` (`dept_id`),
  KEY `active` (`isenabled`),
  FULLTEXT KEY `title` (`title`,`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ost_staff`;
CREATE TABLE `ost_staff` (
  `staff_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(32) NOT NULL DEFAULT '',
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `passwd` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `phone` varchar(24) NOT NULL DEFAULT '',
  `phone_ext` varchar(6) DEFAULT NULL,
  `mobile` varchar(24) NOT NULL DEFAULT '',
  `signature` tinytext NOT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `isvisible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `onvacation` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `daylight_saving` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `append_signature` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `change_passwd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timezone_offset` float(3,1) NOT NULL DEFAULT '0.0',
  `max_page_size` int(11) unsigned NOT NULL DEFAULT '0',
  `auto_refresh_rate` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastlogin` datetime DEFAULT NULL,
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `username` (`username`),
  KEY `dept_id` (`dept_id`),
  KEY `issuperuser` (`isadmin`),
  KEY `group_id` (`group_id`,`staff_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ost_syslog`;
CREATE TABLE `ost_syslog` (
  `log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` enum('Debug','Warning','Error') NOT NULL,
  `title` varchar(255) NOT NULL,
  `log` text NOT NULL,
  `logger` varchar(64) NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`log_id`),
  KEY `log_type` (`log_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ost_ticket`;
CREATE TABLE `ost_ticket` (
  `ticket_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticketID` int(11) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '1',
  `priority_id` int(10) unsigned NOT NULL DEFAULT '2',
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(120) NOT NULL DEFAULT '',
  `name` varchar(32) NOT NULL DEFAULT '',
  `subject` varchar(64) NOT NULL DEFAULT '[no subject]',
  `helptopic` varchar(255) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `phone_ext` varchar(8) DEFAULT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '',
  `status` enum('open','closed') NOT NULL DEFAULT 'open',
  `source` enum('Web','Email','Phone','Other') NOT NULL DEFAULT 'Other',
  `isoverdue` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isanswered` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `reopened` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `lastmessage` datetime DEFAULT NULL,
  `lastresponse` datetime DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ticket_id`),
  UNIQUE KEY `email_extid` (`ticketID`,`email`),
  KEY `dept_id` (`dept_id`),
  KEY `staff_id` (`staff_id`),
  KEY `status` (`status`),
  KEY `priority_id` (`priority_id`),
  KEY `created` (`created`),
  KEY `closed` (`closed`),
  KEY `duedate` (`duedate`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ost_ticket_attachment`;
CREATE TABLE `ost_ticket_attachment` (
  `attach_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ref_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ref_type` enum('M','R') NOT NULL DEFAULT 'M',
  `file_size` varchar(32) NOT NULL DEFAULT '',
  `file_name` varchar(128) NOT NULL DEFAULT '',
  `file_key` varchar(128) NOT NULL DEFAULT '',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`attach_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `ref_type` (`ref_type`),
  KEY `ref_id` (`ref_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ost_ticket_lock`;
CREATE TABLE `ost_ticket_lock` (
  `lock_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `expire` datetime DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`lock_id`),
  UNIQUE KEY `ticket_id` (`ticket_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ost_ticket_message`;
CREATE TABLE `ost_ticket_message` (
  `msg_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `messageId` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `headers` text,
  `source` varchar(16) DEFAULT NULL,
  `ip_address` varchar(16) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`msg_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `msgId` (`messageId`),
  FULLTEXT KEY `message` (`message`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ost_ticket_note`;
CREATE TABLE `ost_ticket_note` (
  `note_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `source` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT 'Generic Intermal Notes',
  `note` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`note_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `staff_id` (`staff_id`),
  FULLTEXT KEY `note` (`note`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ost_ticket_priority`;
CREATE TABLE `ost_ticket_priority` (
  `priority_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `priority` varchar(60) NOT NULL DEFAULT '',
  `priority_desc` varchar(30) NOT NULL DEFAULT '',
  `priority_color` varchar(7) NOT NULL DEFAULT '',
  `priority_urgency` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`priority_id`),
  UNIQUE KEY `priority` (`priority`),
  KEY `priority_urgency` (`priority_urgency`),
  KEY `ispublic` (`ispublic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ost_ticket_response`;
CREATE TABLE `ost_ticket_response` (
  `response_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `msg_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_name` varchar(32) NOT NULL DEFAULT '',
  `response` text NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`response_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `msg_id` (`msg_id`),
  KEY `staff_id` (`staff_id`),
  FULLTEXT KEY `response` (`response`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ost_timezone`;
CREATE TABLE `ost_timezone` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `offset` float(3,1) NOT NULL DEFAULT '0.0',
  `timezone` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wz_aslfb_ad_records`;
CREATE TABLE `wz_aslfb_ad_records` (
  `fr_id` int(12) NOT NULL AUTO_INCREMENT,
  `fr_picture` varchar(200) NOT NULL,
  `fr_text` varchar(100) NOT NULL,
  `fr_destination` varchar(100) NOT NULL,
  `fr_status` varchar(12) NOT NULL,
  `fr_window_location` varchar(20) NOT NULL,
  PRIMARY KEY (`fr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `wz_bpspro_db_backup`;
CREATE TABLE `wz_bpspro_db_backup` (
  `bps_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bps_table_name` text NOT NULL,
  `bps_desc` text NOT NULL,
  `bps_job_type` varchar(9) NOT NULL DEFAULT '',
  `bps_frequency` varchar(7) NOT NULL DEFAULT '',
  `bps_last_job` varchar(30) NOT NULL DEFAULT '',
  `bps_next_job` varchar(30) NOT NULL DEFAULT '',
  `bps_next_job_unix` varchar(10) NOT NULL DEFAULT '',
  `bps_email_zip` varchar(10) NOT NULL DEFAULT '',
  `bps_job_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE KEY `bps_id` (`bps_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `wz_bpspro_login_security`;
CREATE TABLE `wz_bpspro_login_security` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `status` varchar(60) NOT NULL DEFAULT '',
  `user_id` varchar(60) NOT NULL DEFAULT '',
  `username` varchar(60) NOT NULL DEFAULT '',
  `public_name` varchar(250) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `role` varchar(15) NOT NULL DEFAULT '',
  `human_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `login_time` varchar(10) NOT NULL DEFAULT '',
  `lockout_time` varchar(10) NOT NULL DEFAULT '',
  `failed_logins` varchar(2) NOT NULL DEFAULT '',
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `hostname` varchar(60) NOT NULL DEFAULT '',
  `request_uri` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `wz_bpspro_seclog_ignore`;
CREATE TABLE `wz_bpspro_seclog_ignore` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_agent_bot` text NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `wz_cf7dbplugin_st`;
CREATE TABLE `wz_cf7dbplugin_st` (
  `submit_time` decimal(16,4) NOT NULL,
  PRIMARY KEY (`submit_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wz_cf7dbplugin_submits`;
CREATE TABLE `wz_cf7dbplugin_submits` (
  `submit_time` decimal(16,4) NOT NULL,
  `form_name` varchar(127) CHARACTER SET utf8 DEFAULT NULL,
  `field_name` varchar(127) CHARACTER SET utf8 DEFAULT NULL,
  `field_value` longtext CHARACTER SET utf8,
  `field_order` int(11) DEFAULT NULL,
  `file` longblob,
  KEY `submit_time_idx` (`submit_time`),
  KEY `form_name_idx` (`form_name`),
  KEY `field_name_idx` (`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


SET NAMES utf8mb4;

DROP TABLE IF EXISTS `wz_commentmeta`;
CREATE TABLE `wz_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wz_comments`;
CREATE TABLE `wz_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wz_duplicator_packages`;
CREATE TABLE `wz_duplicator_packages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `hash` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `owner` varchar(60) NOT NULL,
  `package` mediumblob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wz_ewwwio_images`;
CREATE TABLE `wz_ewwwio_images` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `results` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_size` int(10) unsigned DEFAULT NULL,
  `orig_size` int(10) unsigned DEFAULT NULL,
  `updates` int(5) unsigned DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `trace` blob,
  `attachment_id` bigint(20) unsigned DEFAULT NULL,
  `resize` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `converted` text COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `path_image_size` (`path`(191),`image_size`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wz_fsqm_direct_13`;
CREATE TABLE `wz_fsqm_direct_13` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `form_id` bigint(20) unsigned NOT NULL DEFAULT '13',
  `pinfo0` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'First Name',
  `pinfo1` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Last Name',
  `pinfo2` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Contact Email',
  `pinfo3` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Contact Phone',
  `pinfo4` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinfo5` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinfo6` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Company Name',
  `pinfo7` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Notifications Email',
  `pinfo8` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Your SMS Number',
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_id` (`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wz_fsqm_direct_16`;
CREATE TABLE `wz_fsqm_direct_16` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` bigint(20) unsigned DEFAULT NULL,
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `form_id` bigint(20) unsigned NOT NULL DEFAULT '16',
  `mcq14` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'What is your Subscription Level?',
  `mcq0` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Enable New Lead Text Notification?',
  `mcq1` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Enable New Lead Email Notification?',
  `mcq2` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Enable Copy of Lead SMS',
  `mcq28` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Enable Google Docs Spreadsheet',
  `mcq30` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Enable Team Communications Connection',
  `mcq29` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Which Team Communications Application Do You Use?',
  `mcq4` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Enable Personalized SMS To New Prospects?',
  `mcq5` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Send "Time of Day" Based Messages?',
  `mcq17` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Enable Email Drip Campaign',
  `mcq18` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Which Email Service Will We Use?',
  `mcq6` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Enable Tee-up Phone Call',
  `mcq10` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Choose your Lead Provider',
  `mcq9` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Zillow / Trulia Mortgage Leads',
  `mcq11` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Zillow / Trulia Real Estate Leads',
  `mcq32` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Realtor.com Real Estate Leads',
  `mcq33` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Move.com Real Estate Leads',
  `mcq34` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Zumper Real Estate Rental Leads',
  `mcq12` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Home Advisor',
  `mcq13` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Angies List',
  `mcq21` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Enable CRM Intergration',
  `mcq22` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Chose your CRM',
  `mcq19` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Enable LinkedIn Invitation to Connect',
  `mcq20` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Enable Facebook Business Page Invitation',
  `mcq36` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Enable Google Contacts',
  `mcq37` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Enable Office 365 Contacts',
  `mcq23` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Enable Magic Voicemail',
  `mcq25` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Enable Data Merged PDF',
  `mcq24` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Enable Personalized Post Card - Snail Mail',
  `mcq26` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Enable Personalized Fax',
  `pinfo5` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'First Name',
  `pinfo7` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Last Name',
  `pinfo8` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Company Name',
  `pinfo9` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Email',
  `pinfo6` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Phone - 10 Digit Phone Number - Numbers Only',
  `pinfo12` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Cell Phone Number - 10 Digit Phone Number - Numbers Only',
  `pinfo11` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Additional Cell Phone Number - 10 Digit Phone Number - Numbe',
  `pinfo14` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Email Address',
  `pinfo15` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Additional Email Address',
  `pinfo13` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Cell Phone Number - 10 Digit Phone Number - Numbers Only',
  `pinfo10` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Additional Cell Phone Number - 10 Digit Phone Number - Numbe',
  `pinfo53` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Gmail Address (Google Email Address)',
  `pinfo56` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Username',
  `pinfo57` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Password',
  `pinfo58` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Team',
  `pinfo39` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Your Default Text Message',
  `pinfo40` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Early Morning Text Message',
  `pinfo41` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Day Time Text Message',
  `pinfo42` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Evening Text Message',
  `pinfo43` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Late Night Text Message',
  `pinfo16` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Username',
  `pinfo59` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Password',
  `pinfo18` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Contact List Name',
  `pinfo19` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Campaign Name',
  `pinfo54` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'CRM Username',
  `pinfo55` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'CRM Password',
  `pinfo34` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'LinkedIn Username',
  `pinfo63` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'LinkedIn Password',
  `pinfo36` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Facebook Username',
  `pinfo64` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Facebook Password',
  `pinfo38` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Facebook Business Page',
  `pinfo65` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Google Contacts Email Address ( Gmail )',
  `pinfo66` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Google Contacts Password',
  `pinfo67` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Google Contacts Group Name',
  `pinfo68` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Office 365 Username',
  `pinfo69` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Office 365 Password',
  `pinfo70` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Office 365 Contact list Name',
  `pinfo60` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Called ID - 10 Digit Phone Number - Numbers Only',
  `pinfo46` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Template - Google Document or Spreadsheet ',
  `pinfo44` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Direct Mail Manager Username',
  `pinfo61` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Direct Mail Manager Campaign Number',
  `pinfo49` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Fax Away Username',
  `pinfo45` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Fax Away Password',
  `pinfo62` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Template - Google Document or Spreadsheet ',
  `pinfo71` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Direct Mail Manager Password',
  `pinfo72` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Your Phone Number - 10 Digit Phone Number - Numbers Only',
  `freetype0` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Upload Your Photo - Delivered With Your Default Text Message',
  `freetype1` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Upload Your Photo - Delivered With Your Early Morning Text M',
  `freetype2` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Upload Your Photo - Delivered With Your Daytime Text Message',
  `freetype3` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Upload Your Photo - Delivered With Your Evening Text Message',
  `freetype4` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Upload Your Photo - Delivered With Your Late Night Text Mess',
  `freetype5` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Magic Voicemail Recording .WAV File - 23 SECONDS MAXIMUM',
  `pinfo74` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Channel ',
  `mcq38` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'enRICH Scanner',
  `ref` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_id` (`data_id`),
  KEY `ref` (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wz_fsqm_direct_17`;
CREATE TABLE `wz_fsqm_direct_17` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `form_id` bigint(20) unsigned NOT NULL DEFAULT '17',
  `pinfo10` text COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'First Name',
  `pinfo11` text COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Last Name',
  `pinfo3` text COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Company Name',
  `pinfo12` text COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Email Address',
  `pinfo8` text COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Date To Begin Delivering Leads',
  `pinfo9` text COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Age Leads',
  `pinfo5` text COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Your Name',
  `pinfo6` text COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Your Company Name',
  `pinfo7` text COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Your Email Address',
  `mcq4` text COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Turn Lead Distribution On / Off',
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_id` (`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


DROP TABLE IF EXISTS `wz_fsq_category`;
CREATE TABLE `wz_fsq_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wz_fsq_data`;
CREATE TABLE `wz_fsq_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `f_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `l_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mcq` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `freetype` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinfo` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  `star` tinyint(1) NOT NULL DEFAULT '0',
  `score` int(10) NOT NULL DEFAULT '0',
  `max_score` int(10) NOT NULL DEFAULT '0',
  `url_track` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `referer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wz_fsq_files`;
CREATE TABLE `wz_fsq_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `data_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `element_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `media_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `thumb_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wz_fsq_form`;
CREATE TABLE `wz_fsq_form` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `settings` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `layout` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `design` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `mcq` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `freetype` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinfo` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `category` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wz_fsq_payment`;
CREATE TABLE `wz_fsq_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `txn` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `data_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(12,2) DEFAULT NULL,
  `mode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `meta` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_id` (`data_id`),
  UNIQUE KEY `txn` (`txn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wz_links`;
CREATE TABLE `wz_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wz_optimizepress_assets`;
CREATE TABLE `wz_optimizepress_assets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '',
  `settings` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wz_optimizepress_launchfunnels`;
CREATE TABLE `wz_optimizepress_launchfunnels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(254) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wz_optimizepress_launchfunnels_pages`;
CREATE TABLE `wz_optimizepress_launchfunnels_pages` (
  `funnel_id` bigint(20) unsigned NOT NULL,
  `page_id` bigint(20) unsigned NOT NULL,
  `step` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wz_optimizepress_layout_categories`;
CREATE TABLE `wz_optimizepress_layout_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wz_optimizepress_pb_products`;
CREATE TABLE `wz_optimizepress_pb_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wz_optimizepress_post_layouts`;
CREATE TABLE `wz_optimizepress_post_layouts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `layout` longtext NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'publish',
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wz_optimizepress_predefined_layouts`;
CREATE TABLE `wz_optimizepress_predefined_layouts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `category` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `preview_ext` varchar(4) NOT NULL DEFAULT '',
  `layouts` longtext NOT NULL,
  `settings` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wz_optimizepress_presets`;
CREATE TABLE `wz_optimizepress_presets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `layouts` longtext NOT NULL,
  `settings` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wz_options`;
CREATE TABLE `wz_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wz_postmeta`;
CREATE TABLE `wz_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wz_posts`;
CREATE TABLE `wz_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_name` (`post_name`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wz_ratingBans`;
CREATE TABLE `wz_ratingBans` (
  `identityList` varchar(50) NOT NULL,
  `idList` varchar(255) NOT NULL,
  KEY `identityList` (`identityList`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `wz_ratingItems`;
CREATE TABLE `wz_ratingItems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniqueName` varchar(50) NOT NULL,
  `totalVotes` int(10) unsigned NOT NULL DEFAULT '0',
  `totalPoints` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueName` (`uniqueName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `wz_ratingsave`;
CREATE TABLE `wz_ratingsave` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniqueName` varchar(50) NOT NULL,
  `Points` int(10) unsigned NOT NULL DEFAULT '0',
  `time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `wz_redirects`;
CREATE TABLE `wz_redirects` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `url_from` varchar(256) NOT NULL DEFAULT '',
  `url_to` varchar(256) NOT NULL DEFAULT '',
  `status` varchar(12) NOT NULL DEFAULT '301',
  `type` varchar(12) NOT NULL DEFAULT 'url',
  `count` mediumint(9) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wz_stt2_meta`;
CREATE TABLE `wz_stt2_meta` (
  `post_id` int(20) NOT NULL,
  `meta_value` varchar(255) NOT NULL,
  `meta_count` int(20) NOT NULL DEFAULT '1',
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`,`meta_value`),
  UNIQUE KEY `meta_value` (`meta_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wz_termmeta`;
CREATE TABLE `wz_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wz_terms`;
CREATE TABLE `wz_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wz_term_relationships`;
CREATE TABLE `wz_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wz_term_taxonomy`;
CREATE TABLE `wz_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wz_usermeta`;
CREATE TABLE `wz_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wz_users`;
CREATE TABLE `wz_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wz_wpdatacharts`;
CREATE TABLE `wz_wpdatacharts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wpdatatable_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `engine` enum('google','highcharts') NOT NULL,
  `type` varchar(255) NOT NULL,
  `json_render_data` text NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wz_wpdatatables`;
CREATE TABLE `wz_wpdatatables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `show_title` tinyint(1) NOT NULL DEFAULT '1',
  `table_type` varchar(55) NOT NULL,
  `content` text NOT NULL,
  `filtering` tinyint(1) NOT NULL DEFAULT '1',
  `filtering_form` tinyint(1) NOT NULL DEFAULT '0',
  `sorting` tinyint(1) NOT NULL DEFAULT '1',
  `tools` tinyint(1) NOT NULL DEFAULT '1',
  `server_side` tinyint(1) NOT NULL DEFAULT '0',
  `editable` tinyint(1) NOT NULL DEFAULT '0',
  `inline_editing` tinyint(1) NOT NULL DEFAULT '0',
  `popover_tools` tinyint(1) NOT NULL DEFAULT '0',
  `editor_roles` varchar(255) NOT NULL DEFAULT '',
  `mysql_table_name` varchar(255) NOT NULL DEFAULT '',
  `edit_only_own_rows` tinyint(1) NOT NULL DEFAULT '0',
  `userid_column_id` int(11) NOT NULL DEFAULT '0',
  `display_length` int(3) NOT NULL DEFAULT '10',
  `auto_refresh` int(3) NOT NULL DEFAULT '0',
  `fixed_columns` tinyint(1) NOT NULL DEFAULT '-1',
  `chart` enum('none','area','bar','column','line','pie') NOT NULL,
  `chart_title` varchar(255) NOT NULL,
  `fixed_layout` tinyint(1) NOT NULL DEFAULT '0',
  `responsive` tinyint(1) NOT NULL DEFAULT '0',
  `scrollable` tinyint(1) NOT NULL DEFAULT '0',
  `word_wrap` tinyint(1) NOT NULL DEFAULT '0',
  `hide_before_load` tinyint(1) NOT NULL DEFAULT '0',
  `var1` varchar(255) NOT NULL DEFAULT '',
  `var2` varchar(255) NOT NULL DEFAULT '',
  `var3` varchar(255) NOT NULL DEFAULT '',
  `tabletools_config` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wz_wpdatatables_columns`;
CREATE TABLE `wz_wpdatatables_columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_id` int(11) NOT NULL,
  `orig_header` varchar(255) NOT NULL,
  `display_header` varchar(255) NOT NULL,
  `filter_type` enum('null','text','number','number-range','date-range','datetime-range','time-range','select','checkbox') NOT NULL,
  `column_type` enum('autodetect','string','int','float','date','link','email','image','formula','datetime','time') NOT NULL,
  `input_type` enum('none','text','textarea','mce-editor','date','datetime','time','link','email','selectbox','multi-selectbox','attachment') NOT NULL DEFAULT 'text',
  `input_mandatory` tinyint(1) NOT NULL DEFAULT '0',
  `id_column` tinyint(1) NOT NULL DEFAULT '0',
  `group_column` tinyint(1) NOT NULL DEFAULT '0',
  `sort_column` tinyint(1) NOT NULL DEFAULT '0',
  `hide_on_phones` tinyint(1) NOT NULL DEFAULT '0',
  `hide_on_tablets` tinyint(1) NOT NULL DEFAULT '0',
  `use_in_chart` tinyint(1) NOT NULL DEFAULT '0',
  `chart_horiz_axis` tinyint(1) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `sum_column` tinyint(1) NOT NULL DEFAULT '0',
  `skip_thousands_separator` tinyint(1) NOT NULL DEFAULT '0',
  `width` varchar(4) NOT NULL DEFAULT '',
  `possible_values` text NOT NULL,
  `default_value` varchar(100) NOT NULL DEFAULT '',
  `css_class` varchar(255) NOT NULL DEFAULT '',
  `text_before` varchar(255) NOT NULL DEFAULT '',
  `text_after` varchar(255) NOT NULL DEFAULT '',
  `formatting_rules` text NOT NULL,
  `calc_formula` text NOT NULL,
  `color` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wz_wpdatatable_1`;
CREATE TABLE `wz_wpdatatable_1` (
  `status` varchar(2000) DEFAULT NULL,
  `wdt_ID` int(11) NOT NULL AUTO_INCREMENT,
  `leaddate` datetime DEFAULT NULL,
  `mailreceived` datetime DEFAULT NULL,
  `mailprocessed` datetime DEFAULT NULL,
  `date` date DEFAULT NULL,
  `firstname` varchar(25) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `phone10` varchar(11) DEFAULT NULL,
  `contactid` varchar(20) DEFAULT NULL,
  `contacttype` varchar(20) DEFAULT NULL,
  `source` varchar(10) DEFAULT NULL,
  `purchaseprice` int(11) DEFAULT NULL,
  `downpayment` int(11) DEFAULT NULL,
  `firsttimebuyer` varchar(25) DEFAULT NULL,
  `hasagent` varchar(25) DEFAULT NULL,
  `loanamount` int(11) DEFAULT NULL,
  `state` varchar(15) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `selfcreditscore` varchar(10) DEFAULT NULL,
  `annualincome` int(6) DEFAULT NULL,
  `monthlydebts` int(11) DEFAULT NULL,
  `selfemployed` varchar(5) DEFAULT NULL,
  `hasbankruptcy` varchar(5) DEFAULT NULL,
  `hascoborrower` varchar(5) DEFAULT NULL,
  `hasforeclosure` varchar(5) DEFAULT NULL,
  `loanpurpose` varchar(10) DEFAULT NULL,
  `propertyvalue` int(11) DEFAULT NULL,
  `closingtimeline` varchar(10) DEFAULT NULL,
  `propertytype` varchar(25) DEFAULT NULL,
  `propertyuse` varchar(25) DEFAULT NULL,
  `vaeligible` varchar(255) DEFAULT NULL,
  `userid` int(6) DEFAULT NULL,
  `currentbalance` int(10) DEFAULT NULL,
  `wantscashout` varchar(5) DEFAULT NULL,
  `maybeeligibleforharp` varchar(5) DEFAULT NULL,
  `hassecondmortgage` varchar(5) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `image` varchar(2000) DEFAULT NULL,
  `smstod` varchar(100) DEFAULT NULL,
  `smsdow` varchar(25) DEFAULT NULL,
  `smsimage` varchar(100) DEFAULT NULL,
  `pdf` varchar(100) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `magicvm` varchar(255) DEFAULT NULL,
  `tomcrm` varchar(10) DEFAULT NULL,
  UNIQUE KEY `wdt_ID` (`wdt_ID`),
  KEY `userid` (`userid`),
  KEY `mailreceived` (`mailreceived`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wz_wpdatatable_2`;
CREATE TABLE `wz_wpdatatable_2` (
  `wdt_ID` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `profilelinkurl` varchar(2000) DEFAULT NULL,
  `acceptlinkurl` varchar(2000) DEFAULT NULL,
  `businessblob` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `accepted` varchar(255) DEFAULT NULL,
  UNIQUE KEY `wdt_ID` (`wdt_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wz_wpdatatable_3`;
CREATE TABLE `wz_wpdatatable_3` (
  `wdt_ID` int(11) NOT NULL AUTO_INCREMENT,
  `st` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  UNIQUE KEY `wdt_ID` (`wdt_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wz_wpdatatable_4`;
CREATE TABLE `wz_wpdatatable_4` (
  `wdt_ID` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `usermobile` varchar(10) NOT NULL,
  `profilenamep1` varchar(255) DEFAULT NULL,
  `profiledescp1` varchar(255) DEFAULT NULL,
  `profilenamep2` varchar(255) DEFAULT NULL,
  `profiledescp2` varchar(255) DEFAULT NULL,
  `profilenamep3` varchar(255) DEFAULT NULL,
  `profiledescp3` varchar(255) DEFAULT NULL,
  `smsp1` varchar(5) DEFAULT NULL,
  `smsp2` varchar(5) DEFAULT NULL,
  `smsp3` varchar(5) DEFAULT NULL,
  `smsimagep1` varchar(255) DEFAULT NULL,
  `smsimagep2` varchar(255) DEFAULT NULL,
  `smsimagep3` varchar(255) DEFAULT NULL,
  `smsmessagep1` text,
  `smsmessagep2` text,
  `smsmessagep3` text,
  `mvmp1` varchar(5) DEFAULT NULL,
  `mvmp2` varchar(5) DEFAULT NULL,
  `mvmp3` varchar(5) DEFAULT NULL,
  `magicvoicemailcid1` varchar(255) DEFAULT NULL,
  `magicvoicemailcid2` varchar(255) DEFAULT NULL,
  `magicvoicemailcid3` varchar(255) DEFAULT NULL,
  `mvm1p1` varchar(255) DEFAULT NULL,
  `mvm1p3` varchar(255) DEFAULT NULL,
  `mvm1p2` varchar(255) DEFAULT NULL,
  `mvmdd1p1` int(10) DEFAULT NULL,
  `mvmdd1p2` int(10) DEFAULT NULL,
  `mvmdd1p3` int(10) DEFAULT NULL,
  `mvm2p1` varchar(255) DEFAULT NULL,
  `mvm2p2` varchar(255) DEFAULT NULL,
  `mvm2p3` varchar(255) DEFAULT NULL,
  `mvmdd2p1` int(10) DEFAULT NULL,
  `mvmdd2p2` int(10) DEFAULT NULL,
  `mvmdd2p3` int(10) DEFAULT NULL,
  `mvm3p1` varchar(255) DEFAULT NULL,
  `mvm3p2` varchar(255) DEFAULT NULL,
  `mvm3p3` varchar(255) DEFAULT NULL,
  `mvmdd3p1` int(10) DEFAULT NULL,
  `mvmdd3p2` int(10) DEFAULT NULL,
  `mvmdd3p3` int(10) DEFAULT NULL,
  `emaildrip` varchar(5) DEFAULT NULL,
  `crm` varchar(5) DEFAULT NULL,
  `googlecontacts` varchar(5) DEFAULT NULL,
  `linkedin` varchar(5) DEFAULT NULL,
  `linkedin_user` varchar(50) DEFAULT NULL,
  `linkedin_pass` varchar(50) DEFAULT NULL,
  UNIQUE KEY `wdt_ID` (`wdt_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wz_wpr_campaigns`;
CREATE TABLE `wz_wpr_campaigns` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `ctype` varchar(255) NOT NULL,
  `keywords` longtext NOT NULL,
  `categories` longtext NOT NULL,
  `templates` longtext NOT NULL,
  `cinterval` bigint(20) NOT NULL,
  `period` varchar(255) NOT NULL,
  `postspan` varchar(255) NOT NULL,
  `replacekws` longtext NOT NULL,
  `excludekws` longtext NOT NULL,
  `amazon_department` varchar(255) NOT NULL,
  `ebay_cat` varchar(255) NOT NULL,
  `yahoo_cat` varchar(255) NOT NULL,
  `translation` varchar(255) NOT NULL,
  `customfield` longtext NOT NULL,
  `posts_created` bigint(20) NOT NULL DEFAULT '0',
  `pause` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wz_wpr_errors`;
CREATE TABLE `wz_wpr_errors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `campaign` bigint(20) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wz_wpr_posts`;
CREATE TABLE `wz_wpr_posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `campaign` bigint(20) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  `unique_id` longtext NOT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wz_wpr_templates`;
CREATE TABLE `wz_wpr_templates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `typenum` int(4) NOT NULL DEFAULT '1',
  `content` longtext NOT NULL,
  `title` longtext NOT NULL,
  `comments_amazon` int(1) NOT NULL DEFAULT '0',
  `comments_flickr` int(1) NOT NULL DEFAULT '0',
  `comments_yahoo` int(1) NOT NULL DEFAULT '0',
  `comments_youtube` int(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- 2017-01-14 18:47:55
