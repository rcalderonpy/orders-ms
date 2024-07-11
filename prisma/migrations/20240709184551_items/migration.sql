/*
  Warnings:

  - You are about to drop the column `orderId` on the `order_item` table. All the data in the column will be lost.
  - You are about to drop the column `productId` on the `order_item` table. All the data in the column will be lost.
  - Added the required column `product_id` to the `order_item` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "order_item" DROP CONSTRAINT "order_item_orderId_fkey";

-- AlterTable
ALTER TABLE "order_item" DROP COLUMN "orderId",
DROP COLUMN "productId",
ADD COLUMN     "order_id" TEXT,
ADD COLUMN     "product_id" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "order_item" ADD CONSTRAINT "order_item_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "order"("id") ON DELETE SET NULL ON UPDATE CASCADE;
