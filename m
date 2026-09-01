Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3195A4CCDFC;
	Tue,  1 Sep 2026 06:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788243437; cv=none; b=cCEQfsFCGf7aXKBRvrMxSNhVdC5C5As1AAc65JJvNb9TMZXXgXZ4YwqVz09wiRvnVaoEzdiHtGCgZ5LLqFVQaQmEfvejh3roEvppXX/zTV/rNoaoVmgvBBYdV4YUfShD5qVTyvtgVlHRUszUmQGWT6oV17/tPe2nLE7EUWYyY38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788243437; c=relaxed/simple;
	bh=6Gd+of4Puc7xILD1S5PlRkm3yJCuJkB/jZUj5nzD0AM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qZGWTCTbcWiK+IJJTIJhmRFFzhe48cZIN+MIyEuoB0Y5whLi4ARGYVlkJl5LLOH+29f6C3bR4+ISkuZlqYCBBOWlwVbmgjy99E8qKLg50m7BqHcGGqx3a84+Y10si8niNyu3yx8VytmO36lqbHj25DVanamViB/BgvGJEGreZdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=o3lWQwx4; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="o3lWQwx4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=DPAUNyXjrPHG/Ri1i6kK82mXAsYo7P9
	e2J85llwtjPU=; b=o3lWQwx4pYlYe7tDXz9sMSiIMzxyPsDVsrZjx7H//AFFFWI
	DVTEAlpuZHqWWErFSAwIS2g7/GpY/gRgRhr+glO/fii3pQjTr4UYXZKu+CDc1Naz
	VgFbzQBXy8QXx0+gboWVhz/T8Ji0AxDBlzpOQAGIf2lrlHoRlJIP2km7K2P8=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDnrwbjbZZqXCAAAA--.118S5;
	Tue, 01 Sep 2026 14:17:15 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Tue, 01 Sep 2026 14:16:06 +0800
Subject: [PATCH v2 3/4] dmaengine: dw-axi-dmac: Fix CH_CFG2 channel
 priority position
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dma-fix-v2-3-d7f0459ebb14@ultrarisc.com>
References: <20260901-dma-fix-v2-0-d7f0459ebb14@ultrarisc.com>
In-Reply-To: <20260901-dma-fix-v2-0-d7f0459ebb14@ultrarisc.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Pandith N <pandith.n@intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788243415; l=988;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=6Gd+of4Puc7xILD1S5PlRkm3yJCuJkB/jZUj5nzD0AM=;
 b=cW14D0R9u6FqNEVZ5HDyewMVyT4+NzKjsE2lBYMdb7raEchwhGdDYcvCcd5yvRwaF8YO1hFlO
 VYa3wX75S+8DNdSPu2lJSHkJl39ABhoznVg8CG0nRDTvJehTm4RY4zP
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwDnrwbjbZZqXCAAAA--.118S5
X-Coremail-Antispam: 1UD129KBjvdXoWruw18JFWxZr1xGFWrJr45Awb_yoWDWFX_u3
	48WrWaqF1rCFW8Kw48tr1fXr4jvF18ur4I9r4ayr97Ar45Xws8tw4ktFWrGr13AayxGF15
	urW7XrWSqa13XjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbqAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUWwA2048vs2IY02
	0Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q6r43Mx
	kIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU
	55rcDUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAREWqVJKMAYAAFsc

The CH_CFG2 channel priority field occupies bits 51:47 of the 64-bit
channel configuration register, corresponding to bits 19:15 of CH_CFG2_H.

The driver currently shifts the priority value by 20, programming the
wrong bits. Use bit 15 as the field position.

Fixes: 824351668a41 ("dmaengine: dw-axi-dmac: support DMAX_NUM_CHANNELS > 8")
Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
index 67cc199e24d1..97451bb8b16a 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
@@ -327,7 +327,7 @@ enum {
 #define CH_CFG2_H_TT_FC_POS		0
 #define CH_CFG2_H_HS_SEL_SRC_POS	3
 #define CH_CFG2_H_HS_SEL_DST_POS	4
-#define CH_CFG2_H_PRIORITY_POS		20
+#define CH_CFG2_H_PRIORITY_POS		15
 
 /**
  * DW AXI DMA channel interrupts

-- 
2.34.1

