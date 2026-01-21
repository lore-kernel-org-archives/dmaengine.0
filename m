Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496E13C1FC1;
	Wed, 21 Jan 2026 18:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769020500; cv=none; b=ijKsEQunXsmo3t11Ml77BKjaQRVH8NabnpHtU7kF/TXcJTCnCBwjSuyaC9IuayXhh7LZQS9IS/AKK1iYBNQ8FmMBoqK0KM5c3Lva0sL5Pe/qq28sqdhnGLxBK52fC7L2iiR7cO3SqgpJX2D9xo/W8ipn6Xfu4UeSJivGLBhVr4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769020500; c=relaxed/simple;
	bh=TD0ye6q43JjiW1lwMlhZYqmGxxTrmbilxB5xlOIjE3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JODzd4KQxr9WUTm/UStyjFXZTf0EhqGRk06mU92xD9Ew/EmQoQP9HR4b5QOwMRX8ycAR9PSSKbvKvzfJcwh5vx2PfAIcc3PifvnLutC9XEnv4eu9sflQmxAM/dP4ZDWdaSKrMkozgyP11kGEI/5DC7l9HVCFXuXVXD0NE6EHJ1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wz/x7wak; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wz/x7wak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769020498; x=1800556498;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=TD0ye6q43JjiW1lwMlhZYqmGxxTrmbilxB5xlOIjE3Y=;
  b=Wz/x7wakABc2KaAD714WhT8nHj73YR5QKwsdRFcq3CCJPw/fG3CruyQz
   ATxJ+dX2aWYdfctormcqeJmV1WsZTepv1TEP2nTorzX7KM0CkMKTDXjJn
   Sf1lf9sAUspPyRjRT1Z9n2uoVv6FUJUYHtZhnZC7ByRikL/0uUL2nLbqa
   Oe+i/5Vyd1Oyobtf8mKLZ+mgYpixzcBgQQDBvgZgVvsQBwpC5DE0D9C11
   Jom3F0Xq+8l8mG027GgoKlBH94xsXVafx3ksV4nNUv6yo2RDZ3H15vBW1
   By04e3cvubqnlFfMvjKyxtFDaM9d4bTASpA2ik/UB5z5EPRUwF/mXNEFf
   A==;
X-CSE-ConnectionGUID: w6Y/1Nd5S8WiDcUMPpgTpg==
X-CSE-MsgGUID: s42oRmHDQhue25fV0Ax4zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70349898"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70349898"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 10:34:56 -0800
X-CSE-ConnectionGUID: T+AfmtA1RSy9eThTRyt67Q==
X-CSE-MsgGUID: 8owLhS8HTWGBdnnv8oVASg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="210678461"
Received: from vcostago-desk1.jf.intel.com (HELO [10.88.27.144]) ([10.88.27.144])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 10:34:54 -0800
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Date: Wed, 21 Jan 2026 10:34:29 -0800
Subject: [PATCH v3 03/10] dmaengine: idxd: Fix possible invalid memory
 access after FLR
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-idxd-fix-flr-on-kernel-queues-v3-v3-3-7ed70658a9d1@intel.com>
References: <20260121-idxd-fix-flr-on-kernel-queues-v3-v3-0-7ed70658a9d1@intel.com>
In-Reply-To: <20260121-idxd-fix-flr-on-kernel-queues-v3-v3-0-7ed70658a9d1@intel.com>
To: Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, 
 Dan Williams <dan.j.williams@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vinicius Costa Gomes <vinicius.gomes@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769020494; l=957;
 i=vinicius.gomes@intel.com; s=20230921; h=from:subject:message-id;
 bh=TD0ye6q43JjiW1lwMlhZYqmGxxTrmbilxB5xlOIjE3Y=;
 b=GzOyff6yvKnVy6gi9wmrZCSNO8hHXNFzPGFFfCGiQ7uqNHyVA9HuS4zlisukyM7mu3eZAD6HG
 hU41/iYQ2zsAf9vzNacoCMWRNl6/TPp4nRcCnx+rqkKzpElZ34ZAjfQ
X-Developer-Key: i=vinicius.gomes@intel.com; a=ed25519;
 pk=aJkrtgqgT6TZ8iIHSG8/rTPsmlYnjMrUjCsMYvCzntk=

In the case that the first Function Level Reset (FLR) concludes
correctly, but in the second FLR the scratch area for the saved
configuration cannot be allocated, it's possible for a invalid memory
access to happen.

Always set the deallocated scratch area to NULL after FLR completes.

Fixes: 98d187a98903 ("dmaengine: idxd: Enable Function Level Reset (FLR) for halt")
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
---
 drivers/dma/idxd/init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
index 1c3f9bc7364b..f1cfc7790d95 100644
--- a/drivers/dma/idxd/init.c
+++ b/drivers/dma/idxd/init.c
@@ -1146,6 +1146,7 @@ static void idxd_reset_done(struct pci_dev *pdev)
 	}
 out:
 	kfree(idxd->idxd_saved);
+	idxd->idxd_saved = NULL;
 }
 
 static const struct pci_error_handlers idxd_error_handler = {

-- 
2.52.0

