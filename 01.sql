CREATE TABLE "users" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL UNIQUE,
	"date_created" DATE NOT NULL DEFAULT NOW()
);

CREATE TABLE "categories" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL
);

CREATE TABLE "sizes" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(10) NOT NULL
);

CREATE TABLE "products" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL,
	"price" INTEGER NOT NULL,
	"categoryId" INTEGER NOT NULL REFERENCES "categories" ("id"),
	"sizeId" INTEGER NOT NULL REFERENCES "sizes" ("id")
);

CREATE TABLE "images" (
	"id" SERIAL PRIMARY KEY,
	"productId" INTEGER NOT NULL REFERENCES "products" ("id"),
	"imageUrl" TEXT NOT NULL
);

CREATE TABLE "orders" (
	"id" SERIAL PRIMARY KEY,
	"userId" SERIAL NOT NULL REFERENCES "users" ("id"),
	"status" TEXT NOT NULL DEFAULT 'created',
	"dateCreated" TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE "cart" (
	"id" SERIAL PRIMARY KEY,
	"orderId" INTEGER NOT NULL REFERENCES "orders" ("id"),
	"productId" INTEGER NOT NULL UNIQUE REFERENCES "products" ("id"),
	"qtd" INTEGER NOT NULL DEFAULT 0
);