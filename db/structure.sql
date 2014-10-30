CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "articles" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" text, "description" text, "created_at" datetime, "updated_at" datetime, "user_id" integer);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255) DEFAULT '' NOT NULL, "encrypted_password" varchar(255) DEFAULT '' NOT NULL, "reset_password_token" varchar(255), "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar(255), "last_sign_in_ip" varchar(255), "created_at" datetime, "updated_at" datetime, "name" varchar(255));
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE TABLE "identities" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "provider" varchar(255), "uid" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE INDEX "index_identities_on_user_id" ON "identities" ("user_id");
INSERT INTO schema_migrations (version) VALUES ('20141025125655');

INSERT INTO schema_migrations (version) VALUES ('20141025130000');

INSERT INTO schema_migrations (version) VALUES ('20141025213213');

INSERT INTO schema_migrations (version) VALUES ('20141029195405');

INSERT INTO schema_migrations (version) VALUES ('20141029195445');

