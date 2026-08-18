Received: from out203-205-221-191.mail.qq.com (out203-205-221-191.mail.qq.com [203.205.221.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DF04746D7;
	Tue, 18 Aug 2026 12:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056895; cv=none; b=Z5cJjM61Lp+kcUOkVCZhWWB26goXBJHmCkVn9Znxq5T778H7wt+Jj2obM4prnGvTfiWlA4F95H7M2kF9ixvdQ+twEZm3HQEz/JPMjE5Rbz8x4W03z7cuM21htcw/5lSSWNdCiYM+DcPpuEm5ipLZ8HPy5xpSQk4TR3+fIppXqhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056895; c=relaxed/simple;
	bh=sSF+u+HRz6LcsYaXmkNxmqIR/U6C5DhJtfcCpauLWWQ=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=SX15+1HTCU5yigLBEFsIY3j9D7SF2C4b/Jex3+Oxxcz3+QbO+y8XQLRAGWV31ax2lWMYD0Q7T7BYDRZqRSZe2+gJnv3jslbYVVh6+2Modf6Av1dGBbAdgEzUqBY41YsRwbRyuQ/3xLraJqqngft9cj3URRYmb/BLdJGkWS3pCFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=JXYoMNEP; arc=none smtp.client-ip=203.205.221.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="JXYoMNEP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787056889; bh=qWzFApVAcRy+PVAqO8lvQ9aceasldTYxBejoCDXCveM=;
	h=From:To:Cc:Subject:Date;
	b=JXYoMNEPpb8I3xr+xAUeqGzKk3BFY/vG097wb47gL4cHMDlW0CCsUrU4QfnkDMY2f
	 Rvw2txq5NTj26HlalvX5wfXZPRClrxzXbQsbAc3JdfDzx+pArBp3KjYZTbD6p38IIf
	 yPx/hQUl4R9Q/JoDi3VfO/1Atvn+aYAOBCaLT+VI=
Received: from ws006419.mbzu.ae ([5.195.0.150])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id A5910C3D; Tue, 18 Aug 2026 20:41:25 +0800
X-QQ-mid: xmsmtpt1787056885tnripchdb
Message-ID: <tencent_72CAD47A90A208C873DD65A726C0A15FC107@qq.com>
X-QQ-XMAILINFO: MDbayGdXPuoebvRmat116eaQnnDc4IF2sgjf+7dZoOMMkxtmSglLx897QAqvjr
	 UKzn2CepWeOZk/SORZ3HumR5kGXoNCi2lHyKu7n73If/i8T6upFwplGgdo2PJn2wkdm17U70ev8T
	 Sta7d4dOgLleQyGH/5FLQlo15sVAxmkt6BhHIj0eRIaIIW5GI0FUqnoOgQoCE6KpyWk9qJF7yPe3
	 HEZVATuKOR4t4rHVX19JJGLbexLa2kK3y20tNl5DhSS9C2/KA0GKkZuQjar4aJNrkNU93J1QcxmF
	 3jgpwmREADaiee/ozx67tTB8/UvBm+JvmMOkTl9agUV5H+6KgcXu/rICVjteL6Z1rxQtuFLqlg9T
	 cqf/QqzTozZhsf1YnCjBZr7HZSyNkJ6PWpL+5jUn30/jpmz3qOzAXiFH9nFfb7v1iewkFt+q9Ws1
	 xJ180VNppNLJ4faNdPqo5haxDIzgTCo92ZicKlz+efFKDeZTQIwSLC62VBR/uLUn9y2huas0oi7/
	 6DdXS1hHBoPeGeMDERqKQa1z2Zdt3zsPaTQzf5ybhkz+GZa1shVynZ8Ef5FbD+M7P12P1uP7GIBL
	 OM4SrVdympAdY/rwOPjGfOZ7/mVlrH3oAN66LNhqkzf9t+ceFCFPYMbVPdnLT1GTJKce8+4HkFxb
	 jsc0nKa1kJnwo/74h0jEpZbdS10WggED6a+WGSC2UTRU6vgv7peRv1WQ4SMUb1rztK5OthaC/YHe
	 Y538s5ffuVq2B/iLmqnYGeZxNxpwvzWUNue6ULfuijMp5VvKyp5p49W+XeI09pX5F4hJHxX5iwO7
	 L2D5YLqgGQ3ErZxaYqjNgI500bjXIUk5NKinynoKvQvPUoEcvfMhhgba7l7UIwojE9uBctiV9Kpw
	 Nuiyl0ehmBQ1NtXwZ0lDHo9wxJF2es1CoGd6INfEs4tKu+OCy3IUScg5rq8pKIJS55GGpm0/8slF
	 yiV9oURZWAqHXOXLTiU13Za3qWa2CnwozTKqrowdkd0KJ00YjxF19bnJjC3Udva0tkuUfWsR6Mh8
	 /ycYhF4CzY0kGhZOxZ6hWxYVoHjutqSPhHgqz7IGhDeMFZf6NDRvA5mzFuxyIpa98nuNv85g==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Jiawen Liu <1298662399@qq.com>
To: Vinod Koul <vkoul@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	jiawen <1298662399@qq.com>
Subject: [PATCH] dmaengine: sprd-dma: handle runtime PM get failure
Date: Tue, 18 Aug 2026 16:41:24 +0400
X-OQ-MSGID: <20260818124124.246975-1-1298662399@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: jiawen <1298662399@qq.com>

Route failed runtime-PM acquisition through its existing cleanup path.

Release and disable runtime PM before continuing with the hardware
teardown, so an unsuccessful pm_runtime_get_sync() does not leave
runtime PM enabled.

Signed-off-by: jiawen <1298662399@qq.com>
---
diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -1212,7 +1212,7 @@
 
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0)
-		goto err_rpm;
+		goto err_register;
 
 	ret = dma_async_device_register(&sdev->dma_dev);
 	if (ret < 0) {
@@ -1234,7 +1234,6 @@
 err_register:
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-err_rpm:
 	sprd_dma_disable(sdev);
 	return ret;
 }

