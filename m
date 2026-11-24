Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543347;
	b=kLFFgPNiAYrl1Gzg3d8ng2pJyczBclI/5n2c4UDOUbGCaWEBT3nR3KX6tL75HMcPgmwI
	 JrzKlTSXFvsfh3VS2bjUHTF0d6wHwXuBERPHABSc5r6bSKIXGHywuf0MdGqdT7jG2jqnx
	 /VLYAlilqkFYQIQRjEli0CcyYIQ2sXg0vUE1AoGTQpT6xNjO64oglHOmCQnwyPqV2ylu0
	 vHUwAY46YDnpQ3zKHF5Daej30TUwLPX641GrjkUY7IJ8ySdr/Iu54MDhLWuKj9lbCwMFf
	 W3znjeBVP/tUGpWpzb/TdijKoCdNXDv3TreVwYkk9uZGWSzsOEtGekxQPiIQjvBMASQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543347;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:X-SA-Exim-Mail-From:
	 X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:Subject:
	 X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=snUxLrRTCWFDABwTDHIqq3rcay0pbzbSqD9MkrnptO4=;
	b=gQwm4sFa0VufEAp54JNPzAxOAZtKttdRMCFQGcABnyZLpterW+o9ldT9LPk/Q3jmxe49
	 X7zrgaIYwSHPqljRbKJrU9SeAghHenWfHMFU2CNJgNWxNFOQ539ZYGhzBh85Sw+bmqCEz
	 nF8BL5ammRnaJXb61O+gg33HRy+Kfl/kmi1/+WIj99dHZzl4Qj4AM3219n2HasrlPx3Hp
	 wXGSjGou+grBbX+qx/l5juTl5MS21ZlHazK4tIWGVFeMT5poWWgbRMV26WuLyMp5aF0sK
	 Zb+P1SRv9stsUpL4eRzpXTbjnWEgZeoYV5LJylE662dpJl8MrjGQj9G6qV6XgRLwpqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=KqkUmcG0;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B879606A31E;
	Tue, 24 Nov 2026 18:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B879606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=KqkUmcG0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:Message-ID:Date:Cc:To:From
	:references:content-disposition:in-reply-to;
	bh=snUxLrRTCWFDABwTDHIqq3rcay0pbzbSqD9MkrnptO4=; b=KqkUmcG0y0b0zhUoB5cBOvNefT
	9pyJ0QSIr1J9h+lJ3pRNK0EymKf2MUyEOjYanCH/4JhByW0PLv54Qx+aP89xYQoaHAhhAfMQEzOjJ
	AdrkdjgUNc9+/oSbrw0cS3JEWGyIn2/bUwyCT2U49zDNjJ8lE6nEkGRz9DfgJ5aD9chYqa4qsXaqa
	XbyyvagjehzMlj71jgKwtOUCX5g+6nIf2QAWlg2uJWmznbLi1cpc5oIksv+J6Wc2bGbcNdaSd+gpw
	2/v2Jh3zQ7sPcb4hzuf45u3nU0en6Qkzs+O8ysDupgp9v92KujC0NN2q01Q4mLC1o5EekPoOFIPuG
	+x0aL5eQ==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xVuqW-00000000oKW-3IVM;
	Tue, 24 Nov 2026 12:02:25 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xVupj-00000003ruw-3WgK;
	Tue, 24 Nov 2026 12:01:35 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Logan Gunthorpe <logang@deltatee.com>
Date: Tue, 24 Nov 2026 12:01:26 -0600
Message-ID: <20261124180132.922222-1-logang@deltatee.com>
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
Subject: [PATCH v4 0/6] plx_dma fixes
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

This is a rebased version of my plx_dma fixes series with the review
tags from Frank.

Also, this series is not a high priority to me, I'm just trying to
fix Sashiko warnings. If there's spare review bandwidth I'd prefer
the time spent on my other series[1].

This series is based off of v7.4-rc4.

Thanks,

Logan

[v3] https://lore.kernel.org/all/20261117165135.746241-1-logang@deltatee.com/
[1]  https://lore.kernel.org/all/20261124155024.920403-1-logang@deltatee.com/

--

Changes since v3:
  * Added Frank's Reviewed-by tags (covers all patches)
  * Rebased on v7.4-rc4

Changes since v2:
  * Add Fixes tags to the patches that lacked one (per Sashiko)
  * Reuse plx_dma_free_desc() in the plx_dma_alloc_desc() error path
    instead of open coding the same cleanup (per Sashiko)
  * Rebased on v7.4-rc3

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

 drivers/dma/plx_dma.c | 98 +++++++++++++++++++++++++++++++------------
 1 file changed, 71 insertions(+), 27 deletions(-)


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.47.3

