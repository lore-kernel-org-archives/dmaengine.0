Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E401A2545;
	Fri,  9 Oct 2026 04:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791519853; cv=none; b=Dxe17hrFZPSndx9quU6x5e3QzTUZcQleOzfSk0E9z4YKjiH7Iz0epVMcDJkVOwfIgwkSIxctJcaC4RhkiW4W9S5yhbQFH2qcPuz/YHegLGAkBeWKpL38JGKG94Oi92/kDsk3/15eA/IsP4BdRxyNNoxh8Nw8ur42+2bzaJou7C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791519853; c=relaxed/simple;
	bh=slH+7KphGlORTAIIlm+CtnnqQBraivYEO4K+LAX0IT0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uI8v04mGJ8WhLx2m6Y0P4ITPr/cv76BssphVLpyQZ1KETcu4lIPUPb0mMSD9d0uG54IbE0yjSvPS5+BVJBYOXW1wYKLpI4ehzvE1J++bPZVPJmGrdP55b7R8Hc0ap0ACoaRyYLcISB+lji4MEnn8kK9DQFDH+01K05v6OAUZQio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADXo0FbbMhqibUbCg--.10115S2;
	Fri, 09 Oct 2026 12:23:56 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Green Wan <green.wan@sifive.com>
Cc: linux-riscv@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: sf-pdma: fix double-free of the in-flight descriptor
Date: Fri,  9 Oct 2026 12:23:58 +0800
Message-Id: <20261009042358.3102885-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADXo0FbbMhqibUbCg--.10115S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF4UJFyDJFW3Cw13Ww1rWFg_yoW8Cw4fp3
	y3Ja13KFW3tr15XF98Gr4rt3Wjya1Sy3y29rWqkwnxCr43Jrs2k3WxA34YgFyDArs7AFn0
	kws8J34fuFWrCrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWxJVW8Jr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1D
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
	WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAI
	cVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07b8nQbUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAQPA2rIJHz+tgACs0

The descriptors handed to sf_pdma_issue_pending() and
sf_pdma_donebh_tasklet() come from the virt-dma desc_issued list
(sf_pdma_get_first_pending_desc() returns list_first_entry() of that
list), so chan->desc always refers to a descriptor that is still linked
on a virt-dma list while a transfer is in flight.

sf_pdma_free_chan_resources() and sf_pdma_terminate_all() free that
descriptor with kfree(chan->desc) and then call
vchan_get_all_descriptors(), which splices desc_issued into the local
head list, so vchan_dma_desc_free_list() frees the very same object
again through sf_pdma_free_desc(), causing a double-free (and a
use-after-free for the pending tasklets).

Drop the direct kfree(chan->desc) calls so the in-flight descriptor is
freed only once by vchan_dma_desc_free_list().

Fixes: 6973886ad58e ("dmaengine: sf-pdma: add platform DMA support for HiFive Unleashed A00")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/dma/sf-pdma/sf-pdma.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index 6f79cc28703e..40f556e198b4 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -144,7 +144,6 @@ static void sf_pdma_free_chan_resources(struct dma_chan *dchan)
 
 	spin_lock_irqsave(&chan->vchan.lock, flags);
 	sf_pdma_disable_request(chan);
-	kfree(chan->desc);
 	chan->desc = NULL;
 	vchan_get_all_descriptors(&chan->vchan, &head);
 	sf_pdma_disclaim_chan(chan);
@@ -214,7 +213,6 @@ static int sf_pdma_terminate_all(struct dma_chan *dchan)
 
 	spin_lock_irqsave(&chan->vchan.lock, flags);
 	sf_pdma_disable_request(chan);
-	kfree(chan->desc);
 	chan->desc = NULL;
 	chan->xfer_err = false;
 	vchan_get_all_descriptors(&chan->vchan, &head);
-- 
2.25.1

