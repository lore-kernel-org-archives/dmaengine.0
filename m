Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332547;
	b=pm8s1b+UVd6tz8i5N6cyL7BTXObYOzrk+JilWogSskxF2tZgN7dPST5W/bw5iNfCpxSS
	 cWCCqmLsDJXcnACbdULXJ59KgkOn3XlQ/shKsIwO5/l3lEh/Dis03JXrPkSf3jOXEBAyO
	 YEl0HDazlfRvTLAwFfuyUb4UMhaN0IAs60rmEN+rEqs/ko7BlzxInF3LA3r6ZifJwVVid
	 YAcT3N6on9RvaIQe8dcn37MpXKhNsyiThYBQ0QPKref1/AhSIVhtHv71yEmvriMKZp4L9
	 LUCLBXnK/tLHQf4+/Pq3i+1AeXE4QRr1nUroRGOs8CRhxqDUkTIZI7Q0qGyQ8CdLPPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332547;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:X-SA-Exim-Mail-From:
	 X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:Subject:
	 X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=RnfwxMikUC0UtSTBV3H3pNVkjpTTbo1qY6oOlvX7a8s=;
	b=H93IDY43hNIPMTz1CPq+OsbdGx3r0q8NHt3MfWSHvRBHcAKso9d9D13fSVyuapEogKGu
	 wrs80hxYdNseO83EWOdJ1OMGfxHgEsd+erXWWb3W64sfCYcQy8G0IJvd72zZAD1syyAKb
	 yt812p5gOaygaNdEEeGBN67N0jl3B/+x7YzKgvQdZ0GRVvOs29xKKQlTJZHSfAaPm15Cl
	 C4XiJ3/rFsGhDXht8FE+Hf/kjba2sVZGgwUdngDOfrs7hOc0SvDXW9rHiMc0ySbxvPuAY
	 E0gG9s1S7sVQ7sqDYXk7s4IDHXxaEigO1lgHFg9BV9MziMwizh/tWyzvNfTQBHEeUzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=V8L50zFP;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9364606A31C;
	Tue, 10 Nov 2026 17:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9364606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=V8L50zFP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:Message-ID:Date:Cc:To:From
	:references:content-disposition:in-reply-to;
	bh=RnfwxMikUC0UtSTBV3H3pNVkjpTTbo1qY6oOlvX7a8s=; b=V8L50zFPjsORH8bpLrbq9ab+9z
	vUgnBLVumAIYBB6BvWb6PeeYFQMIcPxA+HMaQaDBjqVMCF9nNyMp2ZE1QIOgk4Xq1ll7/GnQHRKE5
	mUafhXfsHWopgQzqEQhpmdvQZnWNPZ6YRII10r7jipuTA4T4ZoL0UwSLm3gBbeWLjufpRAB4M2Xm8
	WzOKlZNd1QuvuyqYujrLL24nh5t+ShBmfGM1gVQT2vPEdrWVhEOw6vbA6biy4TtK4QNdRTmbE25fJ
	an6DpZ6kIkRCXNKPEU4Fuw1/Xm1ct2+HVMmSTdVkzlQzc6M//l3pvwpTeixPvHu2XP6QHGFZ0gY7w
	iYCmZirw==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xQprU-00000000o78-2M3M;
	Tue, 10 Nov 2026 11:42:25 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xQpqf-00000002cVj-47bt;
	Tue, 10 Nov 2026 11:41:34 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Logan Gunthorpe <logang@deltatee.com>
Date: Tue, 10 Nov 2026 11:39:21 -0600
Message-ID: <20261110173927.624629-1-logang@deltatee.com>
X-Mailer: git-send-email 2.47.3
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
X-SA-Exim-Rcpt-To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org, Frank.li@nxp.com, logang@deltatee.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: [PATCH v2 0/6] plx_dma fixes
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

This is v2 from my series last week. It fixes a bug Sashiko found,
updates the commit message of the dma_rmb() patch to better explain
the issue, collects Frank's Reviewed-by tags and rebases on the latest
rc2.

Also, this is series isn't high priority to me, I'm just trying to
fix Sashiko warnings. If there's spare review bandwidth I'd prefer
the time spent on my other series[1].

This series is based off of v7.4-rc2.

Thanks,

Logan

[v1] https://lore.kernel.org/all/20261103155202.461725-1-logang@deltatee.com/
[1]  https://lore.kernel.org/all/20261110173137.623764-1-logang@deltatee.com/

--

Changes since v1:
  * Serialize descriptor completion with a new complete_lock so
    callbacks stay in order and can't still be running after
    plx_dma_free_chan_resources() returns (per Sashiko)
  * Expand the commit message and comment for the dma_rmb() patch to
    explain why the barrier is needed (per Frank)
  * Collect Frank's Reviewed-by tags
  * Rebased onto v7.4-rc2 (no conflicts)

Logan Gunthorpe (6):
  dmaengine: plx_dma: don't call pci_irq_vector() under rcu_read_lock()
  dmaengine: plx_dma: fix descriptor ring leak in alloc_chan_resources()
  dmaengine: plx_dma: use writel() for the 32-bit PLX_REG_CTRL register
  dmaengine: plx_dma: add dma_rmb() after observing write-back status
  dmaengine: plx_dma: use spin_lock_bh() in plx_dma_process_desc()
  dmaengine: plx_dma: don't invoke client callbacks with ring_lock held

 drivers/dma/plx_dma.c | 94 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 70 insertions(+), 24 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.47.3

