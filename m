Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795396659;
	b=M1TACLr8DPs4Nu24NnwYHtu7XqXsg4jzTbnQngm09adEUAolZgWu+2No/HYzjlCa1LrU
	 CEZlE/aax4taurtE/xLLEuRTdTrf5wi6Kv58SndoVa0y6eIVg4H/ch9EwGQja6SSxC0te
	 x7U2CuRkDljZLjF1NWM+lFZiVIVtLRsiyhGZ3UE/MtVmm4Vog9eLMyTkWgL4FxpT4avbh
	 t3/+Z2s1VqbSW2dCpcOBxviRKf9evyf8OSoZtVMrIWro8e8UUWhHWWIhmqA+S1NIkdxpz
	 Dfh5DPg1IxBAW0gkkUZP0U2ju3Xf9+r4C9IZWNPuaQV3R6PSVCzKBweu0g6DKqMzd+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396659;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=hZGsiZPfJDMA7smlRJ4dLsRRcxTqNeN1zBeKd7rqlMk=;
	b=aP+uBH0J6jj5DGMrgwpGy3GaVFfsu9bfA2Z8FYVp5BSZ4mS+b40fGJ+Tf3x1RE1P53LE
	 0vA+R6Pg6Lw0Rdhb6Xygo4Z+K18MEGS9O5ch99OGyMAyUKprLvgW5VvZ72pirJYj2p7s9
	 16h5Xo/ouwt9u41BY6eAJ5BBZCsnyArWMZmWQUaQzzrYkq4oazQspm7rL8DeoZkFCM6wZ
	 ZSEGLrwEapIks1786euP0KypdQQwAn928QP4cR/NlXwlu+MqXLdt2N+Qi/uy5thUCYqK7
	 8ohRnt3NWP9kK0zFjYWVpXXC78gJjFDJU0uYelW8StQaEmZX8L/tuINwbFRORYt7qAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="LE/HPTqk";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EB6606A33D;
	Mon, 23 Nov 2026 01:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LE/HPTqk
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795396659;
	b=Y6v6WIiMCRz32KNBQtCjXevYxRfj7rbakmdEbJoILY+Pt2TOrGeRi4uvELjD/dnjIWuC
	 AjAdQbiH9GWpJgbnj8PYbsnJqcd0jJnwrEq5rCy1I0fzI0prn2IepXtio8SWynj0p7Q6M
	 JbudgLDpbUK5VXWTVoRY28T0Tj7WHYYYoTtkP1Y+3V3MIdUzSoWCH8EYaGq4Y/41M3jdo
	 5wc/J9RStS9vYPZNYOPAKTS4CAmLoUmMooErB64NML0ofcDPabnUy+tsXYG6hxX6BUNxI
	 K96bNsQN5l7MIubzpKE96MbUE8aNBhYHR0g27ly32iFc1/PqWL3VTC4tZvdmXxOrQYQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795396659;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=hZGsiZPfJDMA7smlRJ4dLsRRcxTqNeN1zBeKd7rqlMk=;
	b=BUasE2tE+cLKCNOYYVrn5sIXbY6Wz8U/96AHvoxmN/w58KiQ3wc2G8vL1XQHlMzec28j
	 Y1014R8ehmRtz3PatukYGDaEJde2h/Eyw4GlQIJ6If0vgx+wSRc1R33y+VU0q6Wdv91kU
	 ecqLtDyeO7w9vhczUYjo2jdo+dTyDn2YQEXVGOXyTNix0rN/bboNx3ibDxw92QZt82t53
	 5QceDBe5EsuZ9CyW7OZD9EtYRj4rM+eMivrhz3zxuGFsi53+gVgwXIhu1Cg9om/aYZGdb
	 5QevyEGiYAEWjRCRX7cPiSvsl+LP+lE47LrUvEJ1BUGNsFzu2Jdp+eZ0ozjvPk/FeAg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A33511F000CA;
	Mon, 23 Nov 2026 01:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795396659;
	bh=hZGsiZPfJDMA7smlRJ4dLsRRcxTqNeN1zBeKd7rqlMk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=LE/HPTqkbCWcFLd2TIZ/4hRb5V8w2zUlfkYktBOOmlombOkssioZgrYJBjfCgpmkA
	 d71rB70SLoeosiBZLnvclHdUeqal814aRUiDM4R3FF4qSI9MF8JL9qQF1vzxeKwekr
	 cs5066b/L3HOlimQeVPr9Ozwr83hxKO+sZbJTKXY1fA4/bSDrSw1kvkd8GikovwQ5z
	 6GZDC0nH5zS0V08qi8a5ctRqmUZ1fKzEFcoTHSyfDiwUWXs4R+IlIqJkZJaQrp6dLx
	 fFAfk/mcdq8yh1ghJ/DvkPgh1t3xORVEnk/6fmARJYv3SOQKwLE1RJ7b5eGn6dExss
	 yriltAW++0plg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2F8A34C2AE;
	Mon, 23 Nov 2026 01:17:38 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 01:17:38 +0000
Subject: [PATCH v2 2/2] dmaengine: idma64: Kill the channel tasklets in
 remove again
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-dma-chancnt-v2-2-241b1672883e@gmail.com>
References: <20261123-dma-chancnt-v2-0-241b1672883e@gmail.com>
In-Reply-To: <20261123-dma-chancnt-v2-0-241b1672883e@gmail.com>
To: ludovic.desroches@microchip.com, vkoul@kernel.org
Cc: Frank.Li@kernel.org, dave.jiang@intel.com, linux-kernel@vger.kernel.org, 
 andriy.shevchenko@linux.intel.com, dmaengine@vger.kernel.org, 
 allen.lkml@gmail.com, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795396657; l=1951;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=GQuussW5tcaY3AFLXhEILE+dApPEjArrisGtHmyiqFk=;
 b=U6oKz//o2HHTu2pfkrIuRf215zDz+FwzL6agyeIwhgoacFdrGmq8WvjiYE2pBb7wqHZgWFMlu
 cOUB3HacL3gBk1AxAC9+NCuo9BW3JGxQneaPrbIr3/bl9qs93RBdPUl
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

idma64_remove() frees the IRQ and then kills the channel tasklets, as
the comment there says, so that no tasklet scheduled by the interrupt
runs after removal:

	for (i = 0; i < idma64->dma.chancnt; i++) {
		...
		tasklet_kill(&idma64c->vchan.task);
	}

Since commit e81274cd6b52 ("dmaengine: add support to dynamic
register/unregister of channels"), dma_async_device_unregister()
unregisters each channel and decrements dma.chancnt for it, so the
count is 0 when this loop runs and no tasklet is killed. A tasklet
scheduled by an interrupt can then run after the devm-allocated idma64
and its channels have been freed.

Read the channel count before unregistering the device.

Found with a static analysis tool and checked by hand.

Fixes: e81274cd6b52 ("dmaengine: add support to dynamic register/unregister of channels")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
 drivers/dma/idma64.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/idma64.c b/drivers/dma/idma64.c
index e3db213e564b..5d0df1defb14 100644
--- a/drivers/dma/idma64.c
+++ b/drivers/dma/idma64.c
@@ -604,6 +604,8 @@ static int idma64_probe(struct idma64_chip *chip)
 static void idma64_remove(struct idma64_chip *chip)
 {
 	struct idma64 *idma64 = chip->idma64;
+	/* dma_async_device_unregister() decrements dma.chancnt to 0 */
+	unsigned short nr_chan = idma64->dma.chancnt;
 	unsigned short i;
 
 	dma_async_device_unregister(&idma64->dma);
@@ -614,7 +616,7 @@ static void idma64_remove(struct idma64_chip *chip)
 	 */
 	devm_free_irq(chip->dev, chip->irq, idma64);
 
-	for (i = 0; i < idma64->dma.chancnt; i++) {
+	for (i = 0; i < nr_chan; i++) {
 		struct idma64_chan *idma64c = &idma64->chan[i];
 
 		tasklet_kill(&idma64c->vchan.task);

-- 
2.34.1


