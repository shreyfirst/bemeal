-- CreateTable
CREATE TABLE "_User_followers" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_User_followers_AB_unique" ON "_User_followers"("A", "B");

-- CreateIndex
CREATE INDEX "_User_followers_B_index" ON "_User_followers"("B");

-- AddForeignKey
ALTER TABLE "_User_followers" ADD CONSTRAINT "_User_followers_A_fkey" FOREIGN KEY ("A") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_User_followers" ADD CONSTRAINT "_User_followers_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
