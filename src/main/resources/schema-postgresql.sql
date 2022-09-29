CREATE TABLE "users"
(
    "user_id"      INTEGER      NOT NULL,
    "name"         VARCHAR(255) NOT NULL,
    "surname"      VARCHAR(255) NOT NULL,
    "phone"        VARCHAR(255) NOT NULL,
    "address"      VARCHAR(255) NOT NULL,
    "pin-code"     INTEGER      NOT NULL,
    "email"        VARCHAR(255) NOT NULL,
    "gender"       VARCHAR(255) NOT NULL,
    "resources_id" INTEGER      NOT NULL,
    "passport_id"  INTEGER      NOT NULL,
    "role_id"      INTEGER      NOT NULL
);
ALTER TABLE
    "users"
    ADD PRIMARY KEY ("user_id");
CREATE TABLE "resource"
(
    "resource_id" INTEGER  NOT NULL,
    "name_id"     INTEGER  NOT NULL,
    "during_in_hour" INTEGER  NOT NULL,
    "user_id"     INTEGER  NOT NULL,
    "details_id"  INTEGER  NOT NULL,
    "status"      VARCHAR(255) CHECK
        ("status" IN ('LOCKED', 'REALISED')) NOT NULL
);
ALTER TABLE
    "resource"
    ADD PRIMARY KEY ("resource_id");
CREATE TABLE "resource_details"
(
    "details_id"  INTEGER      NOT NULL,
    "start_time"  DATE NOT NULL,
    "end_time"    DATE NOT NULL,
    "information" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "resource_details"
    ADD PRIMARY KEY ("details_id");

CREATE TABLE "notifications"
(
    "notification_id" VARCHAR(255) NOT NULL,
    "text"            VARCHAR(255) NOT NULL,
    "manager_id"      INTEGER      NOT NULL,
    "phone"           INTEGER      NOT NULL
);
ALTER TABLE
    "notifications"
    ADD PRIMARY KEY ("notification_id");
CREATE TABLE "user_passport_data"
(
    "passport_id" INTEGER      NOT NULL,
    "number"      INTEGER      NOT NULL,
    "series"      INTEGER      NOT NULL,
    "epire_date"  VARCHAR(255) NOT NULL,
    "nationality" VARCHAR(255) NOT NULL,
    "birth_date"  VARCHAR(255) NOT NULL,
    "photo"       VARCHAR(255) NOT NULL
);
ALTER TABLE
    "user_passport_data"
    ADD PRIMARY KEY ("passport_id");
CREATE TABLE "managers"
(
    "manager_id"   INTEGER      NOT NULL,
    "name"         VARCHAR(255) NOT NULL,
    "surname"      VARCHAR(255) NOT NULL,
    "role_id"      INTEGER      NOT NULL,
    "resources_id" INTEGER      NOT NULL,
    "users_id"     INTEGER      NOT NULL,
    "email"        VARCHAR(255) NOT NULL
);
ALTER TABLE
    "managers"
    ADD PRIMARY KEY ("manager_id");
CREATE TABLE "roles"
(
    "role_id" INTEGER      NOT NULL,
    "name"    VARCHAR(255) NOT NULL
);
ALTER TABLE
    "roles"
    ADD PRIMARY KEY ("role_id");
CREATE TABLE "housekeeper"
(
    "housekeeper_id" INTEGER      NOT NULL,
    "role_id"        INTEGER      NOT NULL,
    "name"           VARCHAR(255) NOT NULL,
    "surname"        VARCHAR(255) NOT NULL,
    "email"          VARCHAR(255) NOT NULL
);
ALTER TABLE
    "housekeeper"
    ADD PRIMARY KEY ("housekeeper_id");
CREATE TABLE "type_resources"
(
    "type_id" INTEGER      NOT NULL,
    "type_resources" VARCHAR(255) NOT NULL,
    "cost"        MONEY   NOT NULL
);
ALTER TABLE
    "type_resources"
    ADD PRIMARY KEY ("type_id");

ALTER TABLE
    "users"
    ADD CONSTRAINT "users_resources_id_foreign" FOREIGN KEY ("resources_id") REFERENCES "resource" ("resource_id");
ALTER TABLE
    "users"
    ADD CONSTRAINT "users_passport_id_foreign" FOREIGN KEY ("passport_id") REFERENCES "user_passport_data" ("passport_id");
ALTER TABLE
    "users"
    ADD CONSTRAINT "users_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "roles" ("role_id");
ALTER TABLE
    "resource"
    ADD CONSTRAINT "resource_name_id_foreign" FOREIGN KEY ("name_id") REFERENCES "type_resources" ("type_id");
ALTER TABLE
    "resource"
    ADD CONSTRAINT "resource_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");
ALTER TABLE
    "resource"
    ADD CONSTRAINT "resource_details_id_foreign" FOREIGN KEY ("details_id") REFERENCES "resource_details" ("details_id");
ALTER TABLE
    "managers"
    ADD CONSTRAINT "managers_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "roles" ("role_id");
ALTER TABLE
    "managers"
    ADD CONSTRAINT "managers_resources_id_foreign" FOREIGN KEY ("resources_id") REFERENCES "resource" ("resource_id");
ALTER TABLE
    "managers"
    ADD CONSTRAINT "managers_users_id_foreign" FOREIGN KEY ("users_id") REFERENCES "users" ("user_id");
ALTER TABLE
    "notifications"
    ADD CONSTRAINT "notifications_manager_id_foreign" FOREIGN KEY ("manager_id") REFERENCES "managers" ("manager_id");
ALTER TABLE
    "housekeeper"
    ADD CONSTRAINT "housekeeper_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "roles" ("role_id");