ALTER TABLE `character_customs`
DROP COLUMN `battle_score_best`,
ADD COLUMN `battle_score_best`  int(10) NULL DEFAULT NULL COMMENT '�퓬�X�R�A�x�X�g' AFTER `battle_score`,
ADD COLUMN `pvp_death_date`  int(10) NULL COMMENT 'PvP���S����' AFTER `tvt_score_log`,
ADD COLUMN `pvp_zombie`  tinyint(1) NULL COMMENT '�]���r' AFTER `pvp_death_date`;

