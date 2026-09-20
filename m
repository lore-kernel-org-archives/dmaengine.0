Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F812475CB;
	Sun, 20 Sep 2026 19:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789930808; cv=none; b=erYQ/YscfQjv6OlulwxURuu21ebf7Gf8XyWJZwKppbSep/bUuefQxTh0fWZCtgLqvLqs6M4gYkpGb9FT7kdq0s7YnDgYxgHxCishJEh7zeU9zKQBrE2bHC2AnUHn35zBNp2f3JFDMlW0IePjbklwZTkywkmOaYqz/zF0Goz6yzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789930808; c=relaxed/simple;
	bh=i91X92E6yg3EdWHtWaUU0Op5ZeGuALbl3ftH1jJ3dm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n2iA7M6u7bakc23DweSG69dUKhPB3xVBe+erTQx++KF87n+lYU6jLfwAHZ7VMvl05qZT49uXgEyVMeetpoqvB5kuZEooOjpZHqGLKmTEhVPkS3i+U3woegUZDOxDNkGi7tVcmwXXfZaeMa4V5EtNsevasS08ghVAeLkkjZfVDtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9qf/BoL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9qf/BoL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 096AA1F00893;
	Sun, 20 Sep 2026 19:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789930807;
	bh=IpIXmICKv1JGVOrXuORzS8M85DCmxLrACMwFPoSoFV0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=b9qf/BoLjrwtySvgIYCOGSERn3zwjT+js6TzXzYsKidBo4qejiIylnM5tLaZB1qUb
	 2XEEldK0efSdvw35Mxt9p2DawH05xQSfapga8TV1oQ/+pzSkPTuegbSk3Qctmx8E91
	 SQ5bofo6A2pv+qVUYJHYWqQNNE9PFu0PZAfrdxeRrMjBiLIEiXjd3m0MFo25fwdB7n
	 kE5DATvCb6CxoRFR2rXjVPoHOFkJkNRWsmE1a6j3eW8MXvRIrxF9Z5KBy0qX6teeS2
	 YANQu1JEmNVRkcK6iQpOPKahND+97R/KmSfWqeG9b5Sis+wgHg3Ta8GglAL238TRXk
	 xAZXBLrpVJL8w==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 20:59:49 +0200
Subject: [PATCH v5 14/23] dmaengine: ste_dma40: Put the LCPA SRAM node
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v5-14-5c55cd7f92f9@kernel.org>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

of_parse_phandle() takes a reference to the LCPA SRAM node, but d40_probe()
does not release it after translating the node into a resource. This leaks
the node reference for the lifetime of the system.

Put the node immediately after of_address_to_resource() so both the success
and error paths release the reference.

Fixes: 5a1a3b9c19dd ("dmaengine: ste_dma40: Get LCPA SRAM from SRAM node")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 77ae6b28610b..02ccad255a75 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3767,6 +3767,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	}
 	/* This is no device so read the address directly from the node */
 	ret = of_address_to_resource(np_lcpa, 0, &res_lcpa);
+	of_node_put(np_lcpa);
 	if (ret) {
 		dev_err(dev, "no LCPA SRAM resource\n");
 		goto report_failure;

-- 
2.55.0

