Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9310541737C;
	Wed,  2 Sep 2026 09:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341216; cv=none; b=hcei4IXnEygdkF+OhZOK7fhboMccoYYU28Ex6pxytOCXOdZoRCqEidEfepPWLv/0R20eoJZzoF2TAJT6Ea2IZKhOF2OVWcUQv73jNEKmRUxho+ZjK8WXOwyymZWhDt92rdVE35RcCQYDKK7euf/roO0Z2g8WOtWrRjqJW/Hdjpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341216; c=relaxed/simple;
	bh=51V1EYSlDcsYqpXpLLkWaDFgHwDkbR7V6Eb+nEIq68U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L3h99YAmWhDfSiHhqareZY8P1B6Ley7tbylLHWEgzUP3Gpu9PkO+EjKAqISdDeCC3SbXMp2M1YvmxWWw4tdz+0lyyzD4sunZI1IlqvwpwGNbb00vkLhtOBfVZazcfvZIVv8EgqpgrJHgqRVFNAnMCC8Wo1xJ7S6FH1K5Br5yzXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=p1C+hG7o; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="p1C+hG7o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=Gcazpr//qZVVTk8SFKcSzNsnMX9sf5B
	Gz5wVR4rXbHw=; b=p1C+hG7oOUJyzygTtY77JG2KWHndk9LkWbg/xgn8LxBC6xX
	R2Uk1to3h0UalBbdE+/zcq9m5oXiTN4NrH2QA0rGOacocUpzWohDL3T/XZClf/0E
	M3Df5r+iTtuKN5fN3sknaflgkQjFoCIYjy4U5XgR4yeFSJzxUV9yGhX8hMLM=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDHQAfU65dqiy0AAA--.195S5;
	Wed, 02 Sep 2026 17:26:51 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Wed, 02 Sep 2026 17:26:13 +0800
Subject: [PATCH v3 3/4] dmaengine: dw-axi-dmac: Fix CH_CFG2 channel
 priority position
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-dma-fix-v3-3-414c6449fbcc@ultrarisc.com>
References: <20260902-dma-fix-v3-0-414c6449fbcc@ultrarisc.com>
In-Reply-To: <20260902-dma-fix-v3-0-414c6449fbcc@ultrarisc.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Pandith N <pandith.n@intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788341193; l=1030;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=51V1EYSlDcsYqpXpLLkWaDFgHwDkbR7V6Eb+nEIq68U=;
 b=Nyq8b1QqZeIRKCYQBmwT4fj9aPwPJHINTufaSq0jrSKzEDfJNB+2UBug9qcxTadJISRtAYEaE
 bJsAhK6m401D6c5ip0j/96k6+R51vycK4i5fq81NYl8NFRn++4mwSc6
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwDHQAfU65dqiy0AAA--.195S5
X-Coremail-Antispam: 1UD129KBjvdXoWruw18JFWxCFWDGFy8Zw47urg_yoWDuFb_u3
	48WrWaqF1rCFW8Kw48tr1fXr4jvF18ur4I9r4ayr97ArW5Xwsxtw4ktFWrGr13Aa1xGF15
	urW7XrWSqa13XjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb9kFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUWwA2048vs2IY02
	0Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCa
	FVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
	6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
	cSsGvfC2KfnxnUUI43ZEXa7VUbN6pPUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAREWqVJKMAYAA9sk

The CH_CFG2 channel priority field occupies bits 51:47 of the 64-bit
channel configuration register, corresponding to bits 19:15 of CH_CFG2_H.

The driver currently shifts the priority value by 20, programming the
wrong bits. Use bit 15 as the field position.

Fixes: 824351668a41 ("dmaengine: dw-axi-dmac: support DMAX_NUM_CHANNELS > 8")
Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

