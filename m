Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.205.14.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190388;
	b=ppuznBvPb2qaYKwYXjTiGmnCK6hLwPli0OZAsUCq3V/Fa5YH9PswEOfEEDllKQCOxHJA
	 0+zQZSExxucY9vsZ2SywLIxJRrx2znc8VZSviJhCtF1/klsQ6O0+xNig7ommUXEE3/dZg
	 xLWF23lPm6t/t/q/tfoktOSkUcuWO5Ox6r08lcnYt8Y0oxPZc7vZobMQa3D/jzBetv48y
	 dsHMbus98Ao+JXH/F90pDXIjVRemQB6fYftagJSMn1maXBjZ9pUWkMSVvtzftiWB5b4dj
	 eS3xeSnwHbltWJLbxfdo2wHMUWWUvwPgJnuw6yCXx3tI2VNQj3sTa3+V8Wd1Udw5CZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190388;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RmZt+dOqn0yMdTBU3a+SMGEge9ySr1cITzTAAdRqojw=;
	b=fXZGzg6nFnjbZRyskyx/HuKJgkR/b/k9il9aXF0Odf+jtRvW8IZJkAhL83k5udheFt73
	 N6/lAXm1hZ2HDc+YhpZNt8f5z9fV6yOpbPr2Zp8FoRqz8IMUj/kHWsPJ5IEqPH7uc0sfH
	 rhBv5LG2KdAaZ7EpWZdIaUhyBbxtZMRLPWKYj0oNSxB+NMfhwpDFP7EzsoqGm7UUUlNAo
	 Tk77G4WHpbx8COyluYHgNngYJb6QNlN+K85ksNkrKUAL6PmbfjFavdszPSO91GzRpfk6H
	 5CdO2pg6ox8bIyvAtTnYTebzUJITV8A6BWFG3uw8S7zXih5Fm0YO1kQPRLxb4TPs5HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gpxsee.org;
	spf=pass smtp.mailfrom=gpxsee.org;
	arc=none smtp.remote-ip=37.205.14.76
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A92D606A325
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 15:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A92D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from localhost (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 45CCAB8EC6;
	Fri, 20 Nov 2026 16:59:41 +0100 (CET)
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
Subject: [PATCH v2 0/1] dmaengine: xilinx: xdma: Fix broken PM suspend/resume
Date: Fri, 20 Nov 2026 16:59:23 +0100
Message-ID: <20261120155924.5785-1-tumic@gpxsee.org>
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

Changes in v2:
- Added missing user IRQs reconfiguration.
- Prevent warnings when CONFIG_PM_SLEEP is disabled.
- Fixed documentation/indent.

Martin Tůma (1):
  dmaengine: xilinx: xdma: Fix broken PM suspend/resume

 drivers/dma/xilinx/xdma.c | 121 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)


base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
-- 
2.56.1

