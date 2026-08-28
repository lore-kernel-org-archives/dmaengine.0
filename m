Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5EB30FF36;
	Fri, 28 Aug 2026 00:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787878118; cv=none; b=PObJ1QiL2twJVqVk1zTYJ+o+wSHD0bI+F1VaKrKBD2MEN0re+8eNglu+4olDcBxa5q845PgKPDxecHqBnzfSamHfT3Wo7UhepA2Hijrq6V0E/bHdfRovCEZesEEP/tCY/xL4AQB5HtaObSTMHQg4okfjm+yCE0OQfU08nouzqPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787878118; c=relaxed/simple;
	bh=NFLyLX8R+hoLKXzujgGCXVP5FlVDAWB3PS2BC0v4nNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XWvwQ9grlt7BNWlLQxpU8GtGC19dhZiwJH4qyAepqBDx7AJ0/bLxHZ3xleCjRwFLPLeROv8Ouwv4cT7nuMOmI2CkcElUvOe1HL5Ai6BY74yeh67ahk8z5nUl8dPER5NPZbhdlHG+lKgja44fF7PC0Gtrf9BDg3L6BRCo6TOX0FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=j1H+YKhB; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="j1H+YKhB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=zvPKw/e7U23JjWvrITW/LvPufCKRBKh
	4C3l1JjoU0P8=; b=j1H+YKhB8RO5ZUCKUiEE8DQgG6Frjs5vSH10bUEWKBoKd1z
	XCy/HuiXDMLfhNRS6urR8zUchQrZJTWWbQ5phls6o4peBw91hloSRWlLUhfxBe14
	Vyw4azk6JMlWSGTBEnEbL/L8R7uBokyVCXZIBjyUeoT4zuMZ5ntte+KkvWxE=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwCXxs3p2pBqHmMBAA--.589S3;
	Fri, 28 Aug 2026 08:48:41 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Fri, 28 Aug 2026 08:48:26 +0800
Subject: [PATCH 1/2] dmaengine: dw-axi-dmac: Fix AXI burst length encoding
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-dma-fix-v1-1-a6947f487e07@ultrarisc.com>
References: <20260828-dma-fix-v1-0-a6947f487e07@ultrarisc.com>
In-Reply-To: <20260828-dma-fix-v1-0-a6947f487e07@ultrarisc.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Pandith N <pandith.n@intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787878108; l=1873;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=NFLyLX8R+hoLKXzujgGCXVP5FlVDAWB3PS2BC0v4nNw=;
 b=Zt2qIgkd3e4H4DIydk17FYZHA0O0uUHtPcoFArqoI59OBP9Qk2bd928XGLmSudDxXrQYm7dBg
 9Squ8fN6sQbDA2+j2Wi0CCGJh35W9k3VSKmA9QJ7ni9O/giQviRYvWf
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwCXxs3p2pBqHmMBAA--.589S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF1rKryfZFy7CFy3tr1fJFb_yoW8Cw4Upa
	n5Kw4rJryDtw1qka1kJ347ZFyUtFy5KrWIvF48Zw1SkFZ8X34Svr4kKw1F9r1kAF4rJr4f
	tF4fJFyrZF1kZrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPI14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q6r43Mx
	kIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUq
	kskUUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAMEWqPrHsAIwAJsE

The snps,axi-max-burst-len property describes the number of beats in an
AXI burst, while the ARLEN and AWLEN fields encode that value minus one.

The driver keeps axi_rw_burst_len as the actual burst length so that
dma_device.max_burst reports the correct value. However, it also programs
that unencoded value directly into the hardware fields. A value of 256
therefore overflows the 8-bit fields and can cause AXI decode errors.

Subtract one only when constructing hardware descriptors, while keeping
the actual value for dma_device.max_burst.

Fixes: c454d16a7d5a ("dmaengine: dw-axi-dmac: Burst length settings")
Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index eebed2474210..742e08cfab43 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -706,7 +706,7 @@ static int dw_axi_dma_set_hw_desc(struct axi_dma_chan *chan,
 	ctlhi = CH_CTL_H_LLI_VALID;
 
 	if (chan->chip->dw->hdata->restrict_axi_burst_len) {
-		burst_len = chan->chip->dw->hdata->axi_rw_burst_len;
+		burst_len = chan->chip->dw->hdata->axi_rw_burst_len - 1;
 		ctlhi |= CH_CTL_H_ARLEN_EN | CH_CTL_H_AWLEN_EN |
 			 burst_len << CH_CTL_H_ARLEN_POS |
 			 burst_len << CH_CTL_H_AWLEN_POS;
@@ -975,7 +975,7 @@ dma_chan_prep_dma_memcpy(struct dma_chan *dchan, dma_addr_t dst_adr,
 
 		reg = CH_CTL_H_LLI_VALID;
 		if (chan->chip->dw->hdata->restrict_axi_burst_len) {
-			u32 burst_len = chan->chip->dw->hdata->axi_rw_burst_len;
+			u32 burst_len = chan->chip->dw->hdata->axi_rw_burst_len - 1;
 
 			reg |= (CH_CTL_H_ARLEN_EN |
 				burst_len << CH_CTL_H_ARLEN_POS |

-- 
2.34.1

