Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C513B14C1;
	Mon, 27 Jul 2026 18:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=204.191.154.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785178143; cv=none; b=drvUb+DyVOgImh7FAfIR2kxgvgYEwTnvrnPCHzPNPOOf4rtlXvNwBMwJTMSsJDBvwz/hAJh7EOdcMGPZ70xkPuo3bIQan8RwEv/6Gz7qHb9xCO/MP/s7aC9tP/Nav7z1GzwUw2mo/X5mZguJDhaFOHvwQgQr5oNxFbU9fVMCJ1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785178143; c=relaxed/simple;
	bh=2JEqGmA4tHSuba2iuGsO4ITcEuAdfrGAT0FEusBWMIY=;
	h=From:To:Cc:Date:Message-ID:MIME-Version:Subject; b=nYpSeVWCkYbVB4mWJOOea6I6k2mpFYYPeRW/WXwwYSFKN+iAbYaGZ/WsweKR0g+7ikyw3BSkptkjG9KaDTH2jL1PRunoavXSQg7qx7n5og+Iy/iJBN9smoyVQSbwZLmERoLhsjAxj7PMSds9c5amHKVgs+RGxWhVraKH4LbmF+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com; spf=pass smtp.mailfrom=deltatee.com; dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b=a8NPqOSG; arc=none smtp.client-ip=204.191.154.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b="a8NPqOSG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:Message-ID:Date:Cc:To:From
	:references:content-disposition:in-reply-to;
	bh=yV0n5q6iXWwRzq8UCxvjNG14f3Oo0bkKlykWBoUjzX8=; b=a8NPqOSG2AqsMrEz+JJlNwVJJ0
	iQU2Rz9DlcdCKBfjrxwyponaYxx622pZuJ1u/aBR8vyKGibYLONtHVYJUpdBKmsNfSbsH62dHCvNx
	j7xXpSQksCm6mv7xHvlZpod1KzX59F2xDpe1/Iu8Ep0MR+85i3rgc3RLQKNfA2agZz/g24gDAEnrv
	Ug9mBup4vahrVx1eDQDMvsFm+pJwWJWIpm05ouT7YXI5kskao72Txv2g0Sdfwkmq7cfLAuEB6yW64
	EUvwNHb7xbYhGWT2WgNLsFE0bIY1tGUJa6JDR1424x4EwnShVsTdnjySpWAumtn5HCwmHdpvkwcnz
	K852MxjA==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <gunthorp@deltatee.com>)
	id 1woQNp-000000005Fh-0XTC;
	Mon, 27 Jul 2026 12:49:01 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <gunthorp@deltatee.com>)
	id 1woQNb-000000003IK-1xbD;
	Mon, 27 Jul 2026 12:48:47 -0600
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
Date: Mon, 27 Jul 2026 12:48:40 -0600
Message-ID: <20260727184844.12647-1-logang@deltatee.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org, Frank.li@nxp.com, hch@infradead.org, christophe.jaillet@wanadoo.fr, dave.jiang@intel.com, linux@weissschuh.net, kelvin.cao@microchip.com, logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Level: 
Subject: [PATCH v2 0/4] Add sysfs interface to switchtec-dma
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

This patch set adds a handful of sysfs attributes to the switchtec-dma
driver.

The first two patches clean up and generalize the technique that
ioat used to add sysfs attributes to a dma channel. The other two
patches add a couple different sets of sysfs attributes that are useful
in configuring and monitoring the hardware.

This patch set is based on the miscellaneous fixes series I sent
earlier[1].

Logan

[1] https://lore.kernel.org/all/20260727181526.9672-1-logang@deltatee.com/

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


base-commit: 0428de2e30c4690e119db5ee4b27725216b61de8
--
2.47.3
