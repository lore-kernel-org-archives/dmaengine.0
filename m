Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59AC3EA957;
	Fri, 11 Sep 2026 06:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789106958; cv=none; b=l6jKDRErmv4WenxWtVjRqIaf1RvjPJp+AwBVMRsD/UBdC77ie6q4MtH5mWwgqUcge86hc8tSfyARW3ZP7ecslZr2g/mrsp3Duey3sIUhhqtmTqPo4AYQYKSBgb+9Vc9HQn1u53hbQPBJhLX+PDPWEhhv4yigKthAwBi1QnRIh9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789106958; c=relaxed/simple;
	bh=pgnXJaDDt/Y39JM7uVeOuNQVYdZTHBLK8S3Ghb0dRpk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P7aDJninEUC/7KxA788TdVJi0y0h38KhW3cWBaCjPZsPGffiy4OtRgm1cyKBlQKT2QkIqmp/A1TBfmD4A5315TN2fbX2tyhdU8cOVhRijtMvSTzcXVHUd2ltDJibj0AjXm5/VvCrMIvKvwMVYu4PDEzkTWT5q90Hq6tCUdbwQr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=V0U4Meow; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="V0U4Meow"
Received: from seu.edu.cn (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d62c4fa7;
	Fri, 11 Sep 2026 14:09:05 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: frank.li@nxp.com,
	vkoul@kernel.org
Cc: imx@lists.linux.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH RFC] dmaengine: fsl-edma: check channel acquisition before use
Date: Fri, 11 Sep 2026 14:09:02 +0800
Message-Id: <20260911060902.94153-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa08f157d8703a1kunm227db5c51c7314
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGBpOVksYSxgeHkxPGktNGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSU
	hOQ0NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=V0U4MeowVyQ3xR44xBeO+SWtyd2L3GSR2mxPQFkTlG22wzPTSXQnUNtViX1dVXXUJFLy5nLQco+wMRYB2n25eKUXhQPJY2V5s19QdCmfxy4o5Wj3G+YeZ7C2Ti0wByplQ21L+MpxbPEaMuWI3gtPvn/EmcqAyUbkm/LL8wSseTc=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=JGj4Xij/A+0/K4xLAcPYm0ykDqHituOQmPSV1JuP7Ws=;
	h=date:mime-version:subject:message-id:from;

dma_get_slave_channel() can return NULL when acquiring a channel fails,
for example if fsl_edma_alloc_chan_resources() cannot request an IRQ.
fsl_edma3_xlate() dereferences that return value to update privatecnt.

Acquire and check the channel before publishing its source ID and
request parameters. A NULL-only check after the existing source-ID
assignment would leave the failed request marked as in use, causing
fsl_edma_srcid_in_use() to reject a subsequent request for that source.
The channel resource-allocation callback does not consume these request
parameters, so set them only after acquisition succeeds. The existing
scoped mutex release and successful-channel return are preserved.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: 72f5801a4e2b ("dmaengine: fsl-edma: integrate v3 support")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/dma/fsl-edma-main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index d9fb717b5b53..6934ac882697 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -326,13 +326,16 @@ static struct dma_chan *fsl_edma3_xlate(struct of_phandle_args *dma_spec,
 		if ((dma_spec->args[2] & FSL_EDMA_ODD_CH) && !(i & 0x1))
 			continue;
 
+		chan = dma_get_slave_channel(chan);
+		if (!chan)
+			return NULL;
+
 		fsl_chan->srcid = dma_spec->args[0];
 		fsl_chan->priority = dma_spec->args[1];
 		fsl_chan->is_rxchan = dma_spec->args[2] & FSL_EDMA_RX;
 		fsl_chan->is_remote = dma_spec->args[2] & FSL_EDMA_REMOTE;
 		fsl_chan->is_multi_fifo = dma_spec->args[2] & FSL_EDMA_MULTI_FIFO;
 
-		chan = dma_get_slave_channel(chan);
 		chan->device->privatecnt++;
 		return chan;
 	}
