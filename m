Received: from mail-lr2-f11.google.com (mail-lr2-f11.google.com [74.125.230.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF5D4BD0E2
	for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 12:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473980; cv=none; b=DQ/py7c2xXYNaEWZ9hvsMeeF/A3kOeaDxs05A5lwlBcK9r/4v7uIb+kZ4e1vT219n9mdhalUXykgrR9hObpimdpssu6rZ8c3uiImRShGIp+3Z9VulmAUMlIp6umISFaj7kyOuweFQ3b5ImVhgiwICs/eAaCe7G4ZH1IhvSFp47Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473980; c=relaxed/simple;
	bh=xLj+jM2KSSSCsF3YlCQPUNC8nNLiz+oGj3+E5AkfP+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RIlkZCBBpCOaiAVJE1PAhd1i9sc8DO8V3Auz+P4PLdPFNZb1h0hKEYZnHIOiMsJEeGcpYLjrc9dDeGt78eBOhy738c/doy9P4AasiCNfyMJTJoZE7yah0ZHkmF6QYyD/IaHdMT3lYlQkzq05cUYohrsCfP8XcZO3e9DjDNt5TPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9nYBiQz; arc=none smtp.client-ip=74.125.230.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9nYBiQz"
Received: by mail-lr2-f11.google.com with SMTP id 38308e7fff4ca-3a49e9e7cd8so25932201fa.1
        for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 05:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789473977; x=1790078777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WuLMGh0XOazeaknZ4mouWBM1qCV14oE/XC3P1nwDqwk=;
        b=C9nYBiQzQZtHErsA8fNyzbcIXDEE7wqFu5H1CBf+6EAPtNYFvUEv4jZORiWChpO8DH
         WEhmuHOj8hd0m6OdpnK4YRFkB02wrxJvc5KaX8j8dNhRMvcLX70wi3N1esKWmsVulF/9
         ysfuea5FV8WcoUE1FQToLUC+6wSIknHHwex9mhI9o94wgRsDI2TW8Qy7I4LxktLHL3aQ
         IdaaIIv9YrQIoUYLzjSvJ22Y77eTM6beExg0CKzPmxyHWQ3b+ScYwxVON3IdwW8tcWND
         SqtYgn9WyogFju6xT4CdTh+v2AMd8wBL+6wczURhc0E1qX5oHk/eEbAFe3mP5HiWNrPK
         gEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473977; x=1790078777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WuLMGh0XOazeaknZ4mouWBM1qCV14oE/XC3P1nwDqwk=;
        b=D3Y55XDTXy23i1SShdfsZbo6ofkSfUB4lh3X4HkeQhiSd9aqX8aIvkW309v9YMArF8
         JisjGamj7J9ESzS3JRUeXsfCf5hqng2p+xw6yCQb5ws0EWoDx7vv1LCa9BaBfNIBTD73
         hO+RfNqHvQXmCDJu2SsSHEKb+47cyIob6eQ9d3NMINAv0FZD/uiydXm39ZIXqH7OV+L5
         ZwwMAv24U7LR5TM90WaSaRja6mua9BHAbNicp8k7yv279nlAiiXWGVjP5HtG4t/rums3
         hXQvQLUuzmN9/CD1+Kg+EYME4C4jx85e72Jlvq3Su/l6JvNAOCDBVv0anfgmTVm5N9Ww
         ecCw==
X-Forwarded-Encrypted: i=1; AKwUvBwQnhRq/xaFMIDlsyiQxrRw7L9fIFdIGoE4AMRGHwsUSlN5LWxLFYIPbMsctsj8SdIIeIbM+sfv1rY=@vger.kernel.org
X-Gm-Message-State: AFuF++ldigJ67BtsPwrd7Yjd4l/gNsicq4fUz2mm4cCkzUO6nk3KSo/i
	n2EFubSYt0XByseBwryVHlB4H4IE0P/+34bahY0SyL1FmeGWM3rZm+pY
X-Gm-Gg: AYBFou1RLnZZH3Z/A4sbJ8Wm9O7vmYHDzZ0F4XpoetDHFeICCwUJbJVpl4WqCfEzcha
	MjtZypf6JG094dhkzofg75nosEJIFAOuj0gf5VIUcfmL9g2U3zXFDGYi1batTShRIFPeCB/m2Fp
	5ljT7UFHe6zVAZ1rIZwa66ji7hoNSvsfDXRFt4n2ymd02saefzIJTgofR2SVuozWtf96rJKj+dU
	cU/vvXof0+Ru5iO/LIjR3Xc0WIdN1mOFw4SturwsB0UmOG/qkLn10nEw2Pyaqjzx3ZsxGUT4jeG
	iv4ABE/34dLpRETKuML+cX3FvjySMHCWO5X7cmuDdghKyOb5eBUu+kGEHaYSWJy7z7lxaaqNZ+K
	4iGshnrwMtVdYKB7ygCJp7NCkTth2ZcWF2EDYlhs92TTCskbU3YwK1xczk+LwzXUyQjwXqrYmh9
	AbI1TV5Fe8M6ib9XyfC568NgttAOcE8eyXoD07mb9bR7FXuncyrtbXKBKmx31HhDhSsGnJe8ecm
	6ztGIobfYXpt/H2HWXhN57SO54=
X-Received: by 2002:a05:6512:1052:b0:5b6:1a7c:fd98 with SMTP id 2adb3069b0e04-5b8b4fd5a9bmr186841e87.62.1789473976400;
        Tue, 15 Sep 2026 05:06:16 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047fd4fsm3186416e87.82.2026.09.15.05.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:06:15 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Koichiro Den <den@valinux.co.jp>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 5.10] dmaengine: dw-edma-pcie: Reject devices without driver data
Date: Tue, 15 Sep 2026 15:05:56 +0300
Message-ID: <20260915120559.106666-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Koichiro Den <den@valinux.co.jp>

commit 11d7cfe0c119691b2dafbb699bbca90258c678aa upstream.

dw_edma_pcie_probe() treats the PCI device ID driver_data as the
template for the controller layout and copies it unconditionally. A
device bound dynamically via sysfs can match the driver without that
data, which leads to a NULL pointer dereference.

Reject such matches before enabling the device.

Fixes: 41aaff2a2ac0 ("dmaengine: Add Synopsys eDMA IP PCIe glue-logic")
Signed-off-by: Koichiro Den <den@valinux.co.jp>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Link: https://patch.msgid.link/20260521142153.2957432-3-den@valinux.co.jp
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2026-72147

 drivers/dma/dw-edma/dw-edma-pcie.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index 987ede1087dd..95d60feca391 100644
--- a/drivers/dma/dw-edma/dw-edma-pcie.c
+++ b/drivers/dma/dw-edma/dw-edma-pcie.c
@@ -104,6 +104,9 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 	struct dw_edma *dw;
 	int i, mask;
 
+	if (!pdata)
+		return -ENODEV;
+
 	/* Enable PCI device */
 	err = pcim_enable_device(pdev);
 	if (err) {
-- 
2.53.0

