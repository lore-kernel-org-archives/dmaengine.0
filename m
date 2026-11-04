Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827688;
	b=eCAMCkpWf/Q9h0CZNdPDfP6f8Ixo48cXQr6gFQnh+C7uZSzpotgXeBnTZm6qnhLbEkDX
	 mA2sJj4XukQziHkTuLDXwb7aoJVAuNN6eq8crPyjl+mo4awQ0lv/z1pQPYVG84PL5z5kq
	 uEdRLL7IrcuInwogsBK7eF4wtPCeii7hIIQKtipCsvt+vz7KJ72q4GW6HVks6HFvGPHby
	 jVHp+YszBgT0YFeaZQXouDsoVGZ4pp37FEe84k1SdIbWlQQleCwmw8CfTDf5zQ+Cvm6dG
	 dnV/mX8yiTuGVVLrv17mgbGR+eXj+hAeK8Cvc8jIrr2n6eg34P3lxxjRjT/dKUVa19A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827688;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=9fO88CzZ4KxwmnRZKO53UzsL+vV6yYBAF2v/XvLPKlI=;
	b=EXk16ENr/fp7Jd6jVLf7PwE3vnnnjjQkYsVWTKVM1s++IEYXh3Od8L8SFrRgm4J4qtcW
	 LCw1tJpFZfS5tRbSAUJ0y5twvwU1FW6y6gSakAjntZrfss8zlIWIDz2lt2aZ/x51bw1+w
	 8wpgSVZydtqy+L/fEqqoPdhhlcMBGUXwj+rCDD7KHIn4JTSHEso/F/U6aFp3eZeCbRB8o
	 tyQJGTKXpb8K9w+e8Ilvt8YuoiwRDVfu26eLLO450OCErBIGIL/d0ACjeiD2obI39x15O
	 sD7iRKXlNv9rcoVYN5BCLZs2zl23t0t5Ptq9EhIURTk+d16mdsRPL38A59dpT9mRhkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XQI4xlaX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90DD606B2E4
	for <dmaengine@vger.kernel.org>; Wed,  4 Nov 2026 21:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XQI4xlaX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E121F000C1;
	Wed,  4 Nov 2026 21:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793827687;
	bh=9fO88CzZ4KxwmnRZKO53UzsL+vV6yYBAF2v/XvLPKlI=;
	h=From:Date:Subject:To:Cc;
	b=XQI4xlaXILHLS+YVBWPv+SC5GHIsgp7U+bD9rpklNNEHYQgpjjw2Rp6IjQRkhWJMc
	 63kpjcCojCAuVbbNGMG+py81f+Bi65zyo0dTa+mQw4FEGLmD/xnmk2ZZikfSAvfdUz
	 mHGuxc0k55SPCZowkucWtyzpMdvTwt0tJuZzgma/pO5dG+dIKt/pMFX3IVwoE+1NG9
	 C8LUbMrCzEaON+++0UOaP4d7vKF3E8SS0HhuQXsYPAwga+0Az2VyYBYTOST8hqdxbp
	 qcPJxRR2KrTSZBjrMGlO9AQvPCD1D6Ibk0sWUBc+tT2a3n7P3iro1pdrkFgpHXSJ/O
	 y7MzmvT0LoUSw==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 04 Nov 2026 22:28:02 +0100
Subject: [PATCH] dmaengine: ste_dma40: Keep prepared descriptors across
 termination
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
Message-Id: <20261104-dma40-fixes-v1-1-48c5180f5210@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3JTQqAIBAG0KsM31pBQwq9SrSwZqpZ9INCBNHdg
 972PahSVCoSPShyadVjRyJvCNOa90WsMhKhcU3rvQuWtxycnfWWajny2LoYxo4jDOEs8gcS9cP
 7fnI5mrldAAAA
X-Change-ID: 20261104-dma40-fixes-d9db6094b7d9
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
 Ulf Hansson <ulfh@kernel.org>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

MMCI can prepare the next request while the current DMA transfer is
running. If the current request fails, its error handler terminates the
channel before the next descriptor has been submitted.

d40_term_all() frees that descriptor from prepare_queue, although MMCI
still holds its pointer. Submitting it later accesses freed memory in
d40_tx_submit(). A reported crash writes to 0x104 through a list pointer
containing LIST_POISON1, which is consistent with this sequence.

Termination only cancels transfers that have been submitted. Leave
prepared descriptors on prepare_queue so the client can still submit
them, and release any remaining prepared descriptors when the channel
resources are freed. Keep tracking them so abandoned descriptors are
reclaimed at channel teardown.

Fixes: 82babbb361f2 ("dmaengine/ste_dma40: fix memory leak due to prepared descriptors")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 74dd4cbdc3c0..f1cbc719c4f0 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1166,14 +1166,6 @@ static void d40_term_all(struct d40_chan *d40c)
 			d40_desc_free(d40c, d40d);
 		}
 
-	/* Release descriptors in prepare queue */
-	if (!list_empty(&d40c->prepare_queue))
-		list_for_each_entry_safe(d40d, _d,
-					 &d40c->prepare_queue, node) {
-			d40_desc_remove(d40d);
-			d40_desc_free(d40c, d40d);
-		}
-
 	d40c->pending_tx = 0;
 }
 
@@ -2222,7 +2214,8 @@ static int d40_config_memcpy(struct d40_chan *d40c)
 
 static int d40_free_dma(struct d40_chan *d40c)
 {
-
+	struct d40_desc *d40d;
+	struct d40_desc *_d;
 	int res = 0;
 	u32 event = D40_TYPE_TO_EVENT(d40c->dma_cfg.dev_type);
 	struct d40_phy_res *phy = d40c->phy_chan;
@@ -2252,6 +2245,12 @@ static int d40_free_dma(struct d40_chan *d40c)
 	/* Release descriptor state; this does not access DMA40 registers. */
 	d40_term_all(d40c);
 
+	/* Release any prepared descriptors the client did not submit. */
+	list_for_each_entry_safe(d40d, _d, &d40c->prepare_queue, node) {
+		d40_desc_remove(d40d);
+		d40_desc_free(d40c, d40d);
+	}
+
 	res = pm_runtime_resume_and_get(d40c->base->dev);
 	if (res >= 0) {
 		res = d40_channel_execute_command(d40c, D40_DMA_STOP);
@@ -2508,10 +2507,7 @@ d40_prep_sg(struct dma_chan *dchan, struct scatterlist *sg_src,
 		goto free_desc;
 	}
 
-	/*
-	 * add descriptor to the prepare queue in order to be able
-	 * to free them later in terminate_all
-	 */
+	/* Track prepared descriptors until submission or channel release. */
 	list_add_tail(&desc->node, &chan->prepare_queue);
 
 	spin_unlock_irqrestore(&chan->lock, flags);

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261104-dma40-fixes-d9db6094b7d9

Best regards,
--  
Linus Walleij <linusw@kernel.org>

