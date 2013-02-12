CREATE TABLE "following_relationships" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "follower_id" integer, "followed_user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "photo_shouts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "image_file_name" varchar(255), "image_content_type" varchar(255), "image_file_size" integer, "image_updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "shouts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "content_id" integer, "content_type" varchar(255));
CREATE TABLE "text_shouts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "body" varchar(255));
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255), "encrypted_password" varchar(128), "salt" varchar(128), "confirmation_token" varchar(128), "remember_token" varchar(128), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_following_relationships_on_followed_user_id" ON "following_relationships" ("followed_user_id");
CREATE INDEX "index_following_relationships_on_follower_id" ON "following_relationships" ("follower_id");
CREATE INDEX "index_shouts_on_content_id_and_content_type" ON "shouts" ("content_id", "content_type");
CREATE INDEX "index_shouts_on_user_id" ON "shouts" ("user_id");
CREATE INDEX "index_users_on_email" ON "users" ("email");
CREATE INDEX "index_users_on_remember_token" ON "users" ("remember_token");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20130211154400');

INSERT INTO schema_migrations (version) VALUES ('20130211155401');

INSERT INTO schema_migrations (version) VALUES ('20130211164227');

INSERT INTO schema_migrations (version) VALUES ('20130211164419');

INSERT INTO schema_migrations (version) VALUES ('20130211164512');

INSERT INTO schema_migrations (version) VALUES ('20130211180703');

INSERT INTO schema_migrations (version) VALUES ('20130211190513');
