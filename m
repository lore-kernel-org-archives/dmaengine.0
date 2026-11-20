Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.205.14.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195464;
	b=xRfxD6HgTHDJ+jFENJ99rp+UkDjJM8jGFEt0SPDKvtCaV7Y38T3uQ8OW3BAT6b9OG0CS
	 uggSboNrYbkTngTomZnBAdJJ1QzMeP/7KTOTapIGyIj5+/RDHzTd9noQF351j2yvGRYpz
	 HSNYJneJGBShlnqo6DGJHGtLzeGEXelCoUCEupYmJVNxZ+lCyZ0Has6lRwsTHCPVc7wF2
	 6oMxCiiaPMmQEyBCq9a/xuIOLzcpt5tTRm0DLqsDkvaw/o9PP+K8NfrBTYHcSw2MD7Dag
	 R1nigN44haV8xhsT4Vero+rb6iop946qyWf6a2hLGu02FXSvcxLCOT/JtM/1ny6CrAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195464;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=BpHWsybIOCXEQY8Aba2VG7MrcVU6PfwqG0wui1k3noY=;
	b=WPhl+x51nj/EzBjWnbyN7tG3t9kmgNX8PWA7oVIMHw3OO6Cqzd9iiO1UaJvnr0JSt4W1
	 gclJKY2g0MKqIm8otOXdsdr2g3PE6UrSzORVeXYN8dtACSVvpi2Vct/myHaNnkLEAql+T
	 QMkHbOeztH2dF5fcWCd4P22VB+RMoW0djdqC8cXtdwvv9XIOn4y/uo98EErpAFZHRFgYD
	 u8vj7R+lkcYWJTi+6WPFlklgirXBSJjl/A7CSCOpeoLnJ26QhO7L28jnqIz7mew4G8UMC
	 soKP08eU7iAU/uf/7RXpOvu5H8vOnNDvo4hd9XGxXuuDxlJzYezJ7L2VjK/97hveInQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gpxsee.org;
	spf=pass smtp.mailfrom=gpxsee.org;
	arc=none smtp.remote-ip=37.205.14.76
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C346606A330
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 17:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C346606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from localhost (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id C3179C04E1;
	Fri, 20 Nov 2026 18:24:21 +0100 (CET)
From: tumic@gpxsee.org
To: Lizhi Hou <lizhi.hou@amd.com>,
	Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v3 0/1] dmaengine: xilinx: xdma: Fix broken PM suspend/resume
Date: Fri, 20 Nov 2026 18:23:55 +0100
Message-ID: <20261120172356.5858-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Changes in v3:
- Reuse the HW IRQ configuration code in init and suspend.

Martin Tůma (1):
  dmaengine: xilinx: xdma: Fix broken PM suspend/resume

 drivers/dma/xilinx/xdma.c | 147 ++++++++++++++++++++++++++++++++------
 1 file changed, 124 insertions(+), 23 deletions(-)


base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
-- 
2.56.1

