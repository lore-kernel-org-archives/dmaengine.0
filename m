Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332551;
	b=AxQjTtww2yDeeGmYBou0EMXu8SMluvH56V/24cgY84433m4AqN9sHFKabQ3rgif4WX6s
	 VJCqFJqOjdOl8Aq1WPye7Uu3i0UCLLkUzNKAiVc3oeXE2sgp2MJtY6NZLM84b0+Sx6Y++
	 GKh2yndNfQhXUMqesW+NSIk2RiB5JuhotHsuveYsU9xsKj2q3tRWvA7mm0uW1P/a98l4i
	 kBatdDVPwX79mYMWphVKEZgEK6UKstaENrxrlYU0Dwdq5kPoht6ZYyLhkDiueaENLP6q6
	 KmSszTDJrlEgGBywIjUIaNpfOWHuHDJddv+kk4gdWzu4OTnnspqF3pOFsvV1gkB1E7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332551;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 Subject:X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=PFADTOBDL8rf5JChbyPtnWiRVswNPTLPuQAhS3xLOYA=;
	b=f4XzWTYBj2AjCkZbzG7QDZHzErlDtuSsofuLG9oNAtqizLqW1SYrQrrTHLEo/Bq+fvEJ
	 uB8jdmm1ynjJQmnDKVf5HoMsI/8HKtUffVJ6eQpj59/Cvay3+1V8guu5byn8gnO9PwiAf
	 RRm/bXFv2lmmpjoeFSxo5dHQFKCXbGSz1KamvBUhlfjC49cgzvMSGvz9Oazr76xjHrXXE
	 lpgeT9NfukP8xnZ8GffvjrHaFBtnT5Isr/kNiES+67EEUnFDBlj9qyb1BRXYOIU2TzDdO
	 n/xm8UfrQ/Bu0Ykb9IjM1g4yKSAAfelZZmbG4CHL7ohz8SZCXf77U/EQeorlQo6C+kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=AaG8lbfw;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FCE606A32A;
	Tue, 10 Nov 2026 17:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41FCE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=AaG8lbfw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=PFADTOBDL8rf5JChbyPtnWiRVswNPTLPuQAhS3xLOYA=; b=AaG8lbfwGvwmKhJHuJCkiemay0
	eI/hDBdgEGSMlkOWY4Xpqv1/NKC4pJoB91AymHl6CCayQN3k151aAAWNsUOvNvxkxZmbN5PEqfZmP
	fJAa2WUIWGT30QcUA/6wJ7xn9F/hP72DUL+6fBIx01nxBBgFtefgavHwQVjD+rs6Jn5Abbqn2Fdaa
	yor1OBw3iAxgWwj68gBF8ULDUmJeSmbvBULEREO8H84nUzgup8JikHn+OcESzHoJlSTrng03Aj0t9
	FQJz6cN5LE1Zwb5qLG97Ycrke5B/zuPB1f0S47KW+lX9fwoOmJEacqa3dQUVIo6tv6z2T23BmxePI
	fkSNP+UQ==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xQprZ-00000000o7w-0m00;
	Tue, 10 Nov 2026 11:42:30 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xQpqg-00000002cVr-2KlW;
	Tue, 10 Nov 2026 11:41:34 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Sashiko <sashiko-bot@kernel.org>
Date: Tue, 10 Nov 2026 11:39:25 -0600
Message-ID: <20261110173927.624629-5-logang@deltatee.com>
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
X-SA-Exim-Rcpt-To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, Frank.li@nxp.com, logang@deltatee.com, vkoul@kernel.org, sashiko-bot@kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: [PATCH v2 4/6] dmaengine: plx_dma: add dma_rmb() after observing write-back status
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

Completing a descriptor involves two loads that must be ordered:

1. Reading desc->hw->flags_and_size and checking that VALID is clear.
2. Reading the destination buffer, which may happen in:
   a. dma_unmap_page() via dmaengine_unmap(), when a bounce buffer
      is in use.
   b. The client's callback, or its processing after polling with
      tx_status().

On a weakly ordered CPU like arm64, nothing forces load 2 to happen
after load 1, even though load 2 is only reached when load 1 says the
transfer is done. The CPU can predict that the VALID check won't
break out of the loop and issue load 2 early. If the device hadn't
finished writing at that moment, load 2 returns stale data, and when
load 1 then confirms the prediction nothing is redone, so the stale
data is used. This is the load-load control dependency case described
in Documentation/memory-barriers.txt.

Add a dma_rmb() after the status check so loads after it can't be
satisfied before the status read.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.kernel.org
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/plx_dma.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index 1c995f0c4463..83c920eb173d 100644
--- a/drivers/dma/plx_dma.c
+++ b/drivers/dma/plx_dma.c
@@ -148,6 +148,13 @@ static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
 		if (flags & PLX_DESC_FLAG_VALID)
 			break;
 
+		/*
+		 * Don't allow any read of the data the device wrote to be
+		 * performed before the status read above shows the
+		 * descriptor is complete.
+		 */
+		dma_rmb();
+
 		res.residue = desc->orig_size - (flags & PLX_DESC_SIZE_MASK);
 
 		if (flags & PLX_DESC_WB_SUCCESS)
-- 
2.47.3

