Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205624137A8
	for <dmaengine@vger.kernel.org>; Thu,  3 Sep 2026 17:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455045; cv=none; b=ndM5yNhhUx+NGbv3kBf13ZkHzyM400BORNyH2MYXMiPRiTw/P8DaXtohvGPQiZsS1YQgra2h+Ik2YkWnCkC95SvKA9PYyKi2q56ttpXBr4LUbp4sjd16IvSgLM0wmikG3W6yY4Iw+d9aLunjNtIWdhYC2up0exvvWvgEDk2LaiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455045; c=relaxed/simple;
	bh=FS3OhERTjTzyvcU/kx1ye+J3hBr7Q2tT8Fc0SMLWCvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e6Gdn5NglrSXSrNSG4R1Sy2LiTsDy3a+pVYc49IGqpaZo1hEai/GZ5xUQquDChF2ub3QGGbD/e39m/4zCTO3QOadX4bev8NuOuPKwVFNImoBpmRBI0dSEGwGpIon45eXrotpsAEl6bANK1Uki51O7jy+D7Af4C1i/WSRr2RelXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eDUXlxZ/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eDUXlxZ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE0E1F00A3D;
	Thu,  3 Sep 2026 17:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455043;
	bh=uvW0Rn5tv5z5oDlhBa4FezYOUEe5Mbq8Z1Ac7V51BkE=;
	h=From:To:Cc:Subject:Date;
	b=eDUXlxZ/5ka52sMJaHWV1NXSc2V+eDYfW8IHu9ldL/UNrZPh8uFuqh3PKO1yACykC
	 WVareJiTSp3NqF+uNEiBv+/t5cYYX0wy+6dbW7CgH2JVMQsKUl9uy06tDIbnPwIeWa
	 T8ZqPtRivzqDxvCaqLxuQeUu1w3DWahPIKi7Z+JH9Gu3K0L3Cs2oCn2i/Xjts61DLN
	 l5ZnPVJccCL8HEMxRMOtH+OOC14ZSCgHEU4W6ePMXnacN88eJZBCR+YM3N/R9x/spC
	 3sj/ysTqfkDu7GYZDWYQIModT16VTNHMhQDJYhzhjeICgTOLRDJX+RAclEjKSwnN7/
	 nN2gtiuB9e+BQ==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH] dmaengine: zynqmp_dma: drop redundant label
Date: Thu,  3 Sep 2026 22:33:57 +0530
Message-ID: <20260903170357.1711462-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 64c6f7da8c2c ("dmaengine: zynqmp_dma: Add runtime pm support")
dropped the use of err_disable_pm label causing warning:

drivers/dma/xilinx/zynqmp_dma.c: In function ‘zynqmp_dma_probe’:
drivers/dma/xilinx/zynqmp_dma.c:1171:1: error: label ‘err_disable_pm’ defined but not used [-Werror=unused-label]
 1171 | err_disable_pm:

Drop it

Fixes: 64c6f7da8c2c ("dmaengine: zynqmp_dma: Add runtime pm support")
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/dma/xilinx/zynqmp_dma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index d1ee51dde3d1..3b7dfa53f972 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -1168,7 +1168,6 @@ static int zynqmp_dma_probe(struct platform_device *pdev)
 
 free_chan_resources:
 	zynqmp_dma_chan_remove(zdev->chan);
-err_disable_pm:
 	if (!pm_runtime_enabled(zdev->dev))
 		zynqmp_dma_runtime_suspend(zdev->dev);
 	pm_runtime_disable(zdev->dev);
-- 
2.43.0

