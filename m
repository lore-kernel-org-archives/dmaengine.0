Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934355;
	b=jTME8T8WKv9ntJeiFpyQH5JpFl/D8+1BmJLpGZsF0WLPMQfyhxfUHJD2qmTImVmvqrDH
	 zAyCBotr4V3C+dTovkKJ0ZG/yFY3q/Asrqo8XfVksEG41h8wvPXVG4H8RNttafSk+hvdb
	 0Wpn9qtOFvliuqkOyIhrx6/tYOIjW2//d6IoJb5cR3iip4KRGKVu0BebVTMOd0AvNlyee
	 Ief+L3javtTXn0BLXyOOuzVodBKYNeX711sK/8d/X9Fx7yWSxBt7lX2gG3/xrZttvowN2
	 D7bOQZNj8XRZGwKhx/1cNjfQ5taNxt3PaJsxUx+JkxWkVpYGV80/HaxynIp0dQMxwDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934355;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:X-SA-Exim-Mail-From:
	 X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:Subject:
	 X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=FzQmjS6RLke2XxoLVvQnwac00GP8pR+DgJBWSngjMMQ=;
	b=xQL6vzhJQBO8kJ2dzBwdSOWxMP1UvnCv7XQSZfZaJ62HV8wk2gUXFEVimd+QdRI4qzZD
	 Zi/N5mL6Hy/7khLC0c7gJJIKqr60aFAJde7epSHPJuRJBGr2LTu05ZxC1xMX2C/Uk35I0
	 rvkpC949BAjpxMVYTAcyBCRmT5+4TmlI+Q7AqlOh6I2MpLjGwjW6Q7P/3MPkidyUeRSbv
	 5fn89GOewTWxThuFKVDB+e8/l6ipeXYnJkl98uBjj28tOx99VlEdPUPB9wbAmhkheEeYL
	 Hr3GJJBu+FyGZQrVQfp9M83zXfUneBtUvzE55eQLRrMWL8uUy7h+4jxhpIuWA/JVPkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=PdWnFYpp;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770B5606A32F;
	Tue, 17 Nov 2026 16:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 770B5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=PdWnFYpp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:Message-ID:Date:Cc:To:From
	:references:content-disposition:in-reply-to;
	bh=FzQmjS6RLke2XxoLVvQnwac00GP8pR+DgJBWSngjMMQ=; b=PdWnFYppVAWMEDLbzdHQ5EkrOa
	u0h8z8CyJ+L4X1i+WsyBRntaow/Hi9FoEgpdQT+WGcdwxu+jlGPsdB2KwfopDl/piTWOV9fm/cGxK
	NDB8LF53V2/YYN4Ret/QA271GULEAqDjBZ14Jf8jP2peOxB2+6chDKfGpDdpD60i/WD3xiykLo2tF
	GMXuniEz2OKB4nTQju5IIKR4j6patMoLObfqt0zBZ8DsBEjcA6O/xW7VnYmyLT6tPl5gTLTX5gdD+
	BfrAxr3wfpRXbcF8Whvb1RgLK4KPau7/1w6FXiuvGUmNlgxOqHQBAvCZEdJGVoPhb0Xu6g4ZJ7Qm6
	/hzZp0Jw==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xTMPy-00000001R8H-2aGV;
	Tue, 17 Nov 2026 10:52:27 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xTMPB-0000000388X-0fgB;
	Tue, 17 Nov 2026 10:51:37 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Logan Gunthorpe <logang@deltatee.com>
Date: Tue, 17 Nov 2026 10:51:29 -0600
Message-ID: <20261117165135.746241-1-logang@deltatee.com>
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
Subject: [PATCH v3 0/6] plx_dma fixes
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

This is v3 from my series last week. It uses the new plx_dma_free_desc()
helper in one more place and adds fixes tags through out.

Also, this series is not a high priority to me, I'm just trying to
fix Sashiko warnings. If there's spare review bandwidth I'd prefer
the time spent on my other series[1].

This series is based off of v7.4-rc3.

Thanks,

Logan

[v2] https://lore.kernel.org/all/20261110173927.624629-1-logang@deltatee.com/
[1]  https://lore.kernel.org/all/20261110173137.623764-1-logang@deltatee.com/

--

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


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.47.3

