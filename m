Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795395197;
	b=j1LUrNz9EAmDRkkZf6tcWJ8dgG7Bi5cQGoQhmJPU1sbQrnhSCYyXZK81JWlJWA3uG0wa
	 mtmVuZhio41tRWh/d8o+fUtDM9eLSVCTX3PHHwMB9ccZDatjZAJzCkwJOouC6vJEYv8CF
	 vbmnb8LXMl7k49V8JfNUc2IZ3BNF3fVLQkqr8zjVnhJ6FcdOeV7AThNTXRkWdPee5cxWH
	 4FBM7O6EqLDhT+q1K28Nvni/7W0PKUA/LzZtTQzLqfqyKbkT+oSxkZRJQf1mVfbwvBBoU
	 4pPbnkSgD4EGMM6DGqrFnBK9MF0LtgBdLSJQwUwkk3RSyELrToahZzXT24i1qUrbSDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795395197;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=hZGsiZPfJDMA7smlRJ4dLsRRcxTqNeN1zBeKd7rqlMk=;
	b=5NIdWSUH2BbEs1QCD+8MsJB4UiLOVj5l1VMVC4wIw8W6I/Hv9roiYXa5Ayr+VFp7kdaY
	 X3OJscutPFr0UjXCp0eR8wJXV+N5zTxaO83KgQCWFZ8mAATjNRGLZHE6NUES+LRlUmpuc
	 YMsgUYn2phbMAhacGXD/4AWTADn3YSNd0kgcd707XrWVDDxOUWDHaZzVawaq8DVGUZXER
	 2cUZylDs7GZ4f2EqTyjvK4RMO51fznFDTJFs4dFK16IFDnt6J27Mi5xZdxCjepayOYeCZ
	 rgTtnk6YHE5CnnboP1szEx1+jcHi8xL8d+NikQJ+b9udNqqGNEVE5A62NhxmWFKhGNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YAmYtRaF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20CD606A337;
	Mon, 23 Nov 2026 00:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YAmYtRaF
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795395197;
	b=I8Po4EbRcMa6mIQr4qfhnKRwy+QikTiz/yKVVNeEuDmO5cGxc5if3boZNBp2xU0Kt1pb
	 oAGi/fpmkJykFAMvquugCWqAxZwYuBvoZYBoPCpQ3KGIrsI/WxZIuXsRY0aI5tQgmTFnA
	 Bv8JmTfpLxF/It+i4RIxmdAVn/hI3C5Q8lfSOB/bxrxhjv2XzA6FQivGU3EDMXQFG6I26
	 Zkvx4PEVdeNa38XNbpzQeUoOD3YWKG3avU/x+dPA9WyshWEEcpbedediZJrBYEnW8mm+I
	 6QZYA0i47zba3nDMqB+6l+NhBJUFjkrFw7J44vs0aQI2HWka5g4i/n4yxao1D4t/wZw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795395197;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=hZGsiZPfJDMA7smlRJ4dLsRRcxTqNeN1zBeKd7rqlMk=;
	b=LOqS4QtYeP9CdfRYgjDFNR7NfEXM/CSNZ7lM5pzJT4btnd/WfogVtbVaGLPxTZLM5PAy
	 0lYWK5mVwFhqF3ayvfg3RBWRSGOmDQBf1Z5bGyjvePaW25Ga5F9deD8HdDteJ2Fe44ZLh
	 kaueSHvJugE4KKx8ttPI+G4k03KVDSkDtdU+o/vnUITh6j3kM5JaUI9OSa9FtKRhqex6F
	 K33MP8rrvBXbFvV1+5Ed46Z+NxYq9R0GLb4a0o0Mv7B2u4kFZyNl2/kCIkHNfpjwuI4om
	 d87rY4zQQyf8IxtFigu9teR3VHk3HFbunxCJER0b/mMYIljVxfqGMKtSm+fQTpamqCw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 703741F000CF;
	Mon, 23 Nov 2026 00:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795395197;
	bh=hZGsiZPfJDMA7smlRJ4dLsRRcxTqNeN1zBeKd7rqlMk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=YAmYtRaF8RTMsiV/SM/mOr+ocD9610C6TNWyWCG+/Uiij87mC7adagCwFektHLg8u
	 TKRv4CnMAQ402M7Ppk0ttAq4+TWPAn7I3FsUXXJr8LMMTGxKEpntjEBgV0Sj6N2KMK
	 gMFj4YtJNSmr3ECtZ8S3IgwUvCsshDz9wW6zWVXSQtsWXAbSrC9Io9astmQYPnvP61
	 PUB2o8Dwy9TV4BytVYHtol+I2ST07NdtaQ3Dy7aLKh+i/tCQRNg8uGf5EyPewJBRjj
	 3qEu8HH6RBmBhGJf4p4eq3MLkJqeRhTyYUlYMDdaNPgdw6e79pIMlCA3WBS/GuMb4K
	 2CX2c+xCvctHw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F21524C299;
	Mon, 23 Nov 2026 00:53:06 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 00:53:07 +0000
Subject: [PATCH 2/2] dmaengine: idma64: Kill the channel tasklets in remove
 again
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
Message-Id: <20261123-dma-chancnt-v1-2-f0eea0a4bb63@gmail.com>
References: <20261123-dma-chancnt-v1-0-f0eea0a4bb63@gmail.com>
In-Reply-To: <20261123-dma-chancnt-v1-0-f0eea0a4bb63@gmail.com>
To: vkoul@kernel.org, ludovic.desroches@microchip.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank.Li@kernel.org, allen.lkml@gmail.com, dave.jiang@intel.com, 
 dmaengine@vger.kernel.org, andriy.shevchenko@linux.intel.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795395185; l=1951;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=GQuussW5tcaY3AFLXhEILE+dApPEjArrisGtHmyiqFk=;
 b=ji9WRcuHGobYS9nt8jrwgQQ3y9toNeTxMkJ70wG2ign/Yyl02TFW/2ibsbLp6r13W6629PLua
 fsVOoXzy6TrDFRy9TrznW54l/IaQlKsFPoPFz+2vE2QOmQMhZSihUx0
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


