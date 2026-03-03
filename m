Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0012F375AD8
	for <dmaengine@vger.kernel.org>; Tue,  3 Mar 2026 10:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772533458; cv=none; b=kjki5V0GGL9VEdMtV18UKjE+kBqSelv/lfTQi6RIgaapK6jG4urzPbwSqeEK8D6EXCQf1E5GNwa519QdMsKhUDN9kpTe4dcJywgILFlh4T1EYlN0PSYMBnA/+Sv/EPB3KIRdgkYE37CWzvYW5Ebh1p5oYaDPxFRIT1U1Nu06mME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772533458; c=relaxed/simple;
	bh=7gRGsOfXp+vSD4RyvC4sKQKt/d2MWjYWE4rMTAnrjQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ltKkmxl6sXpxjfWLFuYjl1JWVZ2xuoAC3GQcrM5W8dFKjscfS4FpVEptmDx2/KuEFcQltrZrk92pOHRtrpmrf4/nMwifhNzoaRxPbjbkrzrzoXPfX0BuB62MQIA/RMXNyhNM+2lJ65jRBUZ5ChyPprNjZcGl929xdV0RfCsrC8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzg5mTbw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzg5mTbw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDFADC2BCB3;
	Tue,  3 Mar 2026 10:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772533457;
	bh=7gRGsOfXp+vSD4RyvC4sKQKt/d2MWjYWE4rMTAnrjQQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hzg5mTbwbNOoPS7VpmoIPbN0EsOdwtZS5PjkYIHoWvTpjMieX+8MqtQMYOiU4PXFJ
	 e7ZColHOFYjTJ2fu5dQCI04EUE9xh4UaWw69MG2ZZSNBOhJzoWMpETy7zdcg0OXEh9
	 h81P0RzwLKnpIi83srJ3NRrJq7Mttthq7IoC/irVZy4SzHw4dLCqiZz6fEa8mlnKU7
	 1Yda6RiPLD8W8xtegF02gTSl0WdP6q4moKkNzxQVD0FQ3PEPikPt7ZajQWI6HqxzKl
	 3eeNyiebQEMD2TUfD6bz9Sdj1BumYYNcAnwQBgwUL2BfFclbv0Q6bs82q8+GQwqtlS
	 eJ0qQZ1M5da0Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05EAEB363E;
	Tue,  3 Mar 2026 10:24:17 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Tue, 03 Mar 2026 10:25:02 +0000
Subject: [PATCH v2 3/5] dmaengine: dma-axi-dmac: Add helper for getting
 next desc
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260303-axi-dac-cyclic-support-v2-3-0db27b4be95a@analog.com>
References: <20260303-axi-dac-cyclic-support-v2-0-0db27b4be95a@analog.com>
In-Reply-To: <20260303-axi-dac-cyclic-support-v2-0-0db27b4be95a@analog.com>
To: dmaengine@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772533501; l=1978;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=ahOiSW4VtsiQwIe3hhYDseeE6OAZGhuM2ZkOpgAjXNU=;
 b=rUwOlZWJthORkrYXkSyfm8b3GChcw1/ZKQfd9NmqFOcnLjurFOH9Y2BFy7CwS81t4oPmeP0Ce
 A+HgbWYs3vZDo4PGnBGXHhjco59lYcw6Qx0samhgsg0cTx3Gp+/C5m7
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

Add a new helper for getting the next valid struct axi_dmac_desc. This
will be extended in follow up patches to support to gracefully terminate
cyclic transfers.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/dma/dma-axi-dmac.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
index 79c01b7d9732..a47e08d3dbbc 100644
--- a/drivers/dma/dma-axi-dmac.c
+++ b/drivers/dma/dma-axi-dmac.c
@@ -227,10 +227,29 @@ static bool axi_dmac_check_addr(struct axi_dmac_chan *chan, dma_addr_t addr)
 	return true;
 }
 
+static struct axi_dmac_desc *axi_dmac_get_next_desc(struct axi_dmac *dmac,
+						    struct axi_dmac_chan *chan)
+{
+	struct virt_dma_desc *vdesc;
+	struct axi_dmac_desc *desc;
+
+	if (chan->next_desc)
+		return chan->next_desc;
+
+	vdesc = vchan_next_desc(&chan->vchan);
+	if (!vdesc)
+		return NULL;
+
+	list_move_tail(&vdesc->node, &chan->active_descs);
+	desc = to_axi_dmac_desc(vdesc);
+	chan->next_desc = desc;
+
+	return desc;
+}
+
 static void axi_dmac_start_transfer(struct axi_dmac_chan *chan)
 {
 	struct axi_dmac *dmac = chan_to_axi_dmac(chan);
-	struct virt_dma_desc *vdesc;
 	struct axi_dmac_desc *desc;
 	struct axi_dmac_sg *sg;
 	unsigned int flags = 0;
@@ -240,16 +259,10 @@ static void axi_dmac_start_transfer(struct axi_dmac_chan *chan)
 	if (val) /* Queue is full, wait for the next SOT IRQ */
 		return;
 
-	desc = chan->next_desc;
+	desc = axi_dmac_get_next_desc(dmac, chan);
+	if (!desc)
+		return;
 
-	if (!desc) {
-		vdesc = vchan_next_desc(&chan->vchan);
-		if (!vdesc)
-			return;
-		list_move_tail(&vdesc->node, &chan->active_descs);
-		desc = to_axi_dmac_desc(vdesc);
-		chan->next_desc = desc;
-	}
 	sg = &desc->sg[desc->num_submitted];
 
 	/* Already queued in cyclic mode. Wait for it to finish */

-- 
2.53.0


