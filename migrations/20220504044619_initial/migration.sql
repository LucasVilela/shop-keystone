-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL DEFAULT E'',
    "email" TEXT NOT NULL DEFAULT E'',
    "password" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Product" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL DEFAULT E'',
    "description" TEXT NOT NULL DEFAULT E'',
    "image_filesize" INTEGER,
    "image_extension" TEXT,
    "image_width" INTEGER,
    "image_height" INTEGER,
    "image_mode" TEXT,
    "image_id" TEXT,
    "quantity" INTEGER DEFAULT 0,
    "size" TEXT,
    "isAvailable" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_Product_creator" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "_Product_creator_AB_unique" ON "_Product_creator"("A", "B");

-- CreateIndex
CREATE INDEX "_Product_creator_B_index" ON "_Product_creator"("B");

-- AddForeignKey
ALTER TABLE "_Product_creator" ADD FOREIGN KEY ("A") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Product_creator" ADD FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
