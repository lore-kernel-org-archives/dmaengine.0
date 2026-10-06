Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779D4A95E;
	Tue,  6 Oct 2026 01:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791248590; cv=none; b=GlWv4GSU8PCYbQ1V1xqWn1kYQk8Hfu8SWH42BmXG1u/ui86mBjX5zerTM40mPL16fUiX8a5sX1VKNxspf4NCfoligBFafAspu/qdXZNqZW8Bofo5Vrkdpk1gb15STz3PpUrF6JGpLVczSK5AXbLknVJJNakV3ZFVzGsia4VxCLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791248590; c=relaxed/simple;
	bh=QBBBbEsqPOyDi1gyLNQpOGAeLHGvZg8d7nUuIMJLoig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X+a3qtwxEjZCfnVpVnD8bYyyq9Y4TmfOa/VOwfYMO1Y9Ovs5IaNTn/0TEsH5/YrZpKwdvBW0/pwyMQZNg0rouudnc4Np32ybAYGXDGaWIrJoBHsSt8JiGEuW2wwF6S/e0JL+Cliz/0dz2ZfNjj/ivHxDrtHvRCzSX4zJvh1CR9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpPHrAY3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpPHrAY3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E6F9C2BCF4;
	Tue,  6 Oct 2026 01:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791248590;
	bh=QBBBbEsqPOyDi1gyLNQpOGAeLHGvZg8d7nUuIMJLoig=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fpPHrAY3pEYpp/MLDFi36WBd0uwvn2mFdYmwXA+iFh4p4iEO3Jo4rIYa6UM/EiJqU
	 ouj6M6+Cg2THaOta2f+rTbe8w8MrJBN/O8wOF2obALCdFOPCgzejWW+8AQ36rfFuRu
	 AOb9I3wRVBGLuNbhP3khytIXhk5cEJL6BRMfj7OiQjPBgaV0L5upBJl0I5saPHQVZP
	 iAYsi7w1KYzTPWR26Qeu/0pO/F5wQQZAN81O4ZQwfJrq9sXUVjHaSvqg8Cmdl81Jwt
	 KScJBBjUftchmb6mTWzCYM4wO2FdEEDvm8sKDDoogQ6LhBpZ3piMcGbsu/OufRXFwj
	 am2HJk1MdrVvw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08646CA6001;
	Tue,  6 Oct 2026 01:03:10 +0000 (UTC)
From: Roland Dreier via B4 Relay <devnull+rolanddreier.rivian.com@kernel.org>
Date: Tue, 06 Oct 2026 01:03:08 +0000
Subject: [PATCH 2/3] dmaengine: dw-axi-dmac: Report failed transfers in the
 descriptor result
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-dw-axi-fixes-v1-2-3b319e456d93@rivian.com>
References: <20261006-dw-axi-fixes-v1-0-3b319e456d93@rivian.com>
In-Reply-To: <20261006-dw-axi-fixes-v1-0-3b319e456d93@rivian.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Roland Dreier <rolanddreier@rivian.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791248589; l=1473;
 i=rolanddreier@rivian.com; s=20260814; h=from:subject:message-id;
 bh=dCofrQtsaToPcFMjK0WnPAuxqv/qWfmPzjG50ShhZtI=;
 b=bCwpgzy1rDeh+fkdCSIIb7DcxVLVKzfDguqxa7hSOrgx7ewVdEpXLrZzhCEjE+mpoKlP6zvtc
 9HHMxJAAt8zDHFlbLeWw5gn3FnxiNmryth7V2WCJVqPGVz7skvlXiaA
X-Developer-Key: i=rolanddreier@rivian.com; a=ed25519;
 pk=C7SBXsDIlarq7BpINqyDL67XV/AGNqNt09NCCpFcExk=
X-Endpoint-Received: by B4 Relay for rolanddreier@rivian.com/20260814 with
 auth_id=952
X-Original-From: Roland Dreier <rolanddreier@rivian.com>
Reply-To: rolanddreier@rivian.com

From: Roland Dreier <rolanddreier@rivian.com>

axi_chan_handle_err() completes a failed descriptor without updating
vd->tx_result. So clients using tx_result always get DMA_TRANS_NOERROR,
even for incomplete / failed transfers (bus error or other reason).

Set the result so a client can detect failures:
 - DMA_TRANS_READ_FAILED for source decode or slave errors
 - DMA_TRANS_WRITE_FAILED for destination decode or slave errors
 - DMA_TRANS_ABORTED for everything else

Assisted-by: LLM
Signed-off-by: Roland Dreier <rolanddreier@rivian.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 813d17a278e7..88362f181207 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1084,6 +1084,13 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 		axi_chan_name(chan), vd->tx.cookie, status);
 	axi_chan_list_dump_lli(chan, vd_to_axi_desc(vd));
 
+	if (status & (DWAXIDMAC_IRQ_SRC_DEC_ERR | DWAXIDMAC_IRQ_SRC_SLV_ERR))
+		vd->tx_result.result = DMA_TRANS_READ_FAILED;
+	else if (status & (DWAXIDMAC_IRQ_DST_DEC_ERR | DWAXIDMAC_IRQ_DST_SLV_ERR))
+		vd->tx_result.result = DMA_TRANS_WRITE_FAILED;
+	else
+		vd->tx_result.result = DMA_TRANS_ABORTED;
+
 	vchan_cookie_complete(vd);
 
 	/* Try to restart the controller */

-- 
2.54.0


