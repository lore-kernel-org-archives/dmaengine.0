Return-Path: <SRS0=jDKn=SO=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1BEC10F14
	for <dmaengine@archiver.kernel.org>; Fri, 12 Apr 2019 05:29:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C343218C3
	for <dmaengine@archiver.kernel.org>; Fri, 12 Apr 2019 05:29:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="WE75mUwQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfDLF3V (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 12 Apr 2019 01:29:21 -0400
Received: from de-out1.bosch-org.com ([139.15.230.186]:45928 "EHLO
        de-out1.bosch-org.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbfDLF3V (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Fri, 12 Apr 2019 01:29:21 -0400
Received: from fe0vm1650.rbesz01.com (unknown [139.15.230.188])
        by fe0vms0186.rbdmz01.com (Postfix) with ESMTPS id 44gRKB0FHwz1XLFjb;
        Fri, 12 Apr 2019 07:29:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=2015-01-21; t=1555046958;
        bh=NJEzbVtRLgM7qYE9X5B0j8kwymv1uaTDWBadZxvwBis=; l=10;
        h=From:From:Reply-To:Sender;
        b=WE75mUwQ6u+OG10zZWrXbg4eEosvKTPifWdS3h0L8dJKrPwM3ZNiFzbztdNXIpMr+
         O+pspRCZA68jq3YCXZSHqOsUUuVDtG0s6dNmINFKPtHPGvMy0WOVoEpaAnHT3aKkIs
         qB528agiUc5JpcOi3HeWPr4IORTfdY572TgErd+8=
Received: from fe0vm02900.rbesz01.com (unknown [10.58.172.176])
        by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 44gRK96ymqz1C8;
        Fri, 12 Apr 2019 07:29:17 +0200 (CEST)
X-AuditID: 0a3aad0c-d19ff700000039d6-b3-5cb0222d7993
Received: from si0vm1950.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by fe0vm02900.rbesz01.com (SMG Outbound) with SMTP id 7A.C9.14806.D2220BC5; Fri, 12 Apr 2019 07:29:17 +0200 (CEST)
Received: from FE-HUB2000.de.bosch.com (unknown [10.4.103.109])
        by si0vm1950.rbesz01.com (Postfix) with ESMTPS id 44gRK94S45z52K;
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
Subject: [PATCH v3 1/2] dmaengine: sh: rcar-dmac: With cyclic DMA residue 0 is valid
Date:   Fri, 12 Apr 2019 07:29:13 +0200
Message-ID: <20190412052914.16006-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.34.218.219]
X-Brightmail-Tracker: H4sIAAAAAAAAA22Sf0wbZRjHeXtHOToOj4PBs46y0WhM6sAWNDnmNEuMsXEm/mD+oWniyjho
        I23JHWCZGglzrm0glm1V246WmOGUX0KBDYjLpAQyDOiGZGZLVwcB7WBbqoiMKOCdhdE//O+5
        7/f5vM9z3/clMDqaJCeM5iqWM+srlFIZLtvfqcjLU3br1OeX8ph211oi0+w9hZiLN/KZhZEh
        xDTVh3Cm/859CXNrfB/T0jOLmMHQFYyZafBKmeVLS9KDO7RNk3lar82dqA202aXa3sUIpv3t
        pxWp9q+JJly7FMh5Nekt2YFStsJYw3JPPndEZuj/YyCpMkxaR36el9Sh4R0ORBBAPQUjn7/u
        QDKCptwS+GfjLOZAycJHBwJ7myVmdCPY+OF+kmhIKRUMOm3/1RnU47B2awoTmzDqYwyiU98m
        ikY6dRj+brmEiRNw6jH4MXBQlEnqAHRFQlKxBmoPfNrukMT0NBh3z+FijQn68X4vFqsBhiMR
        LNafCx2ewUQnesQTh3jiEE8c0oKwNpRZxqprTOqCIrU6nyth+WNqTf5RiymAYleQMoBGz5UH
        EUUgZQo5Ju/W0Yn6Gr7WFERPExLlTvLdtW90dGqJpbTWoOcNb3PVFSyvlJPZV1/S0ekPZb66
        xGTkeaPFHERAYMoM8jAucGSpvvYYy1liWBDtJnBlFllOvKKjqXJ9FfsOy1ay3Jb7DEEogfxw
        r7BDGseWs9YyY0XVlq1UkCghIYHOjHfix0qI5CAqJFKE2cN7hCNIvlJv4o3lm/iuGE5vqdvo
        9+h5YubEUjNG42aLmZVnkb+KPCV2GqrNDzeQZ5MJ8z4dvTPO2D5lAd1AQobpJBL3TxFe+vZs
        IHeLcaVtittQQavAUNcIGJg7heBc4ywC38AyAlfjbSlMDXmSYP1CPQF/9rkJWPV5CZjonSRh
        2baeCn3+OgoCK34KwtEeGuwdQxkQto1mwfT8cjYsbIwq4O7iuAJ8zs9yYLr3bA6E1wb3wmXX
        Si746vtUEPr9FxW4WlefgND1SB6EPWc0cHM9pIFw46oGAmOuAqj/pKsAupynCxeEYCVCsGf2
        tYvBVumr/ifYTXX77+R1SFU52XkyP+1FzfsPVBFHnbHFHm28+929KdVpKE2+s4KOuj6Y6N51
        fMSWWXSxOGR5VkGNdfqjWTPWK48WFzjfsDW813zyy/3Wj8wvZ87iF6Lc1RN+9+0jdtk8w6Wn
        lk3POhYPfVVx+QvcWpRbfK+h9SaX0LP+wnW9v/DB3Jvnr732tRLnDXqNCuN4/b9suCy6gwQA
        AA==
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
Message-ID: <20190412052913.-nEhjuuVwfbAt7P9gc4igklrTnfujMZr43tk_XSk81c@z>

Having a cyclic DMA, a residue 0 is not an indication of a completed
DMA. In case of cyclic DMA make sure that dma_set_residue() is called
and with this a residue of 0 is forwarded correctly to the caller.

Fixes: 3544d2878817 ("dmaengine: rcar-dmac: use result of updated get_residue in tx_status")
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
Signed-off-by: Achim Dahlhoff <Achim.Dahlhoff@de.bosch.com>
Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Signed-off-by: Yao Lihua <ylhuajnu@outlook.com>
Cc: <stable@vger.kernel.org> # v4.8+
---
Note: Patch done against mainline v5.0

Changes in v2: None

Changes in v3: Move reading rchan into the spin lock protection.

 drivers/dma/sh/rcar-dmac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 2b4f25698169..54810ffd95e2 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -1368,6 +1368,7 @@ static enum dma_status rcar_dmac_tx_status(struct dma_chan *chan,
 	enum dma_status status;
 	unsigned long flags;
 	unsigned int residue;
+	bool cyclic;
 
 	status = dma_cookie_status(chan, cookie, txstate);
 	if (status == DMA_COMPLETE || !txstate)
@@ -1375,10 +1376,11 @@ static enum dma_status rcar_dmac_tx_status(struct dma_chan *chan,
 
 	spin_lock_irqsave(&rchan->lock, flags);
 	residue = rcar_dmac_chan_get_residue(rchan, cookie);
+	cyclic = rchan->desc.running ? rchan->desc.running->cyclic : false;
 	spin_unlock_irqrestore(&rchan->lock, flags);
 
 	/* if there's no residue, the cookie is complete */
-	if (!residue)
+	if (!residue && !cyclic)
 		return DMA_COMPLETE;
 
 	dma_set_residue(txstate, residue);
-- 
2.20.0

