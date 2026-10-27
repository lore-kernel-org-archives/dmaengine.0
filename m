Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793126620;
	b=sThwyEUGN6xCpUGZElbGaxThK8h61M4XLbqd53o/bD5KvGclHE0fb3SNql8tvBzfPVeI
	 QHZqzW1Fd+Y6FBHPQUS3ac2gdxrmZbZGE0YP+gix24XxKxDdIVprCl36wWx1nYM5QKBWZ
	 zV4jdY13dFSxZ7LXa/DFSB+G47HXoqii3oy+cMpwa1cN4AB6QIX+85So2oQmp6s1g9z5h
	 DIzRseJr4lnjTz8RTlwRHNpyIe9NkNGeu0pnRpJegM3OJ2d0/SN4aDDHE0dvxqChTjOSX
	 ckujGCIGKp95cPsbJ/zujDuXzQSlvnPoFK3MylEvkXhTuw2sbhcuJk9XfMKRjSIOM1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ETa6PEiQPvx4Sm9llFa3xDCORaPT2KrvUrXEonwMbCs=;
	b=4AIeLNSzyWywbzuMn3YSpaHI9lXx3XlM3iyYfPpNGKdLp1vmdGYJOz9jfdpDikWCaH1c
	 w/d17NUiEYxgOHCZ9Tfgxr/SzooJxxQwDpH+msx0zq/PsQpNIQ7VHonrOBQBrT5A/2KJF
	 fs4YiLUqGIAnvnpUci1vgR55qSeeEjHzc5pLEjgtiHv0Nr/B+lAvXeo6yUkqS6pIK3dAT
	 JulfnJHUMy+h6LnNpJSg0YgqfsdbY4IRgDcR5UY/esi+VfVFo8ewUgMyH4vX4/yHmt3bu
	 OFKQ5IEJf1E2V/4iTIDlbrmP3GhTQ6E1e1bfts8z+ts/YTDb9LAbpT+dTCJzZjs75Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oD4jcY1c;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11001606A330
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 18:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11001606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oD4jcY1c
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-84e513874f8so114020a34.2
        for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 11:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793126619; x=1793731419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ETa6PEiQPvx4Sm9llFa3xDCORaPT2KrvUrXEonwMbCs=;
        b=oD4jcY1ckBrn+CHRQVBS4t7Gqd7I3QR1HDTTSxzsfsCSxcWeyJQThuiiRWuYZ4Fge4
         6hldgR44OA9FSOV+KLpiLU3F2F3r7GcerlTxGQaozu+0P3YB2/AmtvR8xJEd+SRU0er1
         NJ/F0wbZrHse2TmHLy3S6Su/JuOGAC6+zvDSOw2aemAmXLMvc3Qe3MjzfgTS3e292ybr
         nG8k9a2OtoVVGLohrW1vZWMs8k5ud+6L9TuhyQtsfPZtcEBPgAlPONovF3UV2vk9dkLY
         Eph1ZHn3cV2DKozFt5a76nNT6OiqerhHlwyPTU35ZgNydHsTDEnNHtAiHwDG/5d1acGP
         cD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126619; x=1793731419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETa6PEiQPvx4Sm9llFa3xDCORaPT2KrvUrXEonwMbCs=;
        b=U66TervoNg2n58jui4mG6NX7dsA8FxUzrvapbDT6+Nl6EUfyzXzfQMYgk/cMG7VxFz
         8dliVtWyYEJR4SIdsQHCOnm80hSOETBrVBjwteX/hNRgBQSPQldJoErbj1c4a9+5ztX7
         Uev660zuBMxqEa4+FjVH0suJ6UB17V2el0wYSf+m2oH0MxE7x1l8jOZmwf6Ng90auv9j
         SVItHtCgS7WYCeMZwD/yQC4wqqIHxPC8KK41uLGBldeN48oAsFzX/J3f2J9JZe6M7Olg
         7QDxKqy6RLL/JbK8YLusA+UwTFczBAEF4NRRLmu4M7/D2nqiOuQ0TdzTQQi70/LG83SU
         O1kg==
X-Gm-Message-State: AFq9FYLleun93hRb/QItdS8XSBVnpJmFuhME1odfzKJiTuhrUb9qOOUJ
	sEc8jn5ZT7kkuFrQ+E/kJT6lHMMCUo3RyFnnDUs/YqzzT7jeKw0vuGd2
X-Gm-Gg: AYBFou0IsQbKC5CNjWVmgN5hwVOE7iC4sZ8iys7vlcKsJtvJRjx21pSeVy2n42LgP8I
	HRZxoQ463RFhcZCYOXC3uCKNWxEyIPF3NL8n+InqijZdl1Sr1wLfu/gQTYmWLNzCdGsXPhzzqHr
	hntPeUXoXBQSdhuS4tvELHypYyXrF4N/m/fKmDxSW5Iizt73wkSrMyZXcBmgYSdXGS0LLJh/BlT
	lu8uhIfISz+NujdgfqrxJH/1QPSTeEljtBwOcuQHKn94CVM9cW2aLnBLhAHvCwJeOMyghI6BnHm
	teqUTQM4wJqb4WpRMBdfz9i1TfpWyHyRBWkSQhek7I0i9Lq0MxulK53Unc9oPt1RqLhPND3MFj0
	BTrlnk0GpoGu3r4UpyafdxfEN2YelieAGxNw21FYmzB/Ak7zkUxvJw7hyTqNEH6G0onmkR3gjA1
	QaaoNU5jwGsCANgrQpbm6oPJlwdJM26xv03m0YNyYCEglp9TbP+tg2oKfU351uN5+lsa3GRZifE
	lOTGpEsl0M1c+ZJVKJHcDIEl+vLFo4aSzbZ74NZ3BIpudBUxctoeOQGp3jNBBxLHqap9eDDsvlz
	qEoAZbduJPCndZV7vwGwlhaK3uiK7/cb+/dl02lRxD9z+zWP9zIiS7bLgb+UalLd2w8rAsFDcCQ
	x1GIOExoCbf9rfVOsnnrAMQmy4mNW+zMDOOQtvXiivjFZXyUmqzuALjpyNNJJvHw2KNFqimOw3Y
	o4A2k=
X-Received: by 2002:a05:6830:230f:b0:814:57a9:4243 with SMTP id 46e09a7af769-85abdb098e0mr329067a34.17.1793126618937;
        Tue, 27 Oct 2026 11:43:38 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb074fb6sm12488338a34.12.2026.10.27.11.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:43:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 12:22:27 -0600
Subject: [PATCH v3 2/2] dmaengine: mediatek: uart: synchronize completion
 callbacks
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
Message-Id: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-2-aad7a6b3c62e@gmail.com>
References: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
In-Reply-To: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Zhou Wang <wangzhou1@hisilicon.com>, Longfang Liu <liulongfang@huawei.com>, 
 Andy Shevchenko <andy@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, 
 =?utf-8?q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.li@oss.nxp.com>
X-Mailer: b4 0.15.2

Terminating a UART APDMA channel waits for its interrupt handler, but
completion callbacks run in the virt-dma tasklet. A callback already
removed from desc_completed can still be running after termination
returns. With no device_synchronize hook, dmaengine_synchronize() does
not wait for that callback either.

Use vchan_dma_synchronize() as the UART APDMA device_synchronize callback
so clients can wait for completion callbacks before reusing callback
state or freeing DMA buffers. Keep the callback wait separate from
device_terminate_all so it can run without locks acquired by the callback.

Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
Suggested-by: Frank Li <Frank.li@oss.nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index f74e9a328588..6bc4f20d8b06 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -514,6 +514,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
 	mtkd->ddev.device_config = mtk_uart_apdma_slave_config;
 	mtkd->ddev.device_pause = mtk_uart_apdma_device_pause;
 	mtkd->ddev.device_terminate_all = mtk_uart_apdma_terminate_all;
+	mtkd->ddev.device_synchronize = vchan_dma_synchronize;
 	mtkd->ddev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);

-- 
2.53.0

