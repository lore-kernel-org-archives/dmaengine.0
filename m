Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4152DB79F;
	Sun, 26 Jul 2026 05:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785043862; cv=none; b=Uiy4nRRAcyQWXlxDrx27NQOdoqXY/XXELyXHBHyUiHPYd+cIXH8sDCqOKV9JuK3g2tPWcBW1IrRWVimVCsg2bFYhe1KVLhvT/5UOsilAqQ49b9eK9AzLW96nylBt9ECcJWnzVas90No5TME6EeLxpA8CmHhc7zn9cs/gxi5LTCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785043862; c=relaxed/simple;
	bh=OiBdca1MBotMVbHv2sxz0zgmYzW5WSI9HVbA+/945lM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d8ir1khFMGrxIoJKZ5Yn6duTVxuolHFAwwDjvCVEdIJ/hWYB+GKfzgZP30gMJPGyfCgea5hP7dU3kuMABSDSZOZipcLx29o4SJCf8y9UuyifvHNfA4AecdKk20fBe9qXS6cR/wLbJMC8KkU8ctYxXGFNlZcEvJbBS/EN70dTHtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wB3T_yHm2VqXL0+AA--.15401S3;
	Sun, 26 Jul 2026 13:30:47 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app2 (Coremail) with SMTP id zC_KCgBHt8yGm2VqrsI5Aw--.61727S3;
	Sun, 26 Jul 2026 13:30:47 +0800 (CST)
From: Fan Wu <fanwu01@zju.edu.cn>
To: vkoul@kernel.org,
	sven@kernel.org,
	j@jannau.net
Cc: neal@gompa.dev,
	povik+lin@cutebit.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>
Subject: [RFC PATCH 1/1] dmaengine: apple-admac: suppress bind/unbind sysfs attributes
Date: Sun, 26 Jul 2026 05:29:50 +0000
Message-Id: <20260726052950.37062-2-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260726052950.37062-1-fanwu01@zju.edu.cn>
References: <20260726052950.37062-1-fanwu01@zju.edu.cn>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zC_KCgBHt8yGm2VqrsI5Aw--.61727S3
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?VX5ItQXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfncGSG+szpQCInt5Y8rbJUI2Pg//e6j4FKdZm0BtzyOi6Gk4fn5lSG9u6ag7PbtwWS0tV
	+3ZpGbDuFwA7FmFP7M2p9E6mavGmQbzmcFsnzP86
X-Coremail-Antispam: 1Uk129KBj93XoW7urW7Kw1UCw43CF47XF4DKFX_yoW8XFW5pF
	WfGFW3uFyUKF43Jan8ZF1UuFyFy3W7CrWYgry7Kw45uFs8Xry7ZrWkKFWjkFZ8ArWrWF42
	yrWFyFy5WayYy3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Gb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804V
	CY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AK
	xVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JM4x0Y48IcxkI7VAKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
	JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8-6pPUUUUU==

apple-admac stores its dma_device and channels in devm-managed memory and
does not implement dma_device.device_release. At registration, the
DMAengine core emits a diagnostic that the driver is not safe to unbind
while in use, and on channel unregister it emits WARN_ONCE if a channel
still has clients. admac_data is released by devres after admac_remove()
returns, so if a client still holds a channel at that point it may
reference the freed dma_chan and admac_data.

As the controller is a fixed SoC resource, remove the standard
driver-core sysfs bind/unbind controls. It also opts the driver out of
CONFIG_DEBUG_TEST_DRIVER_REMOVE.

This RFC does not define behavior for other removal paths, such as
device or DT-overlay removal. Guidance is requested on whether this
restriction is appropriate, or whether the driver should retain manual
bind/unbind support.

This issue was found by an in-house static analysis tool.

Assisted-by: Codex:gpt-5.6
Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
---
 drivers/dma/apple-admac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 04bbd774b3b4..b448ee323454 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -946,6 +946,7 @@ static struct platform_driver apple_admac_driver = {
 	.driver = {
 		.name = "apple-admac",
 		.of_match_table = admac_of_match,
+		.suppress_bind_attrs = true,
 	},
 	.probe = admac_probe,
 	.remove = admac_remove,
--
2.34.1

