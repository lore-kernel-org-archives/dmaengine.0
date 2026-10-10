Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6595B4A5EC7
	for <dmaengine@vger.kernel.org>; Sat, 10 Oct 2026 12:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636322; cv=none; b=SLSTW02RIkyT2ZaDkASRuO0ykhnBSiLY/MK7HSOZ27fng+3GXEvuVIdiHi4RqPa4yaxVSzoJ8jikhPbTHyjZ+Ik9XSvq7UeS8ksLvJcIFt7dcIdwRuzxI/7pVueUbR73D40OawcwjIFv+53EBaD7tAicj9T4YK7zW1zmiur6gxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636322; c=relaxed/simple;
	bh=hh1aWN18egknltpFFos2o1GqgKnYzgn3/bCresMc6sw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rn4qsgt+sLpsZGB1znxUcUomyrOG3fu3Kt1SVZLvRvGj2BCr6TZ3L0lCeTl/7jK2FmW4DXEIM7WCMiHMCzS1TjVtzie5Irp3Wdfqkz4IbPfXvy2ygA1YVM/UuF2XnBHNGlfJ3LE4VLmTaTqBGQznO8di0eNJ1fBCWlaqQCoKBJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=U+1tMgNI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="U+1tMgNI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=A74c2qoZ6BpSNw
	MAse5kXtNHXo7PayT9p18/cjqo4Gg=; b=U+1tMgNIX20Ltw2sQ1GAawezjGWeUb
	pvTr5e9L5UqwbvMgpn9NY/62mkG0CZSeY+L77XB/iB2jFFcXH2Y8141vYBQL6xVR
	WyaBKsR6tXg9+46qSq5S8Cemd4qcWyY6fhodIDfOJ5UipG+2AqroulauPtbjkP0u
	PchCX8kYLGeBi3aW+YFsneLqvf4EJBQlkjAa+5GYyTtkT89iHGH4FBPfCun1mq+k
	Ee8Q+7PBq8BEV+lgDDpe4sMgYWV5WF+5vvBGdHLfhRfvEkw6XdsBhqdCX1/kzud2
	hceqguiUyVCCKpJsCgZIIj7FE8wa55qxbb/b17fGv7w6kb1zrDlCXnlA==
Received: (qmail 1548722 invoked from network); 10 Oct 2026 14:45:08 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Oct 2026 14:45:08 +0200
X-UD-Smtp-Session: l3s3148p1@u0Sp1XtdXoHV64Vz
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: dmaengine@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Frank Li <Frank.Li@kernel.org>,
	Kelvin Cao <kelvin.cao@microchip.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 0/8] dmaengine: unmap descriptor before completing cookie
Date: Sat, 10 Oct 2026 14:43:38 +0200
Message-ID: <20261010124348.19055-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We found out that we need to unmap descriptors before completing a
cookie [1]. Fix the drivers for which this is a no-brainer and just
switches those two function calls.

Patches are based on linux-next as of 20261009. Except one strange guy
(fsl_raid), the rest has been build-tested. Maybe these patches can be
squashed into one, not sure, I do tend to leave them separate.

There are three more drivers for which this change is not as trivial. I
probably send them out later as RFC.

Looking forward to comments! Thanks and happy hacking.

[1] https://lore.kernel.org/r/20261009093745.539924-1-vkoul@kernel.org

Wolfram Sang (8):
  dmaengine: ptdma: unmap descriptor before completing cookie
  dmaengine: fsl_raid: unmap descriptor before completing cookie
  dmaengine: idxd: unmap descriptor before completing cookie
  dmaengine: ioat: unmap descriptor before completing cookie
  dmaengine: mv_xor_v2: unmap descriptor before completing cookie
  dmaengine: plx_dma: unmap descriptor before completing cookie
  dmaengine: switchtec-dma: unmap descriptor before completing cookie
  dmaengine: xgene-dma: unmap descriptor before completing cookie

 drivers/dma/amd/ptdma/ptdma-dmaengine.c | 4 ++--
 drivers/dma/fsl_raid.c                  | 2 +-
 drivers/dma/idxd/dma.c                  | 2 +-
 drivers/dma/ioat/dma.c                  | 6 +++---
 drivers/dma/mv_xor_v2.c                 | 3 +--
 drivers/dma/plx_dma.c                   | 4 ++--
 drivers/dma/switchtec_dma.c             | 4 ++--
 drivers/dma/xgene-dma.c                 | 2 +-
 8 files changed, 13 insertions(+), 14 deletions(-)

-- 
2.53.0

