Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE513E9F6F;
	Wed, 21 Jan 2026 18:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769020506; cv=none; b=lzYPZIZqWvGerA8/Ah4hi8FLUqVmbIPcAr49AsZuqeAAFdwQ6RWTfBoZMQWpnGBh7cPT1xBu8a4o44jWEPfYLPHcdmfjondduAl54T2GOAgruMIp/j+TiaXKJvkT57WOMB2dEAvmyBam5/GzUXr9JYU3XanEYCv1NC8g3dIEixA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769020506; c=relaxed/simple;
	bh=8fs+IRPI/uJgEhAeatUkd4esbyaSZkFcjLl5G4+kxm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n3MTdXBA8WhfedYRwFu6AxqmqmCo9TAXaf79cWWU2TAtG5VgWPeXkgPrNPKRJfzhth1qPSQwame3zLKfcfm3GKqq9K4LG5DAr2+XR9uUhuUm8SGAcF6Fzxm8pSvPXsi/jEas3a32w6ftIy5GwauEnPp0kRpHoM0iNz0qd5djiZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dE8+K91h; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dE8+K91h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769020504; x=1800556504;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=8fs+IRPI/uJgEhAeatUkd4esbyaSZkFcjLl5G4+kxm0=;
  b=dE8+K91hqS7dGkmcwJwCPyGloe/m9UNxOVCxVyAJoinswvALz4S9uU42
   wfDEEA6XSv+P3DCUq/psyjFFUoDlGHUY6nTKTJ/qzYkhgVvYcsGfeN5GQ
   RU4Dxh+QrrhjYg7ZoW/Z2a+gkZY4IYbARMDX8Gyx4/17escY7C0bAg+8e
   kWCrdIo1o+srHBtuxl7T1UH2V5Mcbmdy2ASyQiHrDCpwyMdN1UkR3ivnN
   B6x6N2+QwOuJu9FFz3dGwyRjdKFFyxF0WsKgq5zb25xVk+fm8USiNHNU/
   okEuqqC2ctzV8BJMyyyet8DyGpbswftTMfIiADdKf/o6JAw9ku0vXYz0L
   A==;
X-CSE-ConnectionGUID: 1pePCQeJSouADX1nDHQ6Mg==
X-CSE-MsgGUID: HtKF/hdgSNqLdyhsXXympA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70349913"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70349913"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 10:34:57 -0800
X-CSE-ConnectionGUID: SC88BCxxQuiGVZTqrpjqjw==
X-CSE-MsgGUID: LJbKSTtATkqroULb+y1oVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="210678481"
Received: from vcostago-desk1.jf.intel.com (HELO [10.88.27.144]) ([10.88.27.144])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 10:34:54 -0800
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Date: Wed, 21 Jan 2026 10:34:36 -0800
Subject: [PATCH v3 10/10] dmaengine: idxd: Fix leaking event log memory
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-idxd-fix-flr-on-kernel-queues-v3-v3-10-7ed70658a9d1@intel.com>
References: <20260121-idxd-fix-flr-on-kernel-queues-v3-v3-0-7ed70658a9d1@intel.com>
In-Reply-To: <20260121-idxd-fix-flr-on-kernel-queues-v3-v3-0-7ed70658a9d1@intel.com>
To: Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, 
 Dan Williams <dan.j.williams@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vinicius Costa Gomes <vinicius.gomes@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769020494; l=1193;
 i=vinicius.gomes@intel.com; s=20230921; h=from:subject:message-id;
 bh=8fs+IRPI/uJgEhAeatUkd4esbyaSZkFcjLl5G4+kxm0=;
 b=ADnpNWhBclc3WYUa3atOVvFjQ4GaO2apF4NKCwwB/iIIaNtzYL16GxlCS0keeZktfAYuE1G4V
 CT4UsH+DfDZAm39W3CMLjIX2X4IuWhbw98N+UDyt9MyGTOUU+b1kaQy
X-Developer-Key: i=vinicius.gomes@intel.com; a=ed25519;
 pk=aJkrtgqgT6TZ8iIHSG8/rTPsmlYnjMrUjCsMYvCzntk=

During the device remove process, the device is reset, causing the
configuration registers to go back to their default state, which is
zero. As the driver is checking if the event log support was enabled
before deallocating, it will fail if a reset happened before.

Do not check if the support was enabled, the check for 'idxd->evl'
being valid (only allocated if the HW capability is available) is
enough.

Fixes: 244da66cda35 ("dmaengine: idxd: setup event log configuration")
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
---
 drivers/dma/idxd/device.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/dma/idxd/device.c b/drivers/dma/idxd/device.c
index efd7bfccc51f..131138483b87 100644
--- a/drivers/dma/idxd/device.c
+++ b/drivers/dma/idxd/device.c
@@ -834,10 +834,6 @@ static void idxd_device_evl_free(struct idxd_device *idxd)
 	if (!evl)
 		return;
 
-	gencfg.bits = ioread32(idxd->reg_base + IDXD_GENCFG_OFFSET);
-	if (!gencfg.evl_en)
-		return;
-
 	mutex_lock(&evl->lock);
 	gencfg.evl_en = 0;
 	iowrite32(gencfg.bits, idxd->reg_base + IDXD_GENCFG_OFFSET);

-- 
2.52.0

