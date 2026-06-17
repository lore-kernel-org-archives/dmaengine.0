Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D27538F226;
	Wed, 17 Jun 2026 09:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781687667; cv=none; b=Kmw1VaoAyN6A3RlUrUTfrkh0q7jnhzPEpJyYAP/gbD/5wm3J24knhADJOB/RXCTCpN/L0GtCVjyKeP0FelGohlO22WCN6Ufl6nMGPPRJCmpaGGYfSYPR8lmivA3tMExLHJoGfySpHM7ETgkclvXkLJn/iLU49E1EhE0PS6W4zkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781687667; c=relaxed/simple;
	bh=+RUAIhgia6OFFZ9imQ3xVP66TweH28z0PeEgcP3v8eE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G78RIW927GkHRvJH5ij3wuVVA4SerVbnAGbSWGdeBlJx7jtTvsL2A4oRjytJjAbz02U1yDfrACypDYOpfI4ujoTK7dYUywctZPzhTk0zhAde4H4itTQ8yTUfptXYdmQ8YT9uwspO30kGsy8jDPm15YMzHCoxVU5DILuMVoEyF/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zoea+M7h; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zoea+M7h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781687665; x=1813223665;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+RUAIhgia6OFFZ9imQ3xVP66TweH28z0PeEgcP3v8eE=;
  b=Zoea+M7hdeTcPFdP1y3UI3lTWJH47GYSSKTgD4i24DXyOJo5wFw6KmYe
   d2BXfMJc+PZx8Y6AwCI1okXbTbGLmHeRiDO3w2tsxffXfOyNR8qxQk3Kx
   CVM6z6+GBXyxK/JNvSkA/UjpyR/XznYnyCh70eukwoORiPLKy0yKDJOiN
   BnrjygZxQurlKcBA3216pRwymRg9ZkvUKj6lGOGf7mwbtnm8SlftsIJMy
   EFRk7bWdXvVMBcAblY8BjuvNABe5L3GLfkF3dR6GdC55Wkef2Kw3weYnu
   aNKi1Y9JBzYwtRjeQeLCy0cyuhX2gkhxIfvgkbC3WSBKQfgEguYIF8e9M
   w==;
X-CSE-ConnectionGUID: XcgnvHDSQ5yNBwKpTy4z/A==
X-CSE-MsgGUID: vtq4EAz5TDy4xD/3kR7lrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93961435"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="93961435"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 02:14:25 -0700
X-CSE-ConnectionGUID: 7+bt5+W6SFiW9iLXCcBxbg==
X-CSE-MsgGUID: lCgVHjoRTACVoqyZD5Ufsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="286130241"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 17 Jun 2026 02:14:24 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id CDBEC95; Wed, 17 Jun 2026 11:14:22 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] dmaengine: acpi: Free resource list at appropriate time
Date: Wed, 17 Jun 2026 11:14:21 +0200
Message-ID: <20260617091421.2649071-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In one case we don't free resources when formally should, and
in the other we do unneeded "double free" (emptying an empty
list).

Both are not critical issues at all, they just make code robust
against any possible future changes in the flow.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/acpi-dma.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/acpi-dma.c b/drivers/dma/acpi-dma.c
index be73021ecbd6..b053a7f96f85 100644
--- a/drivers/dma/acpi-dma.c
+++ b/drivers/dma/acpi-dma.c
@@ -55,7 +55,7 @@ static int acpi_dma_parse_resource_group(const struct acpi_csrt_group *grp,
 
 	INIT_LIST_HEAD(&resource_list);
 	ret = acpi_dev_get_resources(adev, &resource_list, NULL, NULL);
-	if (ret <= 0)
+	if (ret < 0)
 		return 0;
 
 	list_for_each_entry(rentry, &resource_list, node) {
@@ -370,10 +370,11 @@ struct dma_chan *acpi_dma_request_slave_chan_by_index(struct device *dev,
 	INIT_LIST_HEAD(&resource_list);
 	ret = acpi_dev_get_resources(adev, &resource_list,
 				     acpi_dma_parse_fixed_dma, &pdata);
-	acpi_dev_free_resource_list(&resource_list);
 	if (ret < 0)
 		return ERR_PTR(ret);
 
+	acpi_dev_free_resource_list(&resource_list);
+
 	if (dma_spec->slave_id < 0 || dma_spec->chan_id < 0)
 		return ERR_PTR(-ENODEV);
 
-- 
2.50.1

