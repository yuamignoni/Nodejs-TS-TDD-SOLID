-- CreateTable
CREATE TABLE "equipamento" (
    "id" TEXT NOT NULL,
    "patrimonio" TEXT NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "rented" BOOLEAN NOT NULL DEFAULT false,
    "renter_user_id" TEXT NOT NULL,

    CONSTRAINT "equipamento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "admin" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "rents" TEXT,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "equipamento_patrimonio_key" ON "equipamento"("patrimonio");

-- AddForeignKey
ALTER TABLE "equipamento" ADD CONSTRAINT "equipamento_renter_user_id_fkey" FOREIGN KEY ("renter_user_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
