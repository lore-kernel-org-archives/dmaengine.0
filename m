Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3B514900E;
	Tue,  6 Oct 2026 01:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791248590; cv=none; b=PPxi8GXfqZMUObo8PN/NYO3Shqg4rxtrGWG+6qewtY7OWAPL1BCwl5hOXzQRmn07vat5pg2IZ9NX7KyH5G9qbahJ8Sv+AaGN9sGmh35HxRWOXG7dz4d7GFPXy6Chh6xMF1n67QJsFcnKslIszUKrcazlzCv2JwiAkpU7/tAsdfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791248590; c=relaxed/simple;
	bh=J+bGGvwdae8B74zg1l9832E5RoF5+vjOvaDXXyzvEW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dJr7XiExxvp37c7hyXWTv+hBT6YYQExvfMam22Vi3boP1IEbhm1xjrmrSW9ofd7e1TQRFqKxoRM0CVv++zDo277blb22uHfjaRawyBtHUoZKqKf8CUV5XvbW7/O1kJwSlCmvxbNGHlfi9wwTdCzl0QwymTF80yzPl81vcTpAans=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BqXFLnuk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BqXFLnuk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25488C4AF60;
	Tue,  6 Oct 2026 01:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791248590;
	bh=J+bGGvwdae8B74zg1l9832E5RoF5+vjOvaDXXyzvEW0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BqXFLnukpLyZWYRCgV8wauENr2XAKw25VWhG2V1xUCz9DLi90nXzv8xAxkPcwzGj0
	 zrkenrb06vVvy0RHsC3gNzvVvH1Ml0I1xuZPwioKgHG5ZF3TIZLpU0ivgpBOwSBqVB
	 qc1khwyHmfEy9UYUhnjRRtNcbCfSCUINQO98185bm2Y3grPk52kOigegPb2dzvU4nZ
	 qCkdfBviO1/bH0BkMQp+vvgI8L6zH1fasrUi5By606aonREo1W0JFQAtCQz6skPvdj
	 ryOy0F+62dQO98euQ2HzgH5DVSclJ8U/LTCB2Fj+94FRuRjBtOirPWNi0bhxfvfYHD
	 cx3RFmoTmoVMg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7CCCA5FF0;
	Tue,  6 Oct 2026 01:03:09 +0000 (UTC)
From: Roland Dreier via B4 Relay <devnull+rolanddreier.rivian.com@kernel.org>
Date: Tue, 06 Oct 2026 01:03:07 +0000
Subject: [PATCH 1/3] dmaengine: dw-axi-dmac: Bound the cyclic LLP search to
 the descriptor
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-dw-axi-fixes-v1-1-3b319e456d93@rivian.com>
References: <20261006-dw-axi-fixes-v1-0-3b319e456d93@rivian.com>
In-Reply-To: <20261006-dw-axi-fixes-v1-0-3b319e456d93@rivian.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Roland Dreier <rolanddreier@rivian.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791248589; l=1780;
 i=rolanddreier@rivian.com; s=20260814; h=from:subject:message-id;
 bh=8aZQ42t/+U7ZkngXaGx9DTBfALw1MQ/hNwkH2KD1Yes=;
 b=wzDUIEkC4gjPRkgjkwAzDq08wTlLpCHS8BfxrGggcUBSVoY6wV1y+NzoxkB80x7SHdD+oYV0t
 RP0DTxTU28xBaQDlhMDQcE7iMyOsjZFfVkK0KtnPvDUI+qAzgTIXEkQ
X-Developer-Key: i=rolanddreier@rivian.com; a=ed25519;
 pk=C7SBXsDIlarq7BpINqyDL67XV/AGNqNt09NCCpFcExk=
X-Endpoint-Received: by B4 Relay for rolanddreier@rivian.com/20260814 with
 auth_id=952
X-Original-From: Roland Dreier <rolanddreier@rivian.com>
Reply-To: rolanddreier@rivian.com

From: Roland Dreier <rolanddreier@rivian.com>

For a cyclic transfer, axi_chan_block_xfer_complete() looks for the
LLI whose address matches CH_LLP by walking the descriptor's hw_desc
array, but it bounds the walk with chan->descs_allocated. That counts
the LLIs of every descriptor allocated on the channel, not just this
one. If CH_LLP matches none of the descriptor's LLIs (should never
happen, but...) while another descriptor is allocated, the loop reads
past the end of the array.

Bound the walk with the descriptor's nr_hw_descs, as in the
already-queued patch "dmaengine: dw-axi-dmac: Fix LLI dump
out-of-bounds access".

Assisted-by: LLM
Signed-off-by: Roland Dreier <rolanddreier@rivian.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index eebed2474210..813d17a278e7 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1095,7 +1095,6 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 
 static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 {
-	int count = atomic_read(&chan->descs_allocated);
 	struct axi_dma_hw_desc *hw_desc;
 	struct axi_dma_desc *desc;
 	struct virt_dma_desc *vd;
@@ -1122,7 +1121,7 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 		desc = vd_to_axi_desc(vd);
 		if (desc) {
 			llp = lo_hi_readq(chan->chan_regs + CH_LLP);
-			for (i = 0; i < count; i++) {
+			for (i = 0; i < desc->nr_hw_descs; i++) {
 				hw_desc = &desc->hw_desc[i];
 				if (hw_desc->llp == llp) {
 					axi_chan_irq_clear(chan, hw_desc->lli->status_lo);

-- 
2.54.0


