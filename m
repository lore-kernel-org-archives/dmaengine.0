Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5787D32B10E
	for <dmaengine@vger.kernel.org>; Tue,  7 Jul 2026 16:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=204.191.154.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783441269; cv=none; b=lEoFhjcxslBHVRdLws+r2j0nZ2mHqlD6eC0yJyW+FpOrA9IYKdWMZClVRc52K23w8lqqXBSRLe2LAs4whe+GcDOhccFVOeGKD2m+/Q1gMq53jgF2cJRVa9NywXUmM5MNbHYTz4HrYLds1miBqbtEoJt/4QihaLTX5gAOUAPh43c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783441269; c=relaxed/simple;
	bh=hj9LrshnQAnFfYgPKc2gqhfDMPxI7JyKxI6VsYIQFJ8=;
	h=From:To:Cc:Date:Message-ID:MIME-Version:Subject; b=Z/NdZzkMdXGrgteKEx+i5a7neIdr5q9E3JUEDs6TfZcQ851pfOC7Rx9q1KoOvdWBkEZuSKiYoNQrtM9RQIRzN8sw+x0fPK0hw0/Ta7oRH7ZbW0u6EiiFB8UQr33Nm++6sVj8Ia+hq3iz0Vw4+8NAR/0/dtsTbZq4cx3r2Txd55M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com; spf=pass smtp.mailfrom=deltatee.com; dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b=j3iaoNnR; arc=none smtp.client-ip=204.191.154.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b="j3iaoNnR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:Message-ID:Date:Cc:To:From
	:references:content-disposition:in-reply-to;
	bh=R26IUAxOmdigIViFUqnKLPPsdOzbCk+M8ESETOzbR2Y=; b=j3iaoNnROIH0T1NhdSv9s1fLJS
	DPERdsbIEo5a6SqV6ud4Gtsn0IWjqLpvRsOh+35Y2nQNLXIvqy/jhk1A/R7IQUVtvoIxb7feLJOvF
	fCXKJSFR5FaetjVmIK8NSUmHVDGmq6lqQHU13JHNEn0x2YOyjb4FS7GTiT1eFW+2SnryDfhO/O5kV
	gZwYzXyOm4VDXzbZ+ExJDdV6Gyhga49VFBv6j1PO9yYJWzvlNDPiC+bz4vKY4hi2pY2Sem09rtrlI
	JIUgObRoy5LBI2J1OZ5y/1iai/vYiwD0wVmAXtvHin4UrH4v2VDv0gaUUCElZMNz7ZoKvvByBrSUr
	KC+ePdIA==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <gunthorp@deltatee.com>)
	id 1wh8Xc-00000000nsu-36jn;
	Tue, 07 Jul 2026 10:21:02 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <gunthorp@deltatee.com>)
	id 1wh8XP-000000006E1-2DRS;
	Tue, 07 Jul 2026 10:20:47 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Dave Jiang <dave.jiang@intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Kelvin Cao <kelvin.cao@microchip.com>,
	Logan Gunthorpe <logang@deltatee.com>
Date: Tue,  7 Jul 2026 10:20:40 -0600
Message-ID: <20260707162045.23910-1-logang@deltatee.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.li@nxp.com, hch@infradead.org, christophe.jaillet@wanadoo.fr, dave.jiang@intel.com, linux@weissschuh.net, kelvin.cao@microchip.com, logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Level: 
Subject: [PATCH v1 0/5] Add sysfs interface to switchtec-dma
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

This patch set adds a handful of sysfs attributes to the switchtec-dma
driver.

The first two patches clean up and generalizes the technique that
ioat used to add sysfs attributes to a dma channel. The third and forth
patches add a couple different sets of sysfs attributes that are useful
in configuring and monitoring the hardware. The last patch just adds a
new device ID for the hardware.

This patch set is based on v7.2-rc2.

Logan Gunthorpe (5):
  dmaengine: add support for custom per-channel sysfs attributes
  dmaengine: ioatdma: use common channel sysfs attribute creation
  dmaengine: switchtec-dma: Add config sysfs attributes
  dmaengine: switchtec-dma: Add pmon sysfs attributes
  dmaengine: switchtec-dma: Add PCI1008 device ID

 drivers/dma/dmaengine.c     |  62 +++++++
 drivers/dma/dmaengine.h     |  11 ++
 drivers/dma/ioat/dma.h      |   2 -
 drivers/dma/ioat/init.c     |   4 +-
 drivers/dma/ioat/sysfs.c    |  88 +---------
 drivers/dma/switchtec_dma.c | 341 ++++++++++++++++++++++++++++++++++++
 include/linux/dmaengine.h   |   3 +
 7 files changed, 424 insertions(+), 87 deletions(-)


base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
-- 
2.47.3

