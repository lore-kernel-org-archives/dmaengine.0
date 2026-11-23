Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.205.14.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436586;
	b=NwU5gC7mrYfcCTKD48SSt2VCxucv0T816uaiFnxNoAhcSd/92FIacmvizyx6UzThOrWv
	 WWjiBNNduxtepMOlq11rZY0Ep6n3YviHPhSmjg6w9MPekXR8xsNzaZYy7goidZ5ao6T48
	 s778s1hYloqmBXypqDfEifOAJOr38jl45blgZvxpcrvhg6b9scDG4shT+kaCNVgl8wF4Q
	 Gebm3tLUj79DvKrv3OuoorCu/MtXqdj/ZcXd9gQ5ClMGJHC6BwtivjWRiHxlDUeuH7pG/
	 DBW3iiKY+eMOPP4I6SbKlNTW4Hw2CA+vaA0yz/tLQoC0Iuc3ELuK6uAbxxsgI+RVsTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436586;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=CyQ0o9WVz8accDZel3cTFGEBMTNvH811X58qSZJHyvM=;
	b=QeJvdFIjD7W4cmAPGsZK/Hllb/OAH95qik0bwA809TTjxcJegGAkUxV8cokfpqlgYShe
	 ZZSnPBmnllUF4J9sp4Kl6MAAQeM5TJMIBMl+YECYQ0dIVUciV1wj1y4isO1FUaTJal6Ks
	 t2QHs2JmDBKQjyW0MGhLogaskgsQzHpPT9NzNsH9rwvNm6TzqD1WLlZPQItq7W06ljbnk
	 thfKYG3NhrcJkP7f7Q/a1xR9TH5/ZPv851d3juZ1Uc1uJldN3rhBFemuFiwNqn2H7fhzX
	 EmkbSjdYYhjEnhHtmZYYnYvsU59rQtuPSW6Ytv3A2+0o+SmNm9A3uimkRigMsPY/i5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gpxsee.org;
	spf=pass smtp.mailfrom=gpxsee.org;
	arc=none smtp.remote-ip=37.205.14.76
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4130606A333
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 12:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4130606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from localhost (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id C6A4FC11F8;
	Mon, 23 Nov 2026 13:22:52 +0100 (CET)
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
Subject: [PATCH v4 0/1] dmaengine: xilinx: xdma: Fix broken PM suspend/resume
Date: Mon, 23 Nov 2026 13:22:35 +0100
Message-ID: <20261123122236.5460-1-tumic@gpxsee.org>
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

Changes in v4:
- Fixed parameters documentation of xdma_reconfig_channels().
- Removed unnecessary parentheses around chans[i] in xdma_channel_init()
  call.

Changes in v3:
- Reuse the HW IRQ configuration code in init and suspend.

Changes in v2:
- Added missing user IRQs reconfiguration.
- Prevent warnings when CONFIG_PM_SLEEP is disabled.
- Fixed documentation/indent.

Martin Tůma (1):
  dmaengine: xilinx: xdma: Fix broken PM suspend/resume

 drivers/dma/xilinx/xdma.c | 146 ++++++++++++++++++++++++++++++++------
 1 file changed, 123 insertions(+), 23 deletions(-)


base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
-- 
2.56.1

