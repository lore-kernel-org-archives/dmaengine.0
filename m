Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8D33DBD51;
	Wed, 10 Jun 2026 09:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.128.198.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781085485; cv=none; b=EPv7cKuASKUxUQbWCMPUF5SpEZlaxLJ1Gmi/crbbRT8lgrqeU5P/Z7LAdDe0FIwFukzpO/y8PZbGtn5WeizyGQFMrTo6t0Dq6ZV9pYAW/DMWWy6zrtJrtxOG5e7eixaorLgMMNns6OMVtPz+qHmm1fo/l4/70ZdF5QRq1KyAyfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781085485; c=relaxed/simple;
	bh=HQGCYef9Jech7YbFS/MDuDvw8Gqg08Q9Lt3ZA2xMrWM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PJ0qNc8pkuRVGPfjUIiXLzIH1BLWwsaVXouueEwFNw6JWb6NryuzwNWIGClP9LUNc9Inr6Ty3qmNq9mzG2nmdjf540m/vOxwriAmXFiCpIyMoZ9X2WRyzd+jWCugPoryWgAYBHPayYN/AwBwUQw0KySYmv+jbTEJQ2BhAXtU1bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=220.128.198.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 65A9vh0d075452
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Wed, 10 Jun 2026 17:57:43 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 10 Jun
 2026 17:57:43 +0800
From: CL Wang <cl634@andestech.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <dmaengine@vger.kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tim609@andestech.com>, <cl634@andestech.com>
Subject: [PATCH v5 3/3] MAINTAINERS: Add entry for Andes ATCDMAC300
Date: Wed, 10 Jun 2026 17:57:24 +0800
Message-ID: <20260610095724.1980622-4-cl634@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610095724.1980622-1-cl634@andestech.com>
References: <20260610095724.1980622-1-cl634@andestech.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 65A9vh0d075452

Add a MAINTAINERS entry for the Andes ATCDMAC300 DMA engine driver and its
associated Device Tree bindings.

Signed-off-by: CL Wang <cl634@andestech.com>

---
  Changes for v5:
    - No changes from v4

  Changes for v4:
    - No changes from v3
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..0d17580a6d17 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1868,6 +1868,12 @@ S:	Supported
 F:	drivers/clk/analogbits/*
 F:	include/linux/clk/analogbits*
 
+ANDES ATCDMAC300 DMA DRIVER
+M:	CL Wang <cl634@andestech.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/dma/andestech,ae350-dma.yaml
+F:	drivers/dma/atcdmac300*
+
 ANDES ATCSPI200 SPI DRIVER
 M:	CL Wang <cl634@andestech.com>
 S:	Supported
-- 
2.34.1

