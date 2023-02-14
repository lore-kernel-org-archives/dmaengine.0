Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A32C64EC7
	for <dmaengine@archiver.kernel.org>; Tue, 14 Feb 2023 15:21:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232997AbjBNPV0 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 14 Feb 2023 10:21:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjBNPVT (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Tue, 14 Feb 2023 10:21:19 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5376298E7;
        Tue, 14 Feb 2023 07:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676388065; x=1707924065;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MoXoU31ArhE8FDW59rzMPaTdif2Rdo/JdPDq2bLPVJQ=;
  b=1ksMsmxpjAvXdpfYlbvV9KetGen/L5KbFkW5CfGmaO8DSxK+1b6Hqa6K
   SNfcup4lScZeQSDHIIXMMuluwPhlSudLUq+A6DJqBRHL3M9bDpMi/ZOhn
   VQLY5yFRzui5V9m8huyjdkZBPs5W13LBLRYJNpBa/SGIhAS+6Kmc5ZdeZ
   8vH3ZMaFx14HwQDvTCNnJL3gEVFfrCj+7Akb5wSk77Kyi1TxvwkHR4QQL
   UqB44HHbfPi8QefdSVi6XeNHcexb854jI+FE+Wl54XBbQfpFI+0IyHvw7
   88D0MaDLMo69QTM8/GUfkYRWDTXfHhD5TIum/7uvCKvh69VEntpjLi6Lm
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,296,1669100400"; 
   d="scan'208";a="200468521"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Feb 2023 08:21:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 14 Feb 2023 08:20:58 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Tue, 14 Feb 2023 08:20:55 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <ludovic.desroches@microchip.com>, <tudor.ambarus@linaro.org>,
        <vkoul@kernel.org>, <nicolas.ferre@microchip.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 6/7] dmaengine: at_xdmac: add a warning message regarding for unpaused channels
Date:   Tue, 14 Feb 2023 17:18:26 +0200
Message-ID: <20230214151827.1050280-7-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214151827.1050280-1-claudiu.beznea@microchip.com>
References: <20230214151827.1050280-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Add a warning message on suspend to let the user that there are channels
not paused by their consumers.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/dma/at_xdmac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index 96f1b69f8a75..7ff6ca01e0b5 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -2154,6 +2154,8 @@ static int __maybe_unused atmel_xdmac_suspend(struct device *dev)
 		atchan->save_cc = at_xdmac_chan_read(atchan, AT_XDMAC_CC);
 		if (at_xdmac_chan_is_cyclic(atchan)) {
 			if (!at_xdmac_chan_is_paused(atchan)) {
+				dev_warn(chan2dev(chan), "%s: channel %d not paused\n",
+					 __func__, chan->chan_id);
 				at_xdmac_device_pause_internal(atchan);
 				at_xdmac_runtime_suspend_descriptors(atchan);
 			}
-- 
2.34.1

