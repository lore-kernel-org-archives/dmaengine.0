Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 452F9C4332F
	for <dmaengine@archiver.kernel.org>; Thu, 17 Nov 2022 13:11:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239501AbiKQNLD (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 17 Nov 2022 08:11:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234917AbiKQNLD (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Thu, 17 Nov 2022 08:11:03 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44CE160682;
        Thu, 17 Nov 2022 05:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668690661; x=1700226661;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BvAhCZX5jyhhgDIoTNyg7a+Vt6u/p3FEXo7UlgQYAVA=;
  b=Rl97SqFBN60QzyaqIbl8U238gx8L/4vTtVNuvfE5H2B4uSFINKrLuRI2
   nCM4El1bBUmR0cF/thblPYiWOQLeJ2PCRbdntC63tjuG99gCKenCBFf3/
   wJ0Ph746UJM1mFkBXEcKzFjH6SdxNMO6egG4FFoXZxvgYbLv7dS8xVfcu
   31nEWEBypZKe+gitG6BCkq+5OpuMe74evwbxDUKLd3r7fdibgDm9OmHz6
   STElAvZzzthIn7rZMatQ5nnsPLMo7DH7z18a8SjwkWP/O7/upKJTwPZtk
   2eV+7Xd+K6Mf1RmoIGd/Z2fJoztZ62fFHQeknOvf4vBcq5I5LjlX4z9Pp
   A==;
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="200217638"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Nov 2022 06:11:00 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 17 Nov 2022 06:11:00 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Thu, 17 Nov 2022 06:10:59 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <tudor.ambarus@microchip.com>, <vkoul@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [RESEND][PATCH 0/3] dmaengine: at_xdmac: add support for runtime pm
Date:   Thu, 17 Nov 2022 15:15:44 +0200
Message-ID: <20221117131547.293044-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Hi,

The series add support for runtime PM on at_xdmac driver (patch 1/3).
This will enable/disable controller's clock based on work submitted to it.
Along with it I took the chance and added 2 minor cleanups (patches 2/3,
3/3).

Thank you,
Claudiu Beznea

Claudiu Beznea (3):
  dmaengine: at_xdmac: add runtime pm support
  dmaengine: at_xdmac: align properly function members
  dmaengine: at_xdmac: remove empty line

 drivers/dma/at_xdmac.c | 220 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 203 insertions(+), 17 deletions(-)

-- 
2.34.1

