DROP TABLE IF EXISTS `character_customs`;
CREATE TABLE `character_customs` (
  `charId`                 int(10)    unsigned NOT NULL default '0' COMMENT 'キャラクタID',
  `battle_score`           bigint(20) unsigned          default '0' COMMENT '戦闘スコア',
  `battle_score_best`      int(10)    unsigned          default '0' COMMENT '戦闘スコアベスト',
  `battle_score_best_date` bigint(20) unsigned          default '0' COMMENT '戦闘スコアベスト時刻',
  `battle_log`             mediumtext                               COMMENT '戦闘記録(kill,charId,battle_score,date;death,charId,battle_score,date...)',
  `tvt_score`              bigint(20) unsigned          default '0' COMMENT 'TvTスコア',
  `tvt_score_log`          mediumtext                               COMMENT 'TvTスコア記録(battle_score,date;battle_score,date...)',
  `pvp_death_date`         bigint(20) unsigned          default '0' COMMENT 'PvP死亡時刻',
  `pvp_zombie`             tinyint(1) unsigned          default '0' COMMENT 'ゾンビ',
  `trading_point`          bigint(20) unsigned          default '0' COMMENT '交換用ポイント',
  PRIMARY KEY  (`charId`),
  KEY `idx_chrId_battle_score` (`charId`,`battle_score`) USING BTREE,
  KEY `idx_chrId_tvt_score`    (`charId`,`tvt_score`) USING BTREE
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT 'キャラクタのカスタムテーブルcharacterテーブルと１：１のテーブル';