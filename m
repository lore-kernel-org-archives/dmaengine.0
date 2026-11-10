Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331974;
	b=tvMxu4JWjqMmtpSrqUr0mzkEjakIjvtJVeNeWraThi/+hPbHFxcJdfjS9B0syujxf1eE
	 GD9tWE8C70BoANLOHCHZVwHyw3eVCn0OtchXdC30jOQpeD/Ph339ce8X+83RQiejkKsP+
	 8AGLPT7/HMSI198aSPNTQoB3hvLr2R66TyhcbbbxCISbXLMZoYKdGSml2zbbfDuaxwKdJ
	 IT9HwaGtOn38I0Z9Yggb/wnH7r1AeqeqnjWtGn+jryFWjp0WChGWYmmzNPTrs+Y/aQQ2L
	 glW0Bi5LVToBEGpgiupAGSaZX3DhOspn9npFUBRVrEvJVlRYSgkNewRsKCop4PMdFhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331974;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:X-SA-Exim-Mail-From:
	 X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:Subject:
	 X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=OIVwxRprey6Bt6xm8xR5XrYD9s69EFhyb2H7VZulFW8=;
	b=WGcSF3fI38jAlBud6CFW4uwdcqgs8PowCc+BBjDBS4WCFsTquhLZbR6sFB/OIKtlHeCB
	 u/cZP3Jdnm6LY2WkPut06aiK6YUKEb7DaqYLERg33xEavnSlo4r0234XCvzZvIqJR5EkK
	 MI7j2V0i2zmjxnrXnXY1a1lSS4Um2U74ieOuRApsPsFF1xCA+z2vf6MqcTLIiAhCliIcV
	 IowWr+kS0IKWnqsOEOESXBVvihLJXc4t4UiabeOTwBp635j2iQm0e0UHSZS7Q9u+KbJFX
	 guKiWIHKt7g4FnJ0WGfbrTXza+zbgemTriy4Jdo8rT53RC1CCTKOjEkEZDRpfdXr6Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=Iq1a3u33;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80E6606A32A;
	Tue, 10 Nov 2026 17:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C80E6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=Iq1a3u33
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:Message-ID:Date:Cc:To:From
	:references:content-disposition:in-reply-to;
	bh=OIVwxRprey6Bt6xm8xR5XrYD9s69EFhyb2H7VZulFW8=; b=Iq1a3u33akwUNgJC9SrhrEDfi0
	CeoVjJApOhiYhFXwDj/bTg/eu6g1SmmutkNyW/WBsp+EFjBHZ6OPZiAF1pzWH5S9L+MSnigUVPwLs
	PJKk6+SQKZsMFE5molOhQWX/fu2E3MkUNKL0sDatsRoHqaJv7Y6wqhMl+50g5q3KHQARXCJ+1IcNd
	Sv/yYfNm1/JJnsBZOfTZPOcex0GV/sCZz1Bx42LhiHgnhZ3JGQEtZ39LJPnTDAZawgldKG1KZFue1
	UIxJjzUO+WmkECyPtsxmnvzecEiXLC/hD4EGM9q/19K21lQoWz8+i5KSqDWLlkgikmCZRlm5Yi6IY
	NRf7kkPw==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xQpi8-00000000o0y-2Rq0;
	Tue, 10 Nov 2026 11:32:45 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xQph5-00000002cH2-1xOy;
	Tue, 10 Nov 2026 11:31:39 -0600
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
Date: Tue, 10 Nov 2026 11:31:32 -0600
Message-ID: <20261110173137.623764-1-logang@deltatee.com>
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
Subject: [PATCH v4 0/4] Add sysfs interface to switchtec-dma
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

This is mostly a resend of my series last week. I'm really hoping to
get this in this cycle as this is the work I actually need to get done
and the bug fixes are something of a side project.

This patch set adds a handful of sysfs attributes to the switchtec-dma
driver. This is the 4th version which I'm hoping to get it in now
that my bug fixes and cleanup branch from Sashiko feedback was merged.

The first two patches clean up and generalize the technique that
ioat used to add sysfs attributes to a dma channel. The other two
patches add a couple different sets of sysfs attributes that are useful
in configuring and monitoring the hardware.

This patch set is based on v7.4-rc2.

Logan

[v3] https://lore.kernel.org/all/20261103154022.459620-1-logang@deltatee.com/

--

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


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.47.3

