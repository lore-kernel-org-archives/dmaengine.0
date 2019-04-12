Return-Path: <SRS0=jDKn=SO=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FF1C282DA
	for <dmaengine@archiver.kernel.org>; Fri, 12 Apr 2019 05:29:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6EF8F2186A
	for <dmaengine@archiver.kernel.org>; Fri, 12 Apr 2019 05:29:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="J2mV8LFu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbfDLF3V (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 12 Apr 2019 01:29:21 -0400
Received: from de-out1.bosch-org.com ([139.15.230.186]:57200 "EHLO
        de-out1.bosch-org.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbfDLF3U (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Fri, 12 Apr 2019 01:29:20 -0400
Received: from fe0vm1650.rbesz01.com (unknown [139.15.230.188])
        by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 44gRKB2p6fz4f3kZG;
        Fri, 12 Apr 2019 07:29:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=2015-01-21; t=1555046958;
        bh=uzfkAeBUABvAjefBm6TuwCwstgh+jM8v7OZAw7mZ6fo=; l=10;
        h=From:From:Reply-To:Sender;
        b=J2mV8LFuhYrstXhPIue5xrzztMvrBE4Ps1OBn6et8bI/6GLKSgDTLrW2b7Ptgrmb0
         Ay7l4Th8QVoPzCbvI3UgkDqkVOwal8+wikg3BlZZpHamhwsEhHdqty1YWIPiy3/0Xn
         QvERbWf8hqZL8TIhAS1kwoxPsdThKyNl5jiTVr8c=
Received: from fe0vm02900.rbesz01.com (unknown [10.58.172.176])
        by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 44gRKB2Rdkz1C8;
        Fri, 12 Apr 2019 07:29:18 +0200 (CEST)
X-AuditID: 0a3aad0c-d01ff700000039d6-b4-5cb0222d6f5e
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by fe0vm02900.rbesz01.com (SMG Outbound) with SMTP id 4B.C9.14806.D2220BC5; Fri, 12 Apr 2019 07:29:18 +0200 (CEST)
Received: from FE-HUB2000.de.bosch.com (fe-hub2000.de.bosch.com [10.4.103.109])
        by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 44gRK96Rfzz6CjZqg;
        Fri, 12 Apr 2019 07:29:17 +0200 (CEST)
Received: from HI-Z0EVG.hi.de.bosch.com (10.34.218.219) by
 FE-HUB2000.de.bosch.com (10.4.103.109) with Microsoft SMTP Server id
 15.1.1713.5; Fri, 12 Apr 2019 07:29:17 +0200
From:   Dirk Behme <dirk.behme@de.bosch.com>
To:     <linux-renesas-soc@vger.kernel.org>
CC:     <dmaengine@vger.kernel.org>, <vkoul@kernel.org>,
        <geert+renesas@glider.be>, <niklas.soderlund+renesas@ragnatech.se>,
        <laurent.pinchart+renesas@ideasonboard.com>,
        <Achim.Dahlhoff@de.bosch.com>, <dirk.behme@de.bosch.com>,
        <yoshihiro.shimoda.uh@renesas.com>, <ylhuajnu@outlook.com>,
        <hiroyuki.yokoyama.vx@renesas.com>,
        <kuninori.morimoto.gx@renesas.com>, <stable@vger.kernel.org>
Subject: [PATCH v3 2/2] dmaengine: sh: rcar-dmac: Fix glitch in dmaengine_tx_status
Date:   Fri, 12 Apr 2019 07:29:14 +0200
Message-ID: <20190412052914.16006-2-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190412052914.16006-1-dirk.behme@de.bosch.com>
References: <20190412052914.16006-1-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.34.218.219]
X-Brightmail-Tracker: H4sIAAAAAAAAA22Tf0wTZxjHeXv9cS09dz1++NjaMS+yDaasMpcc6NwWk6UzS7YEsmSu2zzk
        LHW0Zb2C4j8yNglDnWDQhTZ2GmVOGAFhOCCIUqgDJ4jg4tjqiExn6RSQxq1mwe5Ki/SP/fd9
        n+f7eZ/n/V4Ox6j9uBo3WeyczcIW0lKFWJHdpF2bQbcYdN1liGk8Mi9hjjkPI+aH8QzG39eF
        mJpyr5hpn5oWMTcH1zDHz04iptM7gDG3DjilzMPzAelr8fqaobV6Z2WdRN/a8IVU3/aXD9Pf
        HftHqv/7So1YH2h9+h3ZVsXGfK7QVMLZXty0TVHQ2/VYUjSbvPv7MTcqQ51UFZLjQK6HP84M
        S6qQAqfIOhEED30ZPVxAMFV/UhY5tCAIDU/LwoiUTIfO6soFnUg+B/M3R7GwCSMrMJgd7ZaE
        GwlkDjROzIrDWkymQt2hwwuaIDfC+aYBLDI7BY42VonCWk6+AhV9ngUPJXiars9F/SoYrLu9
        oDHB/1m7E4togF6fL3rPKvjO0SmpRipHDOKIQRwxyHGENaDkHZyuxKzLzNLpMmx5HL9Hty5j
        u9XciiJfR9mBPKeMbkTiiFYSl9QtBkrClvClZjd6GRfRScSu+WYDtSzPml9awPIFH9mKCzme
        VhMrR7YYqIQnZb44z2zieZPV4kaAY3QikSsWOCKfLd3D2awRzI00uJheThjxtw0UaWTt3Mcc
        V8TZFrsbcJwGYu8zwg4qG2fkdu8wFdoX27SWQHFxcVRybCd2rAiXu9FLuFKY3ZsiXEHwRayZ
        Nxmj+IoITi1Wl9DLaDN+a1/gGEaJLVYLp15O/BnmybCzoNjyZAP1SiLujstAJcU0lm7xo3Ek
        ZJhAoPD+SuEnWJoNhCYclypaXIIy6wWGrFbAqYOTCFwdDxFMtN8Twb4b1WK4/PlBGYx2OWTw
        yOXEYdw1g4Pv96tyuDA0Joe2nv3xcKVtiABfT/lTMPFomoRQxREVuB6XUzA5cy0BLrq6E8HR
        XJ8EwzeGksEbuK6GwKBXDb+5+zQwcG9QA8G5eQ34Qx4tfDv/Ywq4ujw03D5xYjWEPL+mQqD5
        9LPwS93kC34hWJEQbO2axnCwdtb+P8FGq0uvU5eh2hFy4v6Kb05vGvH254wF5l7X9pfag/Td
        s6KsJsu5kC/p0+zUKf7rvZk1aeydf9/cfLHsg3PxU6sraxt2Bt/reZDWYrcp73847tfh3BtX
        M89si38/J/1S7rvunyt3rsp+C321bIZdf22LqV/SEcz9acP2fvmuFF3Wga3PP9C+mnaS+cRO
        i/kCdl06ZuPZ/wCfBkhqngQAAA==
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
Message-ID: <20190412052914.ReJCq5zc8BsckEvN2ywvu26UdL7dD09pA_KMDHqH33I@z>

From: Achim Dahlhoff <Achim.Dahlhoff@de.bosch.com>

The tx_status poll in the rcar_dmac driver reads the status register
which indicates which chunk is busy (DMACHCRB). Afterwards the point
inside the chunk is read from DMATCRB. It is possible that the chunk
has changed between the two reads. The result is a non-monotonous
increase of the residue. Fix this by introducing a 'safe read' logic.

Fixes: 73a47bd0da66 ("dmaengine: rcar-dmac: use TCRB instead of TCR for residue")
Signed-off-by: Achim Dahlhoff <Achim.Dahlhoff@de.bosch.com>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
Cc: <stable@vger.kernel.org> # v4.16+
---
Note: Patch done against mainline v5.0

Changes in v2: Switch goto/retry to for loop

Changes in v3: None

 drivers/dma/sh/rcar-dmac.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 54810ffd95e2..e2a5398f89b5 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -1282,6 +1282,9 @@ static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
 	enum dma_status status;
 	unsigned int residue = 0;
 	unsigned int dptr = 0;
+	unsigned int chcrb;
+	unsigned int tcrb;
+	unsigned int i;
 
 	if (!desc)
 		return 0;
@@ -1329,6 +1332,24 @@ static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
 		return 0;
 	}
 
+	/*
+	 * We need to read two registers.
+	 * Make sure the control register does not skip to next chunk
+	 * while reading the counter.
+	 * Trying it 3 times should be enough: Initial read, retry, retry
+	 * for the paranoid.
+	 */
+	for (i = 0; i < 3; i++) {
+		chcrb = rcar_dmac_chan_read(chan, RCAR_DMACHCRB) &
+					    RCAR_DMACHCRB_DPTR_MASK;
+		tcrb = rcar_dmac_chan_read(chan, RCAR_DMATCRB);
+		/* Still the same? */
+		if (chcrb == (rcar_dmac_chan_read(chan, RCAR_DMACHCRB) &
+			      RCAR_DMACHCRB_DPTR_MASK))
+			break;
+	}
+	WARN_ONCE(i >= 3, "residue might be not continuous!");
+
 	/*
 	 * In descriptor mode the descriptor running pointer is not maintained
 	 * by the interrupt handler, find the running descriptor from the
@@ -1336,8 +1357,7 @@ static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
 	 * mode just use the running descriptor pointer.
 	 */
 	if (desc->hwdescs.use) {
-		dptr = (rcar_dmac_chan_read(chan, RCAR_DMACHCRB) &
-			RCAR_DMACHCRB_DPTR_MASK) >> RCAR_DMACHCRB_DPTR_SHIFT;
+		dptr = chcrb >> RCAR_DMACHCRB_DPTR_SHIFT;
 		if (dptr == 0)
 			dptr = desc->nchunks;
 		dptr--;
@@ -1355,7 +1375,7 @@ static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
 	}
 
 	/* Add the residue for the current chunk. */
-	residue += rcar_dmac_chan_read(chan, RCAR_DMATCRB) << desc->xfer_shift;
+	residue += tcrb << desc->xfer_shift;
 
 	return residue;
 }
-- 
2.20.0

