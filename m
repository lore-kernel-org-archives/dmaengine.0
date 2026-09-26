Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E469D400E1A;
	Sat, 26 Sep 2026 12:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790424815; cv=none; b=Y2BM/uXP+BixjZFK65Wcdlcf13Z7fQpklojnj4kNkLmaywE+xuIC4blmriUPsorPBowKdzKk8L9YoO+c5D0IEJwMKgO9Wi7FUDELfQ6+bn1cPcR527UWxZrGPLiayukD8hPZwr7byuWj0KQRCG+VeaJu1w6Dlcg3TMJVe6vRiFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790424815; c=relaxed/simple;
	bh=AlkrxDbE8N6cL/D+fATe2oo4oQrf/NERhVGSk+BOOos=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pUly2NuDpVwhHmECliTZoYuulsBMSvn86KzoEgK1MdFeFCY85qVfiOSWb+9/csW5y62dzePKxpjOmILBhZCdkDKJ+orYPMXEV6sxjf36T+s6VYlCCCyo5rGHbHTB3NWK+JjbElrHOaZWX6xc4JGdPovKHVi8USoK/8sHYGPHp6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SLFpGeyP; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SLFpGeyP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=BX
	u7uh2QBgUxSEt9lZNdDENOAqqsl00kGuodWz0UU30=; b=SLFpGeyPkcFiOiZNpI
	tS/lPseAMj2ZIWzVbS/yKM3OL2rndeFSFzN8OaS+Ha8ObZm1mhfnHdajGBTYDSTk
	vlE1brl4q6cWlfIHFyjD4HTHVtE1MUgaPh3IC6kkGZSPPDSpVWPYUNLfdPjp/3et
	BMtZKRd48x77B2aPTFWfzPbe8=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD338nKtrdqfXOcAw--.9011S5;
	Sat, 26 Sep 2026 20:13:04 +0800 (CST)
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
Subject: [PATCH 3/3] dmaengine: xilinx: dpdma: Reserve space for a string terminator
Date: Sat, 26 Sep 2026 20:12:50 +0800
Message-Id: <20260926121250.3258285-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260926121250.3258285-1-yaojiale02@163.com>
References: <20260926121250.3258285-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD338nKtrdqfXOcAw--.9011S5
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF1DAFW5ury3CrW5tryxZrb_yoWkArcEva
	4vgryxXF1Du3Wjkr1rArZavrWYy3WxJF18urnY9r43XF9xGrZYvrWrZa1kJw4fXrZ5GrWD
	uryqqryfAF17KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_KZX7UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRBqpGq3ttDG6wAA3F

xilinx_dpdma_debugfs_write() allocates a buffer of size bytes, and
strncpy_from_user() can fill it without a terminating NUL when the input
has no NUL in the copied range. strsep() and strcasecmp() then read
beyond the buffer.

Allocate an extra byte and keep that byte zero-initialized, so the input
copied remains unchanged and the buffer is always terminated.

Fixes: 1d220435cab3 ("dmaengine: xilinx: dpdma: Add debugfs support")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/dma/xilinx/xilinx_dpdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
index d9a3542c4531..b61ef3062d84 100644
--- a/drivers/dma/xilinx/xilinx_dpdma.c
+++ b/drivers/dma/xilinx/xilinx_dpdma.c
@@ -410,7 +410,7 @@ static ssize_t xilinx_dpdma_debugfs_write(struct file *f,
 	if (dpdma_debugfs.testcase != DPDMA_TC_NONE)
 		return -EBUSY;
 
-	kern_buff = kzalloc(size, GFP_KERNEL);
+	kern_buff = kzalloc(size + 1, GFP_KERNEL);
 	if (!kern_buff)
 		return -ENOMEM;
 	kern_buff_start = kern_buff;
-- 
2.34.1

