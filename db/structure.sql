CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(9) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

CREATE TABLE `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `ship_to_first_name` varchar(255) DEFAULT NULL,
  `ship_to_last_name` varchar(255) DEFAULT NULL,
  `ship_to_address` varchar(255) DEFAULT NULL,
  `ship_to_city` varchar(255) DEFAULT NULL,
  `ship_to_postal_code` varchar(255) DEFAULT NULL,
  `ship_to_country_code` varchar(255) DEFAULT NULL,
  `customer_ip` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `error_message` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `description` text,
  `origin` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `cover_image_file_name` varchar(255) DEFAULT NULL,
  `cover_image_content_type` varchar(255) DEFAULT NULL,
  `cover_image_file_size` int(11) DEFAULT NULL,
  `cover_image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_brands` (`brand_id`),
  CONSTRAINT `fk_products_brands` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

CREATE TABLE `products_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_suppliers_suppliers` (`supplier_id`),
  KEY `fk_products_suppliers_products` (`product_id`),
  CONSTRAINT `fk_products_suppliers_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_products_suppliers_suppliers` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `phone` varchar(9) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `taggable_id` int(11) DEFAULT NULL,
  `taggable_type` varchar(255) DEFAULT NULL,
  `tagger_id` int(11) DEFAULT NULL,
  `tagger_type` varchar(255) DEFAULT NULL,
  `context` varchar(128) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taggings_idx` (`tag_id`,`taggable_id`,`taggable_type`,`context`,`tagger_id`,`tagger_type`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `taggings_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tags_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `crypted_password` varchar(255) NOT NULL,
  `password_salt` varchar(255) NOT NULL,
  `persistence_token` varchar(255) NOT NULL,
  `perishable_token` varchar(255) NOT NULL,
  `login_count` int(11) NOT NULL DEFAULT '0',
  `failed_login_count` int(11) NOT NULL DEFAULT '0',
  `last_request_at` datetime DEFAULT NULL,
  `current_login_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `current_login_ip` varchar(255) DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `pw_reset_code` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO schema_migrations (version) VALUES ('20140331181214');

INSERT INTO schema_migrations (version) VALUES ('20140407170846');

INSERT INTO schema_migrations (version) VALUES ('20140407204502');

INSERT INTO schema_migrations (version) VALUES ('20140407222602');

INSERT INTO schema_migrations (version) VALUES ('20140423164702');

INSERT INTO schema_migrations (version) VALUES ('20140423164712');

INSERT INTO schema_migrations (version) VALUES ('20140501115347');

INSERT INTO schema_migrations (version) VALUES ('20140501115627');

INSERT INTO schema_migrations (version) VALUES ('20140504131258');

INSERT INTO schema_migrations (version) VALUES ('20140504154657');

INSERT INTO schema_migrations (version) VALUES ('20140605185047');

INSERT INTO schema_migrations (version) VALUES ('20140605185048');

INSERT INTO schema_migrations (version) VALUES ('20140605185049');