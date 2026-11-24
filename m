Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535508;
	b=xl79SuH+iaHkzr8gCi7a7DjzBkldqOeVE4lvwYSnE1mGYGW9vkRxkvzadtqmQl9yNCHA
	 d1w/QVm6SM7wy265z5P0mLr4X1fwdYsDu7YpIV2tL7CC6y2U10bn0PUOBhUZzzU7jk+n2
	 u+iFilrJ0F6LR12eBT/u5hqezfAAz/TjEk9rJpMW15CbRHzpEzT++v+/8Q2DbYxrqfUbR
	 hzOucMxdiQeto5l6VGUWds8pM7zkRiJdY+Cw2tLIskb10QEfHuoe5yL/ADOV31Ztz1OyV
	 lOyVB/0LRqd+ogeMrdkdkM/hlGe6/wZl8H4hMsBP8whoqecjefq2XLxiQ6C4GKq/d7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535508;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:X-SA-Exim-Mail-From:
	 X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:Subject:
	 X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=/3ysLOGehL2wy1T7nIUymmIjNN0nr6X8cUbgCSogqf4=;
	b=pd9ePmBMOAb3fbIIiTrCHot1pqOghRE3qsc3jIrgUBNNDUGWe1jAz68uECmhKM7dXJY9
	 HmfTGcD7HTibLQCfaQnGRt/f/pTqLo1LbKcy88dRXWTmaHPpcJQy3ghqgY6SxvNjERCr0
	 WMOgBd6S/SlD7IGrZW9mzRDZXGfZBVIF/M2+nLdXQbKrycOGSsPpwRoFDohKJbzjzg6RC
	 luDgTehfLxrGe+A2sjsh+1RYWCuRL9ACZQt2xbE2aquNISzRUA8mU7EDqYYkqa3C9j259
	 C0AlXx6tgbdn68cakvVThgHXVi37iHTaFK/T9JbG0KiX09MhhpayU1z+aT9U7W5p0+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=I6P8f3GM;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90828606A321;
	Tue, 24 Nov 2026 15:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90828606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=I6P8f3GM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:Message-ID:Date:Cc:To:From
	:references:content-disposition:in-reply-to;
	bh=/3ysLOGehL2wy1T7nIUymmIjNN0nr6X8cUbgCSogqf4=; b=I6P8f3GMMrDRUyddhULt3iSSo9
	NiYC+IbYUepJ44C0mw11xfyGAfP+MuEJ1QdiLzCP/GsWZZTnoMK/up2Su+9dW76LVOOUSm3gMIzSm
	605bO79L7NNFiNZvfbDlBQOBZmeSU+QJrIYpEEvtDRPSf8C4MNBwd65UuiQhBiT1jO5bpGcMKaIlC
	kFMsgybT8mAdl0frf0vDnU27yynTSZp7IX9IhUWeGgxmJ9gbrLqpXygLVzQtSSr/kr0zgmtqezSCl
	yHc0XFEMVFShy98i/SDKENqaQNNVLXUQkms4JxW2svF5TMNSYSZG3JYKb53CEzP9joNB0Hq02X6xs
	mx6Pf9tg==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xVsnz-00000000mbO-0CS0;
	Tue, 24 Nov 2026 09:51:40 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xVsmn-00000003rRZ-2ZSL;
	Tue, 24 Nov 2026 09:50:25 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Dave Jiang <dave.jiang@intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Kelvin Cao <kelvin.cao@microchip.com>,
	Logan Gunthorpe <logang@deltatee.com>
Date: Tue, 24 Nov 2026 09:50:19 -0600
Message-ID: <20261124155024.920403-1-logang@deltatee.com>
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
X-SA-Exim-Rcpt-To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org, Frank.li@nxp.com, hch@infradead.org, christophe.jaillet@wanadoo.fr, dave.jiang@intel.com, linux@weissschuh.net, kelvin.cao@microchip.com, logang@deltatee.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: [PATCH v5 0/4] Add sysfs interface to switchtec-dma
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

This is just a resend with Frank's Reviewd-by tags collected on all the
patches. I'm hoping this can be picked up for v7.5.

This patch set is based (cleanly) on v7.4-rc4.

Logan

[v4] https://lore.kernel.org/all/20261110173137.623764-1-logang@deltatee.com

--

Changes since v4:
 - Added Frank Li's Reviewed-by tags (covers all patches)
 - Rebased on v7.4-rc4

Changes since v3:
 - Added Dave Jiang's Reviewed-by tag
 - Rebased on v7.4-rc2

Changes since v2:
 - Renamed the new channel lookup helpers to use the dmaengine_ prefix:
   dma_chan_from_dev_lock() and dma_chan_from_dev_unlock() are now
   dmaengine_chan_from_dev_lock() and dmaengine_chan_from_dev_unlock(),
   and the dma_chan_from_dev CLASS is now dmaengine_chan_from_dev.
   (Per Frank Li)
 - Rebased on v7.4-rc1

Changes since v1:
 - Replaced the per-channel embedded-kobject approach entirely with a
   new dma_device.chan_groups mechanism that attaches driver sysfs
   attributes directly to the channel's existing struct device
   instead of a second, separately-managed kobject. (Per Sashiko)
 - Fixed the busy-channel check in perf_cfg_store(): it now returns
   -EBUSY instead of falsely reporting success, and the racy lockless
   chan->client_count check has been replaced with a hw_cfg_locked
   flag that's set/cleared under hw_ctrl_lock from
   alloc/free_chan_resources(), closing a TOCTOU window against
   concurrent channel allocation. (Per Sashiko)
 - Took the hw_ctrl_lock around the perf_cfg read-modify-write
   so concurrent sysfs writes to different config attributes can't
   interleave and lose an update. (Per Sashiko)
 - Converted latency_selector_show() from strcat() to
   sysfs_emit()/sysfs_emit_at(). (Per Sashiko)
 - The PCI1008 device ID patch has been removed from this
   series, expanded and sent separately.

Logan Gunthorpe (4):
  dmaengine: add per-channel sysfs attribute groups via chan_groups
  dmaengine: ioatdma: convert per-channel sysfs to chan_groups
  dmaengine: switchtec-dma: add config sysfs attributes
  dmaengine: switchtec-dma: add pmon sysfs attributes

 drivers/dma/dmaengine.c     |  27 +++
 drivers/dma/dmaengine.h     |  19 ++
 drivers/dma/ioat/dma.h      |   6 +-
 drivers/dma/ioat/init.c     |   5 +-
 drivers/dma/ioat/sysfs.c    | 166 ++++++-------
 drivers/dma/switchtec_dma.c | 452 ++++++++++++++++++++++++++++++++++++
 include/linux/dmaengine.h   |   4 +
 7 files changed, 569 insertions(+), 110 deletions(-)


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
--
2.47.3
