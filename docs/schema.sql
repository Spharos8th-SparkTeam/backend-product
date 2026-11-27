CREATE TABLE `product` (
	`id`	BIGINT	NOT NULL,
	`product_uuid`	CHAR(36)	NOT NULL,
	`title`	VARCHAR(100)	NOT NULL,
	`description`	TEXT	NOT NULL,
	`price`	DECIMAL(12,2)	NOT NULL,
	`delivery_fee_included`	TINYINT	NOT NULL	DEFAULT 0.00,
	`deleted_at`	DATETIME(6)	NULL
);

CREATE TABLE `product_list` (
	`id`	BIGINT	NOT NULL,
	`seller_uuid`	CHAR(36)	NOT NULL	COMMENT 'one or many',
	`category_uuid`	CHAR(36)	NOT NULL	COMMENT 'one or many',
	`product_uuid`	CHAR(36)	NOT NULL	COMMENT 'one',
	`status`	VARCHAR(20)	NOT NULL
);

CREATE TABLE `product_count` (
	`id`	BIGINT	NOT NULL,
	`product_uuid`	CHAR(36)	NOT NULL	COMMENT 'one',
	`wish_count`	BIGINT	NOT NULL	DEFAULT 0,
	`view_count`	BIGINT	NOT NULL	DEFAULT 0
);

CREATE TABLE `product_media` (
	`id`	BIGINT	NOT NULL,
	`product_uuid`	CHAR(36)	NOT NULL	COMMENT 'one or many',
	`thumbnailed`	TINYINT	NOT NULL	COMMENT '+) 대표 썸네일 여부',
	`sort_order`	INT	NOT NULL	COMMENT '+) 게시 순서',
	`file_type`	VARCHAR(20)	NOT NULL	COMMENT 'ex) IMAGE, VIDEO',
	`file_name`	VARCHAR(255)	NOT NULL	COMMENT 'ex) /aaa',
	`file_size`	BIGINT	NOT NULL,
	`deleted_at`	DATETIME(6)	NULL
);

CREATE TABLE `product_wish` (
	`id`	BIGINT	NOT NULL,
	`member_uuid`	CHAR(36)	NOT NULL	COMMENT 'one or many',
	`product_uuid`	CHAR(36)	NOT NULL	COMMENT 'one or many'
);

CREATE TABLE `product_category` (
	`id`	BIGINT	NOT NULL,
	`my_id`	BIGINT	NULL	COMMENT 'ex) 물품 종류 id',
	`category_uuid`	CHAR(36)	NOT NULL,
	`depth`	INT	NOT NULL	COMMENT 'ex) 1차, 2차',
	`name`	VARCHAR(80)	NOT NULL,
	`deleted_at`	DATETIME(6)	NULL
);

CREATE TABLE `product_ai_recognitions` (
	`id`	BIGINT	NOT NULL,
	`keyword`	VARCHAR(255)	NOT NULL	COMMENT '+) AI가 분석한 키워드'
);

CREATE TABLE `product_sold_price` (
	`id`	BIGINT	NOT NULL,
	`product_uuid`	CHAR(36)	NOT NULL	COMMENT 'one',
	`title`	VARCHAR(100)	NOT NULL,
	`price`	DECIMAL(12,2)	NOT NULL,
	`sold_at`	DATETIME(6)	NOT NULL
);

CREATE TABLE `product_card` (
	`product_uuid`	CHAR(36)	NOT NULL,
	`wish_count`	BIGINT	NOT NULL	DEFAULT 0,
	`thumbnail_file_name`	VARCHAR(255)	NULL,
	`first _category_uuid`	CHAR(36)	NOT NULL,
	`first _category_name`	VARCHAR(80)	NOT NULL,
	`second _category_uuid`	CHAR(36)	NOT NULL,
	`second _category_name`	VARCHAR(80)	NOT NULL,
	`title`	VARCHAR(100)	NOT NULL,
	`price`	DECIMAL(12,2)	NOT NULL,
	`status`	VARCHAR(20)	NOT NULL,
	`deleted_at`	DATETIME(6)	NULL	DEFAULT 0
);

ALTER TABLE `product` ADD CONSTRAINT `PK_PRODUCT` PRIMARY KEY (
	`id`
);
ALTER TABLE `product_list` ADD CONSTRAINT `PK_PRODUCT_LIST` PRIMARY KEY (
	`id`
);
ALTER TABLE `product_count` ADD CONSTRAINT `PK_PRODUCT_COUNT` PRIMARY KEY (
	`id`
);
ALTER TABLE `product_media` ADD CONSTRAINT `PK_PRODUCT_MEDIA` PRIMARY KEY (
	`id`
);
ALTER TABLE `product_wish` ADD CONSTRAINT `PK_PRODUCT_WISH` PRIMARY KEY (
	`id`
);
ALTER TABLE `product_category` ADD CONSTRAINT `PK_CATEGORY` PRIMARY KEY (
	`id`
);
ALTER TABLE `product_ai_recognitions` ADD CONSTRAINT `PK_PRODUCT_AI_RECOGNITIONS` PRIMARY KEY (
	`id`
);
ALTER TABLE `product_sold_price` ADD CONSTRAINT `PK_PRODUCT_SOLD_PRICE` PRIMARY KEY (
	`trade_uuid`
);
ALTER TABLE `product_card` ADD CONSTRAINT `PK_PRODUCT_CARD` PRIMARY KEY (
	`product_uuid`
);
