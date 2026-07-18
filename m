Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74324329E7E
	for <dmaengine@vger.kernel.org>; Sat, 18 Jul 2026 14:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784385207; cv=none; b=M0w53A3PcXlU+r5rSbUvTguABWYMdHIVSgph+rA0HZhIjwBNKbgb0u8yv15WgwlSXkCDLsu66CbyIBE9EshTn500j3DWl/TXsLERhiyL/kjG6q75/DS//sg+vcv3IohjFYpu4UyLA2PPHAOdmusIkkqPWvr1u7ojqLo61C+HE3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784385207; c=relaxed/simple;
	bh=9uqj35dM62xTsRNTcJkfo3XLZns7MaAyabDUYSG1rKo=;
	h=Message-ID:Date:To:Cc:MIME-Version:Content-Type:From:Subject; b=EQobAnqonI4SSNW2L5LXfauYmE2PaUAt3rwiN2gLDeSF7DaS5zuP4pdLyL1cOgrFugKRrWOmMefUM7G+esK49IEVtZwYeXVQDc6QHWA3+uH4piAFnldPv4MB5rM/l8sFpnPHHM2KTKpBwOq70oVfVqYBuWoI5jF2TLXGZk+LfnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+jTatLz; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+jTatLz"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-381b831d535so6239672a91.0
        for <dmaengine@vger.kernel.org>; Sat, 18 Jul 2026 07:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784385203; x=1784990003; darn=vger.kernel.org;
        h=subject:from:content-transfer-encoding:content-type:mime-version:cc
         :to:date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=55fC2R02j2nFCuXnZITrYzy5ng4jk/YuR3hFfzGCVwI=;
        b=L+jTatLzT6Sct50SzIdtvmEGKnJd6SzYemkUPsiXvSIVsrPzVUSD9XmLR6mdboi5fW
         EZpYQOfu7DFmeM1e9NWtP3QVMyhkVWIJLbpUyPW182chP217xs5y90LEMxLTt30oIKqf
         nGbybJrdPbpILoQlvxboiUCd+XIZihJNeEgDKJzLqiueJdh9MmGyZiRHfC/d58LnTo/R
         n86rar4tLZcPW7wYgqtHV0T63imBcOHIiwo057ajoQhZIGl/a5/vpTNEAJ+hI3zw8xvY
         PoraafS9sBFG7q73EuOAKbj5SILRRPrZdWVXNPhzj6ffuzyOAhTtbzzRubn5u7Ig591q
         XnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784385203; x=1784990003;
        h=subject:from:content-transfer-encoding:content-type:mime-version:cc
         :to:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=55fC2R02j2nFCuXnZITrYzy5ng4jk/YuR3hFfzGCVwI=;
        b=R6kJT+4ieMNz7WvSZvJNkvyLxw7mcCpI6p9/Z592kAsYywVg/ywvF+DSxbgzx9xkAt
         j1tzVgzA+CEWn30b++psn/ballzSgmA3qVqC1R0ZrWsSeEe5LwkQwuoWwD1jRJvStJWM
         BjupGqW+7JcX1GljRg7QlDZ1xKMKC01g+aMz0dMgFeThBjsXlZm37G01vob9xKLyuQbh
         sg8Ygh2imwwas/b9NlI/q9RU0CyvB8LPznAp7JT7hpiJPYYtOPVhotj1eWmfFVijXfzC
         TPdVNUyA0GZl4lLD7xustt1OK/r9Wv6fCj4oVAm6RfnHy0APc6XIJ6206dMRJgw8ZAVE
         gfqQ==
X-Forwarded-Encrypted: i=1; AHgh+RpI5lTbEkXfshwXBnDciH/MEAMxoCCKrr0HLzjKKMexTiFMy3fAtFVkBikSSKXZjUFpOGt62kDgyQM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs68uQTsSqlmsvi8eH27CGMe3PKqyGPulvpo/GmKO8nZvjCGED
	ZZ2jNOSoyeWgSlYFk8yzHHGj8szPqEdNpzJt43m6nOdrsOLdznxLUG2K
X-Gm-Gg: AfdE7ckOMIV8MFCUH9s6n+ylIwZWOn0rm2EwCSHTwYmPJ1xTu/JGfFElJCfK9Llzqcw
	p/CAdpZA53l8thGHSaivoPd6+cK50IuiQmuFal19npBlpjyWOLzQ9VK1iG7wb1rYBqESdfKt6sb
	MaS1zVtjzKPYnV1ltXU7WZ7ko9GhiUjaLKn3RZ+MsnhHMorzqmqKxWO5EW0ojCHT2UgFfl6XFb2
	V/UsM1n4tIJFlAJgUl2Q3YI8IvjDk6xgKt3g1zsPbpvQVY2K3uJWewWy0B9LCiLab3MWkiwqE9S
	VRH78nfb0NlCXCW2MGX5GdWkxj6OvlSd8pnnEFp23+Glaw0cAElwSpUa+dgImjw3ElS148BZogk
	0cL3jaJ/M2I8/ZPg5mtxAK/c8FwL24jSrz3ADIfQChUVGA5XEADGCraIZrvcbt+L2WMJDvDUJKj
	efRE3rrGirO0xAO/mOAQ==
X-Received: by 2002:a17:90b:5608:b0:38e:488f:7068 with SMTP id 98e67ed59e1d1-38e4b43108bmr7869949a91.2.1784385203335;
        Sat, 18 Jul 2026 07:33:23 -0700 (PDT)
Received: from sw_send.eml ([49.216.222.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39e2354dsm4698877a91.8.2026.07.18.07.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 07:33:22 -0700 (PDT)
Message-ID: <20260718223257.5662.alvinhuang0603@gmail.com>
Date: Sat, 18 Jul 2026 22:32:57 +0800
To: Kelvin Cao <kelvin.cao@microchip.com>, Logan Gunthorpe <logang@deltatee.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, George Ge <george.ge@microchip.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From: Hao-Qun Huang <alvinhuang0603@gmail.com>
Subject: [PATCH] dmaengine: switchtec-dma: preserve results for out-of-order
 completions

Switchtec completion entries can arrive out of submission order, and the
driver handles that by marking the descriptor complete and deferring its
callback until the ring tail catches up.  The problem is that the
per-transfer result (status and residue) is only kept in a stack variable
while the completion entry is being read.  Once the tail gap closes,
cleanup retires the descriptor at the tail along with any already
completed descriptors behind it, and hands the same stack result to every
one of them.

So a transfer that failed out of order can be reported as successful (or
the other way round) depending on which completion happened to close the
gap, and the residue can end up coming from the wrong transfer too.

Keep the result in each descriptor instead of on the stack, and pass the
descriptor's own saved result when it is retired.  Cookie ordering, the
CID-to-descriptor mapping and the completion locking are unchanged; only
the result handed to each callback is corrected.

Fixes: 30eba9df76ad ("dmaengine: switchtec-dma: Implement hardware initialization and cleanup")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>
---
 drivers/dma/switchtec_dma.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/switchtec_dma.c b/drivers/dma/switchtec_dma.c
index 3ef928640615..681540836e73 100644
--- a/drivers/dma/switchtec_dma.c
+++ b/drivers/dma/switchtec_dma.c
@@ -246,6 +246,7 @@ struct switchtec_dma_hw_ce {
 struct switchtec_dma_desc {
 	struct dma_async_tx_descriptor txd;
 	struct switchtec_dma_hw_se_desc *hw;
+	struct dmaengine_result result;
 	u32 orig_size;
 	bool completed;
 };
@@ -409,7 +410,6 @@ switchtec_dma_cleanup_completed(struct switchtec_dma_chan *swdma_chan)
 	struct device *chan_dev = &swdma_chan->dma_chan.dev->device;
 	struct switchtec_dma_desc *desc;
 	struct switchtec_dma_hw_ce *ce;
-	struct dmaengine_result res;
 	int tail, cid, se_idx, i;
 	__le16 phase_tag;
 	u32 sts_code;
@@ -439,17 +439,17 @@ switchtec_dma_cleanup_completed(struct switchtec_dma_chan *swdma_chan)
 
 		tail = swdma_chan->tail;
 
-		res.residue = desc->orig_size - le32_to_cpu(ce->cpl_byte_cnt);
+		desc->result.residue = desc->orig_size - le32_to_cpu(ce->cpl_byte_cnt);
 
 		sts_code = le32_to_cpu(ce->sts_code);
 
 		if (!(sts_code & SWITCHTEC_CE_SC_MASK)) {
-			res.result = DMA_TRANS_NOERROR;
+			desc->result.result = DMA_TRANS_NOERROR;
 		} else {
 			if (sts_code & SWITCHTEC_CE_SC_D_RD_CTO)
-				res.result = DMA_TRANS_READ_FAILED;
+				desc->result.result = DMA_TRANS_READ_FAILED;
 			else
-				res.result = DMA_TRANS_WRITE_FAILED;
+				desc->result.result = DMA_TRANS_WRITE_FAILED;
 
 			dev_err(chan_dev, "CID 0x%04x failed, SC 0x%08x\n", cid,
 				(u32)(sts_code & SWITCHTEC_CE_SC_MASK));
@@ -488,7 +488,7 @@ switchtec_dma_cleanup_completed(struct switchtec_dma_chan *swdma_chan)
 		do {
 			dma_cookie_complete(&desc->txd);
 			dma_descriptor_unmap(&desc->txd);
-			dmaengine_desc_get_callback_invoke(&desc->txd, &res);
+			dmaengine_desc_get_callback_invoke(&desc->txd, &desc->result);
 			desc->txd.callback = NULL;
 			desc->txd.callback_result = NULL;
 			desc->completed = false;
-- 
2.43.0

