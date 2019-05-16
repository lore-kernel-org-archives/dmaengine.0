Return-Path: <SRS0=cEgb=TQ=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A624DC04AAF
	for <dmaengine@archiver.kernel.org>; Thu, 16 May 2019 15:54:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7801320833
	for <dmaengine@archiver.kernel.org>; Thu, 16 May 2019 15:54:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Hh73VGfL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfEPPyB (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 16 May 2019 11:54:01 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:18307 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfEPPyA (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Thu, 16 May 2019 11:54:00 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cdd876e0000>; Thu, 16 May 2019 08:53:18 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 16 May 2019 08:53:59 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 16 May 2019 08:53:59 -0700
Received: from HQMAIL102.nvidia.com (172.18.146.10) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 May
 2019 15:53:59 +0000
Received: from HQMAIL103.nvidia.com (172.20.187.11) by HQMAIL102.nvidia.com
 (172.18.146.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 May
 2019 15:53:58 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 16 May 2019 15:53:58 +0000
Received: from moonraker.nvidia.com (Not Verified[10.21.132.148]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cdd87960000>; Thu, 16 May 2019 08:53:58 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Laxman Dewangan <ldewangan@nvidia.com>,
        Vinod Koul <vkoul@kernel.org>
CC:     <dmaengine@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Sameer Pujar <spujar@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 0/3] dmaengine: tegra210-adma: Fixes for v5.2
Date:   Thu, 16 May 2019 16:53:51 +0100
Message-ID: <1558022034-19911-1-git-send-email-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558021998; bh=pM+YOCbQto1OejUghfBuIjZ6bFWGQspblKysmdA8HuY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=Hh73VGfLUKbOJEnmwKX59lD4pfDH7K4bOiycxLKDifmfxvGa6zEPo/4+pNfu8ZsXE
         7WT0uVi9obA86nuqhJQ+xHuqkXdSvlLDW0FK85e3418VKmhiwDlgqY1m9D8XRSuPgv
         AVjT5PCcMs7OOEFcKKVcNNJZAOTyy6OzZy5+XHy3a+4FZ0+pes+vnkJ7X2GIHxxKv6
         +GL5AwfQxMI6d+Zbm7ThNUkK9P82SI8VTgcGrr8o0eYy0Ghfs/9hwT3klp/+mugwEO
         O0xgFMIs5s5BUOGt0SOeNHyRUbyKRjE8qGw+EYOzvq9fx58gNmaHZmWMm3LZ6gXUFA
         parnkFqqjs1Cg==
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Here are 3 fixes for the Tegra210 ADMA driver for v5.2.

Jon Hunter (3):
  dmaengine: tegra210-adma: Fix crash during probe
  dmaengine: tegra210-adma: Fix channel FIFO configuration
  dmaengine: tegra210-adma: Fix spelling

 drivers/dma/tegra210-adma.c | 57 ++++++++++++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 21 deletions(-)

-- 
2.7.4

