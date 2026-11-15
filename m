Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757942;
	b=pXDnvnGji3tb7SNhJFJHYoZGVOkPS3nrkye/8Vg/TmxRGHi8YQpsSCp3h6gfDSkcoEuZ
	 e7v4MUopwimV0kp/HHBWJdfr+Poxsf5EMWn+hzeq2fouUyH7hI+HYSWBzVakmNfIhp9Yv
	 UEwDALUYqhD72T/D80zpNc7AhY+oRL9cn4Iv53UJOhKXNdyc4J352dmDyP5kaCxW5r25b
	 VaSwjRZmQHmlk3uHmUfF4SfauNTWRwz5H01P/uZ9zywxPVY8KYlXRIFKvW2Jm/2GjRwrG
	 JrfulG5MWz4Uh7ROdiOIq5aFDZu9yvrzbLeryJJaAmx14yZ2t3S0qQwZZRntouqkSiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757942;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=nTjFplutDyO+6B0L2q9B2Wxl1+E3m6fypJVZ+ZBVxqg=;
	b=rgvdoDBsyl5xlE5QhtzHqHFynjxU9kzgNSRqxyg+gj95RyWxsqmLdmbnfz51QuSb4Y+9
	 rnNqbkpmseGroYLThBO9UVmaKa6FosJ4ng1oFN6DCwYzHl6PWYXSu1IEFPIi6sH91mBpv
	 uNhE8lxMAIHsJzzLsYUjFgul6v3USJVFWOYGzGgXNJrGCZCbUESH4heZCkGYHClXHT5tF
	 DHyUMQ/ggUBRfFwN9QXGl6DnGP3nwe34YeqNgF9r8KA9nq/v/r0wsleLeO6RT8ZIAa9jI
	 Y3TJm0YGBpoE0eGDkXCYtABd9+49G0Wrg93ZDWiQz9ZVZpmfUGLqyw40Eoyypiz/KEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=XLobJJu1;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=9+eZUvgX;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8995606A31D;
	Sun, 15 Nov 2026 15:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8995606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=XLobJJu1;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=9+eZUvgX
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1794757923; bh=nTjFplutDyO+6B0L2q9B2Wx
	l1+E3m6fypJVZ+ZBVxqg=; b=XLobJJu1Sp0iKBB7AarH1kkFYcI1a6OH0Amjv9u201lAnHV2WM
	CTQaZgS3NKcEmR7kMKPiUAlqQDuX9yCNw1XPVH7Td/u43vTcP6tp2tYMGkhrwU0qbROvG1Hcw+z
	Qzb3O2EXuA8H0AK86nEmRy0Mm/YkZWJ2GCT14kcM8CifLIhvFH7oU+Tyuo3u9JWwia6Mnk7xQyH
	k5WsBIIYDtPaOYrLLZ5AmeXwJsFBy9dmE6Gs+TCbmmMo+KEi7oFOYc2OfoaamfSFRIWDowUAifP
	hR7j2N/yCYmzNxG/VOmtM0lI3nbQ0cOZ1GAgTQmcKc5fCxwbI9CJ4VTJN3DMICFGsmA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1794757923; bh=nTjFplutDyO+6B0L2q9B2Wx
	l1+E3m6fypJVZ+ZBVxqg=; b=9+eZUvgXS2Z37ak7RCy4qYe9lWlZepFQVRoZaXRWf43aSV4yB5
	EaBusvXqUnguui8dgRrFznCiuA/201lZE0CA==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Sun, 15 Nov 2026 18:52:02 +0300
Subject: [PATCH] dmaengine: qcom: bam_dma: Report the residue of packet
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
Message-Id: <20261115-qcom-bam-dma-metadata-v1-1-52e4de54ffd3@mainlining.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB1IohbsVYqLMRnbEaJtEkUQ7
 260y7f4f4fIQTjCs9gh8CpR5ilDlwXYD01vRnHZYJR5aK0b/NnZY08enSf0nMhRIhyqmpvWuFo
 pC7n9Bh5ku7+v7u+49CPbdM3gOE4BtdETeQAAAA==
X-Change-ID: 20261115-qcom-bam-dma-metadata-f34e592d400c
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794757923; l=3031;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=nbWHp5UD+m3jmg5mPKY+XUaOPKi5dA/h7fGX+FvVAs4=;
 b=ZzYKVsRiGlh2aARMVM8cC00ltMblUL2jpMeqqMjz+EBGi/ruTX7+ajkO7OXF6T89XIoRdh3s7
 twSRhVNxsuLBePdb1s/gUTj4ieREVFkNo2MsdHbEezQ/DxOt9xpNC9a
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
 drivers/dma/qcom/bam_dma.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index e62e411dc8f8..b5cfe3ce3406 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -65,6 +65,7 @@ struct bam_async_desc {
 
 	u32 num_desc;
 	u32 xfer_len;
+	size_t transferred;
 
 	/* transaction flags, EOT|EOB|NWD */
 	u16 flags;
@@ -447,6 +448,30 @@ static inline void __iomem *bam_addr(struct bam_device *bdev, u32 pipe,
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
@@ -732,6 +757,8 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 		} while (remainder > 0);
 	}
 
+	async_desc->vd.tx.metadata_ops = &metadata_ops;
+
 	return vchan_tx_prep(&bchan->vc, &async_desc->vd, flags);
 }
 
@@ -881,6 +908,11 @@ static u32 process_channel_irqs(struct bam_device *bdev)
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
