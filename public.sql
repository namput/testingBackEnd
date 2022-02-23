/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : PostgreSQL
 Source Server Version : 140002
 Source Host           : localhost:5432
 Source Catalog        : postgres
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140002
 File Encoding         : 65001

 Date: 24/02/2022 01:34:09
*/


-- ----------------------------
-- Sequence structure for tbtest_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbtest_id_seq";
CREATE SEQUENCE "public"."tbtest_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1
CYCLE ;
ALTER SEQUENCE "public"."tbtest_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Table structure for tbtest
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbtest";
CREATE TABLE "public"."tbtest" (
  "id" int4 NOT NULL GENERATED ALWAYS AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1
CYCLE
),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "desc" varchar(255) COLLATE "pg_catalog"."default",
  "price" numeric(10,2),
  "post_code" varchar(5) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."tbtest" OWNER TO "postgres";

-- ----------------------------
-- Records of tbtest
-- ----------------------------
BEGIN;
INSERT INTO "public"."tbtest" ("id", "name", "desc", "price", "post_code") OVERRIDING SYSTEM VALUE VALUES (1, 'a', 'b', 150.00, '63170');
INSERT INTO "public"."tbtest" ("id", "name", "desc", "price", "post_code") OVERRIDING SYSTEM VALUE VALUES (2, 'ab', 'bb', 878.00, '10310');
INSERT INTO "public"."tbtest" ("id", "name", "desc", "price", "post_code") OVERRIDING SYSTEM VALUE VALUES (3, 'ab3', 'bb', 878.00, '10310');
INSERT INTO "public"."tbtest" ("id", "name", "desc", "price", "post_code") OVERRIDING SYSTEM VALUE VALUES (4, 'aek', 'chai', 1500.00, '63170');
INSERT INTO "public"."tbtest" ("id", "name", "desc", "price", "post_code") OVERRIDING SYSTEM VALUE VALUES (5, 'aek', 'chai', 1500.00, '63170');
INSERT INTO "public"."tbtest" ("id", "name", "desc", "price", "post_code") OVERRIDING SYSTEM VALUE VALUES (6, 'aek', 'chai', 1500.00, '63170');
INSERT INTO "public"."tbtest" ("id", "name", "desc", "price", "post_code") OVERRIDING SYSTEM VALUE VALUES (7, 'aekkachai', '3edfdff', 4778.00, '46537');
COMMIT;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbtest_id_seq"
OWNED BY "public"."tbtest"."id";
SELECT setval('"public"."tbtest_id_seq"', 7, true);

-- ----------------------------
-- Auto increment value for tbtest
-- ----------------------------
SELECT setval('"public"."tbtest_id_seq"', 7, true);

-- ----------------------------
-- Indexes structure for table tbtest
-- ----------------------------
CREATE INDEX "tbtest_id_idx" ON "public"."tbtest" USING btree (
  "id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tbtest
-- ----------------------------
ALTER TABLE "public"."tbtest" ADD CONSTRAINT "tbtest_pkey" PRIMARY KEY ("id");
