Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA393DDAE2;
	Mon,  6 Jul 2026 14:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349817; cv=none; b=YI8KxpNXTTuofspVYWAw7+Vr1M9E/umMK5XIMUDwXrMN7y6FF6nNNtOdGzU2WFkx5L6yeXWO2oU6lANZBdhDCI5ams9PNlqdbb1+3sFX9W057zXiC3h0kRl+LOyU53EeYYF9IgxEtLfWohzqdMa/kA7Zc92LIpNiq2iqP4du6SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349817; c=relaxed/simple;
	bh=N9Nl4STlOhHRAgY9xp2K5cX9af9k022HFG/tyT/JV8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m+c9cKARiZkwrdrGyT2v/yGC5bJiWmvg7GJGLSEf24/A0Ojf7wEy1O4s3ClqW6ZEVRCDl6oG9MsD3E7JVU0LNnvqrZTgeugY+tUkdFl4VWzhZu1po4rAR09NqXVF4cumhJOqRu/15bEb9f3Oh9vYJHxuW7EkicjCR6tbIWCDVyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=P5jcereK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="P5jcereK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3121F000E9;
	Mon,  6 Jul 2026 14:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783349815;
	bh=PzhHPm9mRFQAZ5y3H+NYW9VczyftYmctcN3og1BVWzE=;
	h=From:To:Cc:Subject:Date;
	b=P5jcereKsnxQ3GRYobyNoaJDpnfH7tFC6cV7hzihmzSU/6CLyXWhpK0IHJLfC97A1
	 K01Rdmr5Y2gMotbP9A3jLNyU9ysW6PGzzxAA1LdzHsfxDML5rITrJGgTUbIQKc2n/e
	 WvQuPs/wREq86Vza4dcZr7TWwO219BE3+3n7MNeM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	stable <stable@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	imx@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] dmaengine: fl1-edma: Add error handling for devm_kasprintf
Date: Mon,  6 Jul 2026 16:57:06 +0200
Message-ID: <2026070605-frying-fling-b9c5@gregkh>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1018; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=xzwG8VbwgcOiCflei/l1JYZm5RGqKU5d0bbNDwzsZus=; b=owGbwMvMwCRo6H6F97bub03G02pJDFnehxw3Cs3XuHwi6MjfXZ9vXtlj53Xq3Zybcc2/Ffc9U MvonjS7uyOWhUGQiUFWTJHlyzaeo/srDil6GdqehpnDygQyhIGLUwAmYqjNMM+I1bN06pJdPw9N qH0uv/vzV4bynQ4M8yvz7zeWJ1TYt8zuOm3WYHO+ZULwJgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

From: Griffin Kroah-Hartman <griffin@kroah.com>

Add error handling statement to fls_edma3_irq_init() for the
devm_kasprintf call.

Assisted-by: gkh_clanker_2000
Cc: stable <stable@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: imx@lists.linux.dev
Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/dma/fsl-edma-main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index 36155ab1602a..d9fb717b5b53 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -414,6 +414,8 @@ static int fsl_edma3_irq_init(struct platform_device *pdev, struct fsl_edma_engi
 
 		errirq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-err",
 					     dev_name(&pdev->dev));
+		if (!errirq_name)
+			return -ENOMEM;
 
 		ret = devm_request_irq(&pdev->dev, fsl_edma->errirq, fsl_edma3_err_handler_shared,
 				       0, errirq_name, fsl_edma);
-- 
2.55.0

