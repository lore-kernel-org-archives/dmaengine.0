Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332550;
	b=eNzubYDuUS4V2Ihu0XKC8iHHsY0MyZnUZFLQxbo9GRCpcoo98Ipe6CIi1CCvmJi48uEp
	 pRKH+xIfVgourxYYblNKCuI6Y7gTQ1+bdGq1cgxOdOymz6sMoTTpTptTBlzTw7b4tid8i
	 OcEAQmIuBuGjUEnaUNA8y6Y443kZOYyxFPRqqWwlnDjquM7JsuNQdhU7cT7qMqINluSMP
	 kL23Dt1TqrEjFAqfO+MtY8CBiDZYOewPXotCyceXv4nOKFRI5qi1ZGiWtwfPPdV/bYFiE
	 5huT/pEKWbd+tKDRZnrjTY2zWuKwkhSLjvLAEU/9ug2I4Ez/d5PRE/kwGagueh5NvjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332550;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 Subject:X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=0mvfYA5E5kiXWdwbaCt3VlP/rLWvcAc/MR2jWi8WeSI=;
	b=OTK+EM4dstoSPRitT9pyTFi09GhSf2xkGzPthksIzBQ1UQvlyWuOeSQWfZNOJoYtzACT
	 pcEc/KfPb0ErRLqaHxS3G1yNCSsLi7YhHVT4P8DGxrf698ZJbEoP8eHMCoIUF8lCNKOjV
	 01UEtQZMZ9qiLXR7XDRLy5oyMA40xCjXxkod05mY3snFvYjRRNJ4HyjDgjDeXSJ1Q/jfj
	 WLpSmYqnuc3I/m/K88KNBSE4x5/yUDt3bHVoDKyENLwHYnNURYMFehO+wP6NHwJ6u7svF
	 OPblwDZXgkDVFG7X4jp5ghmCrO3T1ehOg4I4UBx6MMk2UCT7FDsF/mPvAOC5882Dj5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=fpvOLsl4;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20F760A260E;
	Tue, 10 Nov 2026 17:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C20F760A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=fpvOLsl4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=0mvfYA5E5kiXWdwbaCt3VlP/rLWvcAc/MR2jWi8WeSI=; b=fpvOLsl4twxyXOlkiOxmxt60uW
	UneHrnERy7JbdvaS3MKf8tPLuHZAwENgvNFzmac5XblGogssDlGKSfpusQO0PdjIU9cL+1IB+p746
	uK8Q7JlCew3wxXSwpoBan0XKcPlILFlnnbgZu5TawhoPDyxZs2Di9B3SZf1jbDf4KPsYrnk5+v0tN
	AFlAhTEuyecRjTdbm4pXjZnys/u44ohoUYrHiMLjnC9lQp4VRjDPHefjPcqfICLnMlmNVNfzsS6z7
	E+BaXwurtbHayZ/u0f798fBD+jzZyGCgEsDHESJm4l3YHrlhCAUBaQ4t9/QY7gbCPJOkUI98UMF+Z
	kdWTOe6Q==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xQprY-00000000o7j-0X7R;
	Tue, 10 Nov 2026 11:42:28 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xQpqg-00000002cVp-1hLJ;
	Tue, 10 Nov 2026 11:41:34 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Date: Tue, 10 Nov 2026 11:39:24 -0600
Message-ID: <20261110173927.624629-4-logang@deltatee.com>
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
Subject: [PATCH v2 3/6] dmaengine: plx_dma: use writel() for the 32-bit PLX_REG_CTRL register
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

plx_dma_issue_pending() writes PLX_REG_CTRL with writew(), but it is a
32-bit register and every other access uses writel()/readl().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/plx_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index bfccbb0c70e8..1c995f0c4463 100644
--- a/drivers/dma/plx_dma.c
+++ b/drivers/dma/plx_dma.c
@@ -351,7 +351,7 @@ static void plx_dma_issue_pending(struct dma_chan *chan)
 	 */
 	wmb();
 
-	writew(PLX_REG_CTRL_START_VAL, plxdev->bar + PLX_REG_CTRL);
+	writel(PLX_REG_CTRL_START_VAL, plxdev->bar + PLX_REG_CTRL);
 
 	rcu_read_unlock();
 }
-- 
2.47.3

