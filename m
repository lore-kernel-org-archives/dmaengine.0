Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332552;
	b=TcwF8N6Hhm7RuiRpsxN1tasiNQMbqa2z6JWx9AkDYlB+V8R+BMIbgxbvkAZjSRnpIReX
	 O+wh7FiQDXLqWQ8H8oIVe1ANZkfwa8fuYMdSz5IcLhkxcdWGSa3T9YI9sCRsEdWl6RAAw
	 PvPE1d147JpAPCKYWgBWshwQGrGVdEdRx5EyJPeNVX4NI53YZjAksxvieAPyjWVajV6rY
	 q0v0DLiAClK34JyAL4cflofisEbLqEWHOVOEfqlFdV00MBa+jAordaEAu4Wf7Imk3ZdPr
	 T5Nj0U18lFax2Dtge54SjnwppU3tecUVwiiK2sIfIZLpA+Zi5uTSfOnWFQi1ibKiGgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332552;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 Subject:X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=BGKy1fe3B25H3qRecCCxyMcVZD9Pdra2OTY7++BZeuY=;
	b=dgYfoCkLgJDn99yfs8AzAD9MSsYpthMUahL0TRK0Cra8lC2ST2WvjeG3c/nXTKDHj48B
	 sPEHbpFnyCo2Ml8I6wQstJ7YyNhngb5IgvPEM4jkfiKeMeCUCMz6AJ3aWOGXI08VEYgty
	 Bi8m/igdw4II2Xxzw/uKCdv2NwQTIr8u0pTDxg9Pnz8tuUQ2pu26EJ1+FGYEiN99GCaSR
	 fQwwJVO+0N+lV3uptESL9sUigOjq3RYTlTepIbqO8DKuhKvzSC97soHrt5m55hR9itzgb
	 CN3FHjHK9Offk81lQzx0tzQcDGw543H9tkD8aWe8OFjRgQZZjuBLIObTxyJD1Xiv4OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=CPYXNIGM;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621ED60A2629;
	Tue, 10 Nov 2026 17:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 621ED60A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=CPYXNIGM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=BGKy1fe3B25H3qRecCCxyMcVZD9Pdra2OTY7++BZeuY=; b=CPYXNIGMZniOT8fJDuxjJmRX56
	SsLF07SqKXd498BYp7QrjdzI6Hix/LnaWjccXFHTO7tgS+Yv0p/OLCKgcPm59hNqzCxcGRmm6H7Yq
	GQRHXwhA2BjaoSvLEdb7qXC5xsYwTtR+t/5ZL6shOiJ3tc4MxGxSpDByvkh20eZCdySx/kdgEq4Vz
	kD6MaG0RbXB2XhiNy8Y6QPQkq3VLXf/PCJzod0Vgmhi2l7d4OEepi+iOCovkywcE3gU9izS1xnjg9
	Qv+WUW5MvuHVoGCNjKWhQfnNi7t+HHotaCCpZ2IkZYViDFipWTWWv1vVU115Wk/tqRg4l1+4FcGTD
	mNlyRj3Q==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xQpra-00000000o8B-2392;
	Tue, 10 Nov 2026 11:42:31 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xQpqg-00000002cVt-2tOD;
	Tue, 10 Nov 2026 11:41:34 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Date: Tue, 10 Nov 2026 11:39:26 -0600
Message-ID: <20261110173927.624629-6-logang@deltatee.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110173927.624629-1-logang@deltatee.com>
References: <20261110173927.624629-1-logang@deltatee.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, logang@deltatee.com, vkoul@kernel.org, sashiko-bot@kernel.org, Frank.li@nxp.com, Frank.Li@nxp.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: [PATCH v2 5/6] dmaengine: plx_dma: use spin_lock_bh() in plx_dma_process_desc()
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

plx_dma_process_desc() is also called from plx_dma_tx_status() in
process context. With a plain spin_lock(), the desc_task tasklet can
run on the same CPU while the lock is held, and spin on it forever.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/plx_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index 83c920eb173d..d1bdff1b7310 100644
--- a/drivers/dma/plx_dma.c
+++ b/drivers/dma/plx_dma.c
@@ -138,7 +138,7 @@ static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
 	struct plx_dma_desc *desc;
 	u32 flags;
 
-	spin_lock(&plxdev->ring_lock);
+	spin_lock_bh(&plxdev->ring_lock);
 
 	while (plxdev->tail != plxdev->head) {
 		desc = plx_dma_get_desc(plxdev, plxdev->tail);
@@ -173,7 +173,7 @@ static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
 		plxdev->tail++;
 	}
 
-	spin_unlock(&plxdev->ring_lock);
+	spin_unlock_bh(&plxdev->ring_lock);
 }
 
 static void plx_dma_abort_desc(struct plx_dma_dev *plxdev)
-- 
2.47.3

