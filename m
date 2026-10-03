Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749AC405C2F;
	Sat,  3 Oct 2026 09:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021591; cv=none; b=Fwk7e9KQko2ewd6grUW4Tg6K/zDeKQa5LMQZbJQLGIpERHAzI9M6tLDf1Hqo6Z1nr5plPUZvTB/0qtUa628TQMaCsdavDAhkkMnoXeBm8fvbZUAZ4l2mtQglLnW64wy4RVIqyQdTjkfbmhKJxSlMkPsskX/vkAx3dnwODy0EvpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021591; c=relaxed/simple;
	bh=QiwcY3GytvMYq4JC8Ti4MlEKs1zr2+KQAXLWL+wLZEQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lQlhJHtwwbWLoepjpx64vJGDfVRfXo6DQ6QWLLF2y2TMBcAZVPEp2RD9mBcloIj8D2VpVGZR/trahXa1xLaDtVJnNpOFSr9WFuV8FkXnAKN44cvrPzqjyPWpfXf36LOe+XbdCyqRSlPqi3u0UpMOViGMozV6FzjgYnwPzDRFEhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=VFeTSsdL; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="VFeTSsdL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=lV
	/my0olA1OoH/9At+Wx46uR15CzHGyenNkckhPTYMw=; b=VFeTSsdLyj7lJ2zotX
	CGOvq0fvY4HXHm2U1eTcrH3hf8TSPvc1K7Xx6amr/WL/JMc7aqJaxDhgnyD1UUww
	DKOEaoEgbQMJ9JY7rBZ27lRiVnyAaaQ1AdoeOAAAFq5TuFZZvbAB7fXLen3k7aeZ
	xgmFtA97utH0i8bqn/JHGHi7w=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3f5P90cBq2ThFCA--.31371S2;
	Sat, 03 Oct 2026 17:59:25 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Hyun Kwon <hyun.kwon@xilinx.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH v2] dmaengine: xilinx: dpdma: Reserve space for a string terminator
Date: Sat,  3 Oct 2026 17:59:22 +0800
Message-Id: <20261003095922.575350-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3f5P90cBq2ThFCA--.31371S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww4kCF48ZF4rtFWkuFy8Krg_yoW8JFW5pa
	sxW3y3Kr12yFWDJw4UJ3WFva4Fq3ZrCr1UuFW8u3yFvryayw4F9a4FgFZ7Xr1kWryYgr1r
	tFW5tw1YkF12vaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi_Oz7UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8B5+uGrA0f6FVAAA38

xilinx_dpdma_debugfs_write() copies size bytes from userspace and parses
them with strsep() and strcasecmp(). If the input has no NUL within that
range, the parser can read beyond the allocation.

Use memdup_user_nul() to copy the complete input and append a terminating
NUL.

Fixes: 1d220435cab3 ("dmaengine: xilinx: dpdma: Add debugfs support")
Signed-off-by: Jiale Yao <yaojiale02@163.com>

---

Changes in v2:
- Replace kzalloc() and strncpy_from_user() with memdup_user_nul(), as
  suggested by Laurent.

diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
index d9a3542c4531..219d25be6c3a 100644
--- a/drivers/dma/xilinx/xilinx_dpdma.c
+++ b/drivers/dma/xilinx/xilinx_dpdma.c
@@ -410,15 +410,11 @@ static ssize_t xilinx_dpdma_debugfs_write(struct file *f,
 	if (dpdma_debugfs.testcase != DPDMA_TC_NONE)
 		return -EBUSY;
 
-	kern_buff = kzalloc(size, GFP_KERNEL);
-	if (!kern_buff)
-		return -ENOMEM;
+	kern_buff = memdup_user_nul(buf, size);
+	if (IS_ERR(kern_buff))
+		return PTR_ERR(kern_buff);
 	kern_buff_start = kern_buff;
 
-	ret = strncpy_from_user(kern_buff, buf, size);
-	if (ret < 0)
-		goto done;
-
 	/* Read the testcase name from a user request. */
 	testcase = strsep(&kern_buff, " ");
 
-- 
2.34.1

