Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543351;
	b=iK0IDbxTjPf7BjqaX1CS8kJxzm3QkRTgEwx8Wr/JLDcIaRJU8dpCk6MvqHBqYA3bDg3C
	 UFonvP6ScOBYe+KlsdNdlVGWDJdEjMzqT2m/WtCjrrVK1rvTPIviWJJhsAoYdxvIAnfeU
	 U1LafEJd9M2Imnnieo74ZijmtEykcQ9DYba4E+PUh1h6w2vMK6G9kKdch4OzfLhMT17I/
	 tABVLvrXyXM1Oyqu8b14kssM7TS/ExJmNtL3Jf4FkUmMBcOr6tT7B9kcOMxjp/5rL7lVV
	 b9SX04Y/ZXBeSyzBjtDuqXsFV1cMjO3lO2JwhsLEmNb33UMFbSlomydi8BGpCZMMktg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543351;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 Subject:X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=xr9UhhuiLfhVh6EOT2WWbscPOugLH1gjgPbrDdUnXxs=;
	b=1NJFSmmJDjNKFMcAcpbIEPkhOahHcxKzgudXIvXu65VBj86yKWj8BqwTJHDoWvxexDR5
	 nXNgqtLSppnDUk1fBswLIZu9oDFbGQ4tJnT9lsWRyKA94bEasu4rntGiYlvXOnEToI7MV
	 Fjhm1Z0t4vC6+9BjD3IK7g8jF6sBWFnwLU5Z3jJOt2Pzp4+GTS5FGA952/w1Vag/dMi0u
	 3DM5UkocAqfzxP0vd+V0w/qKY0q6hTyjTBsXa8UqfqmJcDQfCF0TvsexxfWvBQ2oo2vHo
	 bsSTZVnWag7Nsl/OBUuHoIbqvRZH0ZZ+/NeJ0WcRvyHceCvrRteHy/KTJr46Bvl1SBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=VTCIzrKs;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D30606A69C;
	Tue, 24 Nov 2026 18:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05D30606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=VTCIzrKs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=xr9UhhuiLfhVh6EOT2WWbscPOugLH1gjgPbrDdUnXxs=; b=VTCIzrKsPowjRhHx81Ikjk070M
	Kcd0Hu1oedE2my9ZB2T4fmFSWvJk/X/KJqFQLtVElIJUKaYXH8Ytc6uZn749D4QoWSyu3ne7ZRGBu
	ZZ5U8nCZXYqEoytdjOaeFLhs9DtI0irubs4wmtBDOOhMCwvhxE2wVRqcr3vdibvn9TskEG0HvooUG
	+BsSBhjjUxrMW1Tn1JJVltus+LdHxKHsLaM8xgvhRfgD+VffwUrX6EeVSgnLQghmIOGcUthyYU2+/
	aRGi8RUqyFy9YxPn2IVdFPvlITpgO0GHgQAj4TelwzMIQ+aZSIlCvLUep1FHebwPSNhKVtgfn5L50
	NX2jGIHg==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xVuqb-00000000oLO-1hLy;
	Tue, 24 Nov 2026 12:02:30 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xVupk-00000003rv4-1hRI;
	Tue, 24 Nov 2026 12:01:36 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Date: Tue, 24 Nov 2026 12:01:30 -0600
Message-ID: <20261124180132.922222-5-logang@deltatee.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124180132.922222-1-logang@deltatee.com>
References: <20261124180132.922222-1-logang@deltatee.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, logang@deltatee.com, vkoul@kernel.org, sashiko-bot@kernel.org, Frank.li@nxp.com, Frank.Li@nxp.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: [PATCH v4 4/6] dmaengine: plx_dma: add dma_rmb() after observing write-back status
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

Completing a descriptor involves two loads that must be ordered:

1. Reading desc->hw->flags_and_size and checking that VALID is clear.
2. Reading the destination buffer, which may happen in:
   a. dma_unmap_page() via dmaengine_unmap(), when a bounce buffer
      is in use.
   b. The client's callback, or its processing after polling with
      tx_status().

On a weakly ordered CPU like arm64, nothing forces load 2 to happen
after load 1, even though load 2 is only reached when load 1 says the
transfer is done. The CPU can predict that the VALID check won't
break out of the loop and issue load 2 early. If the device hadn't
finished writing at that moment, load 2 returns stale data, and when
load 1 then confirms the prediction nothing is redone, so the stale
data is used. This is the load-load control dependency case described
in Documentation/memory-barriers.txt.

Add a dma_rmb() after the status check so loads after it can't be
satisfied before the status read.

Fixes: 4d3df16840a2 ("dmaengine: plx-dma: Implement descriptor submission")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/plx_dma.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index d3b814933989..7af29b901bd5 100644
--- a/drivers/dma/plx_dma.c
+++ b/drivers/dma/plx_dma.c
@@ -148,6 +148,13 @@ static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
 		if (flags & PLX_DESC_FLAG_VALID)
 			break;
 
+		/*
+		 * Don't allow any read of the data the device wrote to be
+		 * performed before the status read above shows the
+		 * descriptor is complete.
+		 */
+		dma_rmb();
+
 		res.residue = desc->orig_size - (flags & PLX_DESC_SIZE_MASK);
 
 		if (flags & PLX_DESC_WB_SUCCESS)
-- 
2.47.3

