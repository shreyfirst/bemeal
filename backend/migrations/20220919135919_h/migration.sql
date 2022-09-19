-- CreateTable
CREATE TABLE "_User_incoming_friend_request" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Post_likes" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_User_incoming_friend_request_AB_unique" ON "_User_incoming_friend_request"("A", "B");

-- CreateIndex
CREATE INDEX "_User_incoming_friend_request_B_index" ON "_User_incoming_friend_request"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Post_likes_AB_unique" ON "_Post_likes"("A", "B");

-- CreateIndex
CREATE INDEX "_Post_likes_B_index" ON "_Post_likes"("B");

-- AddForeignKey
ALTER TABLE "_User_incoming_friend_request" ADD CONSTRAINT "_User_incoming_friend_request_A_fkey" FOREIGN KEY ("A") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_User_incoming_friend_request" ADD CONSTRAINT "_User_incoming_friend_request_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Post_likes" ADD CONSTRAINT "_Post_likes_A_fkey" FOREIGN KEY ("A") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Post_likes" ADD CONSTRAINT "_Post_likes_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
