INSERT INTO `items` (name, label) VALUES
  ('sciroppo','Sciroppo per la tosse'),
  ('antibiotico','Antibiotico'),
  ('antibioticorosacea','Antibiotico per la rosacea')
;

ALTER TABLE `users` ADD `malato` varchar(255) COLLATE utf8mb4_bin DEFAULT 'no';
