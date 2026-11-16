Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836971;
	b=pOL4+1EQfkPEF5EMvygaijWm2MQWmM+q3HrtQYXuThqTTcYhWN+kPsaREQljpwTtzcuI
	 /zcVZArFeENFhRorCzGbl3bYf1yQ5qahvlFkt5h0NA7xy75bljrI2dURu0qbnkhvE0eiw
	 yi/Lc4CJdJ8z0GPS+o+cn6aHrxlOvYrSdZS8pD3WayKCgCqJeGDA3ZDnyp95a9AoKI3XX
	 Kbl5ojevGy6v2NBlzKkfUcR0Tz0ukTYsUlv5V0SX+aavPspZuT1u5kWuhW9OHod1pkk31
	 z9wD/6SbtGs4JczpGn8ccs5hWyuw23wfP7kWO5u8I47kxVUIMw1xXILju09/zHzq8dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836971;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=N7er0gX4piFfmvrmrGLKRYFW/1gWo3ob403YNYAfY48=;
	b=V9NsX8ZBjRZgZ0CJhFrlCLAgJbfiljTkl9jX+d1cXF9Af1P7kYYxkxR6KdgEiprOeMf3
	 cjxbFRle1syidBCaqWhEjVXNEi61acoFJf/7Ho5a/yNHWyGR9H2mQU452QSfA1n6c6iGI
	 RLc1ximdVv7Ndq1jR9P0spAO+OeKyf/9FreZRDDs5IDyFbZlHU0OCxH1ss6paFbcWfC8F
	 0e6H/pM0todICCwMEdjmij7lR1wy73lGmpj+/aDpJt6OAxw1MKE0FWL+QYrhzhz56YfLi
	 JIElcz3TjPt94r7vRXwhlJDHJWdEMOjF18KXZKBk2jElei1WPrkn7lW34PT1t+ax+mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=PdBrcbc0;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=RZXawSln;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7138606A8B2;
	Mon, 16 Nov 2026 13:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7138606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=PdBrcbc0;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=RZXawSln
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1794836957; bh=N7er0gX4piFfmvrmrGLKRYF
	W/1gWo3ob403YNYAfY48=; b=PdBrcbc0vnLfNEXtnsP5gT4Uix96OtoJcbuKuAzyU1MgXk7hsS
	DAjwiDMHekITcEc/NfzEbhOWx4z8kCtgkSThF7ok+DwVLq196utGqhboO/KFobCGZbE0lpJdIvE
	V4fSCsEvHHAeaQs5uOnkAi/eVOZ0oRNODgx8GSZobpQQjZvC7hpVgA3hcAvs9stJpFpPfg9BFSx
	ZqWR4IcEMDM/tleJRx5mIUgoUVjpxi70rvFEQ4bR7WYlUSadKBCUXbkBkzYKNqEnO6M40eT8+ay
	rRLJZQgUAAHUAFSDAEGgyzvnsQlO/OQ9LH41DFbiwgdVIIIiK7Ofiym6F4RMN8/r3QQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1794836957; bh=N7er0gX4piFfmvrmrGLKRYF
	W/1gWo3ob403YNYAfY48=; b=RZXawSlnkSYxR/z0YiABps7ndtiwtGL7MxTGZuniP/Z9j/ck5q
	jAf8Xh561YNGFNbJTWpo/Wr4pGkqpcOUjbCA==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Mon, 16 Nov 2026 16:49:17 +0300
Subject: [PATCH v2] dmaengine: qcom: bam_dma: Report the residue of packet
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
Message-Id: <20261116-qcom-bam-dma-metadata-v2-1-aade3a42fcb4@mainlining.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ7CIBBFr9KwdkyhYKIr72G6oDC0YwQqYKNpe
 nfbegCXL3n//ZllTISZXaqZJZwoUwwriEPFzKBDj0B2ZSZqceKcK3ia6KHTHqzX4LFoq4sG10h
 UZ2FlXRu2bseEjt5799b+OL+6O5qyxTZjoFxi+uzHE9+8fx8TBw5KoLSopHO2uXpN4UGBQn+Mq
 WftsixfQEqALdEAAAA=
X-Change-ID: 20261115-qcom-bam-dma-metadata-f34e592d400c
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794836957; l=3543;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=3sJw3JNBkeWiVW8Njmn3cFUEUosMvVctAQ1DQZ/qen4=;
 b=3ne0Y+20jXElzOfP4JJqm/XqMSD0Gt9bxKEEdIAognjY5/s++sSntP3/uW/X+gPSoeSZDqUXE
 96iUheEw2lMB1rjlAQn89aV8ltuQk9OP/2RFOaLBRhkb4crbBk4/J6Q
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

The BAM writes back the number of bytes actually received into the
descriptor that ended an RX transfer. Report this through the standard
dmaengine_result (residue = length - transferred) so clients get the
packet length from callback_result().

Assisted-by: LLM
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
IPA v2.x uses BAM to send and receive IP packets, to and from the AP.
However, unlike its predecessor BAM-DMUX, it doesn't send information
about the packet length, but ipa2 driver will need that. To find the 
length of the packet, one must instead read the difference between 
packet length and residue.
---
Changes in v2:
- Fixed residues of old patch (sashiko)
- changed readl_relaxed to readl for offset reading in proccess_channel_irqs (sashiko)
- Link to v1: https://patch.msgid.link/20261115-qcom-bam-dma-metadata-v1-1-52e4de54ffd3@mainlining.org

To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/dma/qcom/bam_dma.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index e62e411dc8f8..bf0c25d7c111 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -65,6 +65,7 @@ struct bam_async_desc {
 
 	u32 num_desc;
 	u32 xfer_len;
+	size_t transferred;
 
 	/* transaction flags, EOT|EOB|NWD */
 	u16 flags;
@@ -447,6 +448,31 @@ static inline void __iomem *bam_addr(struct bam_device *bdev, u32 pipe,
 		r.ee_mult * bdev->ee;
 }
 
+/**
+ * bam_fifo_xfer_len - bytes transferred for a completed descriptor chunk
+ * @bchan: BAM channel the chunk was queued on
+ * @async_desc: BAM async descriptor owning the chunk
+ *
+ * For RX pipes the BAM overwrites the size field of the descriptor that
+ * ended the transfer with the number of bytes actually written to memory,
+ * which can be less than the buffer size (e.g. an IPA packet).  Those
+ * values live in the FIFO copy, not in async_desc->desc[].
+ */
+
+static u32 bam_fifo_xfer_len(struct bam_chan *bchan,
+			     const struct bam_async_desc *async_desc)
+{
+	struct bam_desc_hw *fifo = PTR_ALIGN(bchan->fifo_virt,
+					     sizeof(struct bam_desc_hw));
+	u32 len = 0;
+	unsigned int i;
+
+	for (i = bchan->head; i < bchan->head + async_desc->xfer_len; i++)
+		len += le16_to_cpu(fifo[i % MAX_DESCRIPTORS].size);
+
+	return len;
+}
+
 /**
  * bam_reset() - reset and initialize BAM registers
  * @bdev: bam device
@@ -865,7 +891,7 @@ static u32 process_channel_irqs(struct bam_device *bdev)
 
 		guard(spinlock_irqsave)(&bchan->vc.lock);
 
-		offset = readl_relaxed(bam_addr(bdev, i, BAM_P_SW_OFSTS)) &
+		offset = readl(bam_addr(bdev, i, BAM_P_SW_OFSTS)) &
 				       P_SW_OFSTS_MASK;
 		offset /= sizeof(struct bam_desc_hw);
 
@@ -881,6 +907,11 @@ static u32 process_channel_irqs(struct bam_device *bdev)
 			if (avail < async_desc->xfer_len)
 				break;
 
+			async_desc->transferred +=
+				bam_fifo_xfer_len(bchan, async_desc);
+			async_desc->vd.tx_result.residue =
+				async_desc->length - async_desc->transferred;
+
 			/* manage FIFO */
 			bchan->head += async_desc->xfer_len;
 			bchan->head %= MAX_DESCRIPTORS;

---
base-commit: 2cc223d6ffadd48e25eff0c8a03108a5d7a61c41
change-id: 20261115-qcom-bam-dma-metadata-f34e592d400c

Best regards,
--  
Nickolay Goppen <setotau@mainlining.org>
