Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735201;
	b=fj5yzbDRJtTUlSrFCwWV4dWmz3ekyH1xqlzHP3AKWHEYAHbgv41etDL8F/Adh+NcjdTR
	 7iycjAM6ufOS4BQsRsssRoJ8vGaA/F3cLXMnVqh1HwHMeWiu0ykOWQHBnTbEmc0fgayvq
	 oJ/rFuVRh7hbf67wD9DzFYF1bNw/C+W7d848C+a6NohNIvrz3L4XGZrCEmF5Nhq5E779G
	 +EUpykSJtc5oUlineku8+l1dNJPLxRgnd8UafVqVAWGkCV6CdHA0z0385cm4QSLLyhf49
	 FsKxP0ScL4Z+Cw7yh4eTwADRmLB9GLPBN7RCaJRE5LcDKebvh/MdjEfu+CH6GL1Zhrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=bPluMEVsq1fcd/2/kENoSJW0juxe38/N67JwApwlVx8=;
	b=NxW7fxpayKmTf0BJKCnjx9nzIdJNbmQo7KtIIAqXhz0UqccmYRqLwtJxjjXCxTpHu8wz
	 ppurl7A62HkqteepqR1/1GzHqnXU8jfPDvxCaWJPaHlPUORu91KTvow07EJuUJlPFOGL1
	 zJDVl4VRjRO2c6yNwfpaE9/+7C3JPHUkuWPdXMzxHyF2plMOfve2slolqldeDyybXBG7M
	 Ldz2NY9QH+rIal5soeg7vAfizpCvnEdEyBzsuQx0GpWc8s9mIopMVIIjJ4f8vbkzVLVbd
	 4IHaadD5YvYYXXUY++X+ttJIsIPxV1X0MXnmgWGXpD0mHlSqKkrlt4/aL+Zn2gcZYzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SCsOlmBq;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF5D606A8A4
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 09:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FF5D606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SCsOlmBq
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6ddef424972so3070228eaf.3
        for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 01:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735199; x=1795339999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bPluMEVsq1fcd/2/kENoSJW0juxe38/N67JwApwlVx8=;
        b=SCsOlmBqgEDJ6BmeoTUMFusmIni3X/V3Yt2R2U0E+/irtRlSJl1YACWDg77DdUKsGL
         IyruwbNdhGjrvQDDHY4F/XDdKtvmN1BifV4F4V41h773/9tUkghJRu5XeLdr2UKzSCw5
         mOs8kcatb2MTwBMoulEBiEVdl787QFkkCeW84Kr+JbW3Kw7DdeowYVhHElQQu3z+tVH4
         m5WgTuewHGZs9Ysr+zQ3Xec1nOnFOKc9G7HRqlb9bWdoA0MXTttfRuhFkqFJ4CGN5oDd
         MMj5SjR0WbZYhM4lNrRJdNivCOiswaYpbSXNhuzf38Rnq0bd3zulE0JnxAEm/8/zWoZr
         ykpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735199; x=1795339999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bPluMEVsq1fcd/2/kENoSJW0juxe38/N67JwApwlVx8=;
        b=v7MJ2ZgS+bJmSAY0BzI5Jv5ZxO6aWUH6bfQWWS25f+IhGk/qW2P7RBMO+vIuqznRuK
         ZHvqZHHEu6EcLogmphCkzoF7McmlTf5u3g6330+8SAkK5zWSRVxW0hveN09mA3ekB/Nu
         KKW46uXO3mI+GSeFcWxIM+NcRDf5tTeSiovSkYlysRtzeNFDhnIlahxugJ3IVahn6Kxm
         A/hOZwQwGMufPzmjMLMAdeHHLKJV2jDomHSU4eSWsd83RmuoRq7HqN2KljSdUMZHNsS1
         ud3YYWejISN146CdpExb6jz47Vx5+xQ6l7o53abTBJBeJh544wDcpsuEl4AB5G1lB3ja
         eW6Q==
X-Forwarded-Encrypted: i=1; AL+hErGKatmdh9+Y3nd3zpVYwMtGxzmevC5BnvLdeu3BJvuz2oSe6QLAoSzgImHJNPkggT92ikizy9DPCcU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fs29IIjmh818isuXirnjxzsEZkCeJK7sh/kRSXv1YpoLHd60y
	84ZvMBErPL2LTipOtcoRtpSp2UH6LAOFHOXCqaeKH6CtvI/VHsD4p2Y/
X-Gm-Gg: AYBFou0PL3KJkqtdPTSXkGHXn6Lrwziw0kQAivx6LkAyzf0UUjvd0Q0G9UZOGG5n4TT
	IHNr9e27AQ6KFBNcyt5SVt1dKcKD0wV/B6gqZLci3Eff97c6UHDBdWRix8hjrtpftoWqO8RFMLZ
	VSuWSnHSZP/qut5GHGTNlE/Ve1Z4UVe982Dc3xMalTWQQLiW44yvr2v8G+fcS/u4Q+2/HpPdSKf
	lfKr1ydqhyoyv/0VwSwyZOglXY6Ijg3d4F60/MTYbQGDtxT94ZJD0+073s/K5QGZrhgBQmW2+JP
	4uUnAUoc2+TDnrnu+gSJCicdtf0YoffdqwehIPQPfa61w1AKGGpGryPFzAKeJFm26nOsdWMJZJD
	gaT4s5Y6wycq8+K0QPcZMPgV/Sgek7GmP0wR4x2lxzSt4j/9oEPusChon8mxr8UALDNoik+exDV
	JHvzSKPW5mIMXYUM8BcFrNxBGYUUdc+ZHQlWEG9CbzVdMF8UM7aohk2Cof0EpY61ivPl0nzxTzD
	S8Df8r3PSpCfKja08ZKQJxi4c3dg3tTbaRcYuUXHEMU4WXMNR83XmlQSmjMxf8+iXN7j3abxioi
	6xRDlOsT/z/5bgZsCKf4/qpSg+HVEWBAq1Klp4xxmM2SBHSl72Co8BkvcwDL0jUa9R9XLxpYmfG
	1GyMkZ9w6rJJE6+bn64h+6f2U39Ov+DCqwFU6tHzUjw8QF/SdD6VTTYZ9Yy3WGBi7bD9aRK/Gqf
	ARHDRjrBwiQ98KeutSoyA7n5I2P9VB7L5ROpZxD3YqybCzRdl/s3g=
X-Received: by 2002:a05:6820:1627:b0:71a:ee76:d7c3 with SMTP id 006d021491bc7-71aee76dd86mr223150eaf.7.1794735199376;
        Sun, 15 Nov 2026 01:33:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:53 -0700
Subject: [PATCH v4 5/9] dmaengine: sun6i: detach completed descriptors
 before invoking callbacks
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
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-5-043cd476a45f@gmail.com>
References: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
In-Reply-To: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

Finite completion publishes a descriptor to virt-dma but leaves pchan->desc
pointing to it until the allocator runs. The virtual-channel tasklet may
free that descriptor first. A residue query for another incomplete cookie
can still pass the retired descriptor to sun6i_get_chan_size().

Clear the active descriptor pointer before publishing completion. An
assigned physical channel without a descriptor is ready for the allocator
to start its next transfer or release it. Use that state in place of the
completed-descriptor pointer, so residue queries and termination only
consult descriptors still owned by the physical channel.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 5d39a2c0c2e1..c30e244e50ea 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -198,7 +198,6 @@ struct sun6i_pchan {
 	void __iomem		*base;
 	struct sun6i_vchan	*vchan;
 	struct sun6i_desc	*desc;
-	struct sun6i_desc	*done;
 };
 
 struct sun6i_vchan {
@@ -492,16 +491,12 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 	if (!pchan)
 		return -EAGAIN;
 
-	if (!desc) {
-		pchan->desc = NULL;
-		pchan->done = NULL;
+	if (!desc)
 		return -EAGAIN;
-	}
 
 	list_del(&desc->node);
 
 	pchan->desc = to_sun6i_desc(&desc->tx);
-	pchan->done = NULL;
 
 	sun6i_dma_dump_lli(vchan, pchan->desc->v_lli, pchan->desc->p_lli);
 
@@ -538,7 +533,7 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 
 		pchan = vchan->phy;
 
-		if (pchan && pchan->done) {
+		if (pchan && !pchan->desc) {
 			if (sun6i_dma_start_desc(vchan)) {
 				/*
 				 * No current txd associated with this channel
@@ -584,6 +579,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
+	struct sun6i_desc *desc;
 	unsigned long flags;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
@@ -603,13 +599,15 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 		     i * channels_per_reg + j < sdev->num_pchans; j++) {
 			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
-			if (vchan && (status & vchan->irq_type)) {
+			desc = pchan->desc;
+			if (vchan && desc && (status & vchan->irq_type)) {
 				spin_lock(&vchan->vc.lock);
 				if (vchan->cyclic) {
-					vchan_cyclic_callback(&pchan->desc->vd);
+					vchan_cyclic_callback(&desc->vd);
 				} else {
-					vchan_cookie_complete(&pchan->desc->vd);
-					pchan->done = pchan->desc;
+					/* Completion transfers ownership to virt-dma. */
+					pchan->desc = NULL;
+					vchan_cookie_complete(&desc->vd);
 				}
 				spin_unlock(&vchan->vc.lock);
 			}
@@ -985,7 +983,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	pchan = vchan->phy;
 	list_del_init(&vchan->node);
 
-	if (pchan && pchan->desc && pchan->desc != pchan->done) {
+	if (pchan && pchan->desc) {
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
 		vchan_terminate_vdesc(vd);
@@ -1001,7 +999,6 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		vchan->phy = NULL;
 		pchan->vchan = NULL;
 		pchan->desc = NULL;
-		pchan->done = NULL;
 	}
 
 	spin_unlock(&vchan->vc.lock);

-- 
2.53.0

