Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6993F339872;
	Sun, 26 Jul 2026 05:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.75.44.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785043881; cv=none; b=GzjBkbBonYrgX0DC2kqrSWXy9BhH9dD99+VC+Wv1N5IN5OlwCjVZys0MikjLGUOOXH6VFuTqMq894ZUxkYjzbB6gQyJqh0HFFR2b2kY9rtZLzyusXvPP17a2OnsbnQYCnqsTqXMAWbeXiaaBfq+OIv7ej0NvYCe9o590SJ835Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785043881; c=relaxed/simple;
	bh=rUUNDbrph/WesnzW0PYhoviULG/JmIzsKQEUu/xjrI4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fVUlf0pjiRuFiMr2AvxximWRpYHtfe9QcZHju43mtj3LdcCH0diC562MuRKvaX2zHgh3TLtINblLBP5hOhOAQFo/rsSFSiYjSB2bkanaZ4fVN+0Zul0CUm+5FCfgrgseuHre2DtzeAI7JIjxivqQNLi0MTQKLRBatNar2Ns8two=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=13.75.44.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wCnJj2Hm2VqWr0+AA--.5275S3;
	Sun, 26 Jul 2026 13:30:48 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app2 (Coremail) with SMTP id zC_KCgBHt8yGm2VqrsI5Aw--.61727S2;
	Sun, 26 Jul 2026 13:30:46 +0800 (CST)
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
Subject: [RFC PATCH 0/1] dmaengine: apple-admac: should manual unbind be disabled?
Date: Sun, 26 Jul 2026 05:29:49 +0000
Message-Id: <20260726052950.37062-1-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zC_KCgBHt8yGm2VqrsI5Aw--.61727S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?oTVXyAXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfncGSG+szpQCInt5Y8rbJUI3L2YYhTuNAlTee+o8doh50Gk4fn5lSG9u6ag7PbtwWS/xU
	KAqL2hpkvQptDWoPrAup9E6mavGmQbzmcFsnzP86
X-Coremail-Antispam: 1Uk129KBj93XoW7Jry3ZF4DKFWUtw1DJF17CFX_yoW8Jr1rpF
	Z5GayfCFyDKF13Jan5AF18WF4Utw4xAayYqr1DK3WUuFs8Wry7AFWkKa409ayUJrWI9F42
	yrZ0yFyrWay5AagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Gb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804V
	CY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AK
	xVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JM4x0Y48IcxkI7VAKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
	JrUvcSsGvfC2KfnxnUUI43ZEXa7IU80385UUUUU==

This RFC asks whether manual unbind of the apple-admac DMA controller
should be disabled.

apple-admac stores its dma_device and channels in devm-managed memory and
does not implement dma_device.device_release. At registration, the
DMAengine core emits a diagnostic that the driver is not safe to unbind
while in use, and on channel unregister it emits WARN_ONCE if a channel
still has clients. admac_data is released by devres after admac_remove()
returns, so if a client still holds a channel at that point it may
reference the freed dma_chan and admac_data.

As the controller is a fixed SoC resource, the patch removes the standard
driver-core sysfs bind/unbind controls. It also opts the driver out of
CONFIG_DEBUG_TEST_DRIVER_REMOVE.

This RFC does not define behavior for other removal paths, such as
device or DT-overlay removal. Guidance is requested on whether this
restriction is appropriate, or whether the driver should retain manual
bind/unbind support.

This issue was found by an in-house static analysis tool.


Fan Wu (1):
  dmaengine: apple-admac: suppress bind/unbind sysfs attributes

 drivers/dma/apple-admac.c | 1 +
 1 file changed, 1 insertion(+)

--
2.34.1

