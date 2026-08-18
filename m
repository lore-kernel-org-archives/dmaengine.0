Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F99442386
	for <dmaengine@vger.kernel.org>; Tue, 18 Aug 2026 09:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045710; cv=none; b=ET1/646FkvgrMWCzKek6L8jcKNFcHI+rMnSazJDfa06jOmo5+nZRRCKIVRyvdfA6eq8vl9Z28B01dBSDXwYDl/Yon0h1d3wDOxnT3ikOXohBeyzpxh4rNHa4TLWF2w3l7UOhMNlYLK157xkNf8AjPV0qHWqZwsKcud9Fbr+4vmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045710; c=relaxed/simple;
	bh=h1ji/DFaRBKCv3TV9qSC2ZG65IgqxtAHA26FR7NThG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dv+s8FIi51xZiPLJqUVHeBRinkvU5DDWt3U+WmCbWkg+UTBtDNCeyFiPZ4G8HBJDrTyP9TZ5bbVvedk9b2VqE9HAC5bszoRsvYFEZFFKWU+UPXtfbO0jv3grW9jK0NBwoYKc52gBY7JkvUTZY/cOg5CCxyARpgxIYTAf/pYNJN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.87])
	by gateway (Coremail) with SMTP id _____8DxjdJJJ4RqlTwCAA--.6606S3;
	Tue, 18 Aug 2026 17:35:05 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.87])
	by front1 (Coremail) with SMTP id qMiowJAx3c5GJ4RqKBsJAA--.58294S2;
	Tue, 18 Aug 2026 17:35:03 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Julia Lawall <julia.lawall@inria.fr>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] dmaengine: loongson: loongson2-apb-cmc: Fix signedness bug in irq handling
Date: Tue, 18 Aug 2026 17:34:48 +0800
Message-ID: <20260818093448.3597016-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx3c5GJ4RqKBsJAA--.58294S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEDCGqDvW8JkwAAsq
X-Coremail-Antispam: 1Uk129KBj93XoW7uFy7GryxuFW5GrW8Zr15KFX_yoW8Gr1xpF
	y3Z34rGFWUtFy3Zas8XFy8WF13Jr98XrZF9a17Z34fur9rZw1Dur1rKF1DXF47AryYgFya
	vFyvgrW5GF1DG3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j83kZUUUUU=

Storing that negative value into an unsigned variable makes the check
`if (lchan->irq < 0)` always false, so probe errors are not correctly
detected and propagated.

Fix this by changing the type of `irq` to `int`, which allows proper
signed comparison and error handling.

Fixes: 1c0028e725f1 ("dmaengine: loongson: New driver for the Loongson Multi-Channel DMA controller")
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202608152230.p20WPlS0-lkp@intel.com/
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/dma/loongson/loongson2-apb-cmc-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
index 1c9a542edc85..969dbc5dabe7 100644
--- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
+++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
@@ -90,7 +90,7 @@ struct loongson2_cmc_dma_chan {
 	struct dma_slave_config	dma_sconfig;
 	struct loongson2_cmc_dma_desc *desc;
 	u32 id;
-	u32 irq;
+	int irq;
 	u32 next_sg;
 	struct loongson2_cmc_dma_chan_reg chan_reg;
 };

base-commit: 075b74841bd0065a3bda3440873c747938e69b68
-- 
2.52.0

