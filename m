Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720450;
	b=cFOtkuq4XHbrDPCwrmTLxztY3TMpGqdEJS9DTC+1/XB25ep52Oo9UCRVTTkAXpedJSSG
	 8MqOHxDjlVqF6ukAANIy0RaQtUbR6pma2TK/wtQ9/MUNcLSXu4spTVOrMDo81P9VkUQDY
	 Dl4lXjUUdU/4LvnF/KPIOj/S+5Sc4GvUdfDgMc67EVtqDObiYh1ySLwXtPSe+4AXKGTKd
	 DcTkN2FBCCx9WqiybnkY7gDIn1p5ApjPozxz2x+U0+p0yQ3H4sTCRZ0eLhFbAz/6qEIbI
	 JAKeomyLIQwBW8vZGEuesIHwMrvNGGUB/rMl5fYrZ5pdSwxp9I4m7pfruiuFOWrAU+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720450;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:X-SA-Exim-Mail-From:
	 X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:Subject:
	 X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=v21hwRTix7iirv0Q/IwsR4+XCTEWsHWR9kcUteTP45E=;
	b=lV7fqV1IujLlMFPjCzC+JQcLPW9/UhE/eB+13XYSvkTrzBhl2QfssfoKBy0ilqolZ13j
	 QEyYNFRUclL9iXNmWdnmaayrwJ+plhwDbdWeNbU7DrblBF1zI/WQMTlrTUXWBzh44Gead
	 +9vyqSxNldgk5rwfgyhiXrui7wW8el72Z8DnyACecxh+bWQ8JXwDExO8cqviaghhViDiy
	 Uw2eX8CeGdlfwKvWB1mr1KEuUKKQkudCGl+4fnLL8HLW6o9vUHAJYJ352Sp1k4RXLuYY8
	 s12xPd6hbRc69Rw3Oyra3vLDeDQdgZp7enxN3l7c9oxVyZe6yObZDSGW9567P6/FAiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b="fl3cHV/5";
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAE6606A327;
	Tue,  3 Nov 2026 15:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEAE6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=fl3cHV/5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:Message-ID:Date:Cc:To:From
	:references:content-disposition:in-reply-to;
	bh=v21hwRTix7iirv0Q/IwsR4+XCTEWsHWR9kcUteTP45E=; b=fl3cHV/5hB7p1JCeByr9/+9KoE
	QUqLu/aCO19C2GKPhLoCqSVeGXVOTloBkCGJtF6hYOIGdJtthPZwlPfV5ueJRA/kkWm9gGSBwYj6V
	+rYrFou68eThAZWelMGWVqJRQThofhKA9kCwa7C5nr9ofxnOruZ3fknRENg25mDYYvOtIoWmI/RWa
	PFVxf5u6MT2E7vurHhwhnJUDCaklvbT/hwJyjogzz3IMzVukd1uNBiOH7mCe7mqdua/EtfbHVuo9a
	oOPdG44fZ2hrifDOz240UdBipbx9dy9sBMtlpiecKYuIQdZqWksoX6sKXYRZatBVu9eQ2P0MAw1hZ
	bTAnLONg==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xOGcr-000000091HX-3KUq;
	Tue, 03 Nov 2026 09:40:42 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xOGca-00000001vZY-0ME5;
	Tue, 03 Nov 2026 09:40:24 -0600
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
Date: Tue,  3 Nov 2026 09:40:17 -0600
Message-ID: <20261103154022.459620-1-logang@deltatee.com>
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
Subject: [PATCH v3 0/4] Add sysfs interface to switchtec-dma
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

This patch set adds a handful of sysfs attributes to the switchtec-dma
driver. This is the 3rd version which I'm hoping to get it in now
that my bug fixes and cleanup branch from Sashiko feedback was merged.

The first two patches clean up and generalize the technique that
ioat used to add sysfs attributes to a dma channel. The other two
patches add a couple different sets of sysfs attributes that are useful
in configuring and monitoring the hardware.

This patch set is based on v7.4-rc1.

Logan

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


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

