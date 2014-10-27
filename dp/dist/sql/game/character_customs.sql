DROP TABLE IF EXISTS `character_customs`;
CREATE TABLE `character_customs` (
  `charId`                 int(10)    unsigned NOT NULL default '0' COMMENT '�L�����N�^ID',
  `battle_score`           bigint(20) unsigned          default '0' COMMENT '�퓬�X�R�A',
  `battle_score_best`      text                                     COMMENT '�퓬�X�R�A�x�X�g',
  `battle_score_best_date` varchar(19)                              COMMENT '�퓬�X�R�A�x�X�g����(YYYY/MM/DD hh:nn:ss)',
  `battle_log`             mediumtext                               COMMENT '�퓬�L�^
(kill,charId,battle_score,date;death,charId,battle_score,date...)',
  `tvt_score`              bigint(20) unsigned           default '0' COMMENT 'TvT�X�R�A',
  `tvt_score_log`          mediumtext                               COMMENT 'TvT�X�R�A�L�^(battle_score,date;battle_score,date...)',
  `	trading_point`          bigint(20) unsigned          default '0' COMMENT '�����p�|�C���g',
  PRIMARY KEY  (`charId`),
  KEY `idx_chrId_battle_score` (`charId`,`battle_score`) USING BTREE,
  KEY `idx_chrId_tvt_score`    (`charId`,`tvt_score`) USING BTREE
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '�L�����N�^�̃J�X�^���e�[�u��character�e�[�u���ƂP�F�P�̃e�[�u��';