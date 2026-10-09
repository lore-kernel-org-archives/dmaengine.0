Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A1D3D1A98;
	Fri,  9 Oct 2026 04:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791520352; cv=none; b=Y3QA0P/muMRvxEyxwYPwDSrb0Y5PZGNQRrZDD6CJjWnhiAnFdTjD0A8UFXujKAkNQm71hAfgiwnG0dHf2Zp5lDOQq73lb5kfC41mcloY7sTrb2SicUaeXp+VyNdxTSGWUjbsnkRq3gpySwUR9WkvBG9vR8Jt+q2GeQcuPpK0cR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791520352; c=relaxed/simple;
	bh=2gSSs/9j43Bj7FJM0ZsKI+EXUuJSLeAx2PM7wYVe65w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VDBkP2e6/x3kt7L+tKnjPIzCtgcJKoB0+lran5JKn7/r+KSdD8fgOzAoMN1SPQYa/g/b5aEbrXcC/8VyZASaInUS991LDij8noyJbEwj8oORFhUXAdcXiS/XDUegmsIu3MlLO2dX6LVHMCZKwe26mRPX0EXGTKJ4E1BWUWflhGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAD3AkFabshqt+AbCg--.2720S2;
	Fri, 09 Oct 2026 12:32:27 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Dan Williams <djbw@kernel.org>,
	Maciej Sosnowski <maciej.sosnowski@intel.com>
Cc: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: ioat: fix completion pool leak on ring allocation failure
Date: Fri,  9 Oct 2026 12:32:29 +0800
Message-Id: <20261009043229.3108794-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAD3AkFabshqt+AbCg--.2720S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr4rurW5WFWDGryxCFy5twb_yoW8ArWxpr
	4Ig3y5C390qF15KFWDG3WkZFZ7Jay3J3y2gFW2q345Zw1v9r4S93yrta40qr4DJFWktFy2
	qrZYqrWfAF1DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWxJVW8Jr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1D
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
	WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAI
	cVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07bnSd9UUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRMPA2rIZLsazwAAs+

ioat_alloc_chan_resources() allocates the channel completion writeback
area with dma_pool_zalloc() and then allocates the descriptor ring with
ioat_alloc_ring().  The ring allocation runs under GFP_NOWAIT and can
fail, in which case the function returns -ENOMEM without freeing the
completion area.  As the ring pointer stays NULL, the only teardown path,
ioat_free_chan_resources(), bails out early and never releases it; a
subsequent retry overwrites ioat_chan->completion, leaking the previous
allocation permanently.  The dmaengine core does not call
device_free_chan_resources() when device_alloc_chan_resources() fails, so
nothing else cleans it up either.

Release the completion area with dma_pool_free() before returning from the
ring allocation error path.

Fixes: 5cbafa65b92e ("ioat2,3: convert to a true ring buffer")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/dma/ioat/init.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ioat/init.c b/drivers/dma/ioat/init.c
index 737496391109..000b59f0f04e 100644
--- a/drivers/dma/ioat/init.c
+++ b/drivers/dma/ioat/init.c
@@ -695,8 +695,14 @@ static int ioat_alloc_chan_resources(struct dma_chan *c)
 
 	order = IOAT_MAX_ORDER;
 	ring = ioat_alloc_ring(c, order, GFP_NOWAIT);
-	if (!ring)
+	if (!ring) {
+		dma_pool_free(ioat_chan->ioat_dma->completion_pool,
+			      ioat_chan->completion,
+			      ioat_chan->completion_dma);
+		ioat_chan->completion = NULL;
+		ioat_chan->completion_dma = 0;
 		return -ENOMEM;
+	}
 
 	spin_lock_bh(&ioat_chan->cleanup_lock);
 	spin_lock_bh(&ioat_chan->prep_lock);
-- 
2.25.1

