CREATE TABLE `guest` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `site` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `guest2site` (
  `id` int(11) NOT NULL auto_increment,
  `guest_id` int(11) default NULL,
  `site_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `guest_id` (`guest_id`),
  KEY `site_id` (`site_id`),
  CONSTRAINT `fk_guest2site_guest` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`id`),
  CONSTRAINT `fk_guest2site_site` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
