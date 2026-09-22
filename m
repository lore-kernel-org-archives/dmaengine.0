Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E3C5208B8;
	Tue, 22 Sep 2026 23:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119897; cv=none; b=O/Nz8j/uUVAVrtSPMDzf7mmksBTrRLji/0kyjws+Y5OCntY1gXzBmS/JDiDj9eZvEUt5xHsX71FLG0Pld3rMSABM745PAkbSlGZHL17gvm6xS+Cz+u9fjMJnWB7r9GYs3FEDPGUEy/lA5tXncHJTWChwKljxLPEfZhHRerOUKOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119897; c=relaxed/simple;
	bh=kYNHWwhT1xa3+KBsVKoSpdJGei8zXT2FHQOkInDcKm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m76FHEp/OQKxJAjpS+/znTs9NQfHw+FmpLP9wVBcbMRUUV+lCxDDWIPJIY2MW/mUKD88XBW8TVjW+29QpjQI/8En0PJ8wQPuDXpHk57rShUFCdUd67Td9/8heWc6b+4GhI0ofHLZ/BAqxajs8+FKSVkI6dPtBpBspUOVOyg6IN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dk5RZIKe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dk5RZIKe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F7A1F000FF;
	Tue, 22 Sep 2026 23:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790119889;
	bh=5syxvh0LqeKC0Trf+rWZJfwlQVzky6CH3qnNHhzsdh0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Dk5RZIKe2dWQrQ5N0F4gvtxVpJPUEzPy+B6lF6sxE6O0qzNgojn+vTGfvBQI0MwAu
	 T+bc7rIX8Zh2bUZRUw1qw1liHrpuSgGNwrSAvgDb5nTk6lKT7FZ84X5qCyVSPxkQxp
	 odz9b8OJz1011rgv1sSk7ua3Yc50bKgE3po8ztahY65zV5DY9zWQR0/p0NpzNBE2t7
	 Xmp9IL2oiAdBLQctBYFRibd9j4qkO/rwERjRUKrsah98AGUMFCryFDUA8omU8HxnZ2
	 CYgouH6F1hIKElUvA9Sve7KPM3ZTDu7WQkDXn04S03nLw3HBx4gFCsUqkqJiIkCjtY
	 enjRHVHOjseog==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 23 Sep 2026 01:31:07 +0200
Subject: [PATCH v5 22/23] dmaengine: ste_dma40: Validate fixed physical
 channel indexes
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dma40-fixes-v5-22-709d160cde76@kernel.org>
References: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
In-Reply-To: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

Fixed physical memcpy allocation uses dma_cfg.phy_channel directly as an
index into phy_res when use_fixed_channel is set. d40_validate_conf()
validates dev_type but not the fixed physical channel, allowing an invalid
configuration to access memory outside the array.

Validate the fixed physical channel centrally before accepting the channel
configuration.

Fixes: f000df8c5a0e ("dmaengine: ste_dma40: support fixed physical channel allocation")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260819225008.5F9651F000E9@smtp.kernel.org/
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index e0f3f4ac0e3a..20241fafbf94 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1918,6 +1918,14 @@ static int d40_validate_conf(struct d40_chan *d40c,
 		res = -EINVAL;
 	}
 
+	if (conf->use_fixed_channel &&
+	    (conf->phy_channel < 0 ||
+	     conf->phy_channel >= d40c->base->num_phy_chans)) {
+		chan_err(d40c, "Invalid physical channel (%d)\n",
+			 conf->phy_channel);
+		res = -EINVAL;
+	}
+
 	if (conf->dir == DMA_DEV_TO_DEV) {
 		/*
 		 * DMAC HW supports it. Will be added to this driver,

-- 
2.55.0

