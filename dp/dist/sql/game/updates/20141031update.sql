ALTER TABLE `character_customs`
DROP COLUMN `battle_score_best_date`,
ADD COLUMN `battle_score_best_date`  int(10) NULL COMMENT '�퓬�X�R�A�x�X�g����' AFTER `battle_score_best`;
