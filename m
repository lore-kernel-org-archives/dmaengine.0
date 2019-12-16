Return-Path: <SRS0=aXT2=2G=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0940DC43603
	for <dmaengine@archiver.kernel.org>; Mon, 16 Dec 2019 11:49:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D0F90206EC
	for <dmaengine@archiver.kernel.org>; Mon, 16 Dec 2019 11:49:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YcrY96FE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727241AbfLPLta (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 16 Dec 2019 06:49:30 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:49196 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727199AbfLPLta (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 16 Dec 2019 06:49:30 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBGBn9OX094329;
        Mon, 16 Dec 2019 05:49:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576496949;
        bh=nGVCHx75cu0pEAfo0Qae/2CuVSK8AxUIsg6p2K/zw6Y=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=YcrY96FE0Oawv4LmOTXnxnKYXUidfUCzDoSKXKmrbXPPaHbvg25RMwMvkC65OV1CK
         LNHHUUpM2eFDtOvq3QupAa/uw9zSyL5WqU22lCXkml0eSYJ6A48LNmzNaoBxNje5j1
         xsTT24nLN7+CQERTLQACsrY3Co1JqmHXMIaAkoro=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBGBn9hR085008;
        Mon, 16 Dec 2019 05:49:09 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Dec 2019 05:49:09 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Dec 2019 05:49:09 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBGBn6cL124255;
        Mon, 16 Dec 2019 05:49:06 -0600
Subject: Re: [PATCH v3 0/9] dmaengine: virt-dma related fixes
To:     Sascha Hauer <s.hauer@pengutronix.de>, <dmaengine@vger.kernel.org>
CC:     Vinod Koul <vkoul@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Green Wan <green.wan@sifive.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
        Sean Wang <sean.wang@mediatek.com>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>
References: <20191216105328.15198-1-s.hauer@pengutronix.de>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <e3ab3aba-6d64-ff42-8353-9ae6a0f377be@ti.com>
Date:   Mon, 16 Dec 2019 13:49:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191216105328.15198-1-s.hauer@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org



On 16/12/2019 12.53, Sascha Hauer wrote:
> Several drivers call vchan_dma_desc_free_list() or vchan_vdesc_fini() under
> &vc->lock. This is not allowed and the first two patches fix this up. If you
> are a DMA driver maintainer, the first two patches are the reason you are on
> Cc.
> 
> The remaining patches are the original purpose of this series:
> The i.MX SDMA driver leaks memory when a currently running descriptor is
> aborted. Calling vchan_terminate_vdesc() on it to fix this revealed that
> the virt-dma support calls the desc_free with the spin_lock held. This
> doesn't work for the SDMA driver because it calls dma_free_coherent in
> its desc_free hook. This series aims to fix that up.

for drivers/dma/virt-dma.* :
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Tested-by: Peter Ujfalusi <peter.ujfalusi@ti.com>


> Changes since v2:
> - change drivers to not call vchan_dma_desc_free_list() under spin_lock
> - remove debug message from vchan_dma_desc_free_list()
> 
> Changes since v1:
> - rebase on v5.5-rc1
> - Swap patches 1 and 2 for bisectablity
> - Rename desc_aborted to desc_terminated
> - Free up terminated descriptors immediately instead of letting them accumulate
> 
> Sascha Hauer (9):
>   dmaengine: bcm2835: do not call vchan_vdesc_fini() with lock held
>   dmaengine: virt-dma: Add missing locking
>   dmaengine: virt-dma: remove debug message
>   dmaengine: virt-dma: Do not call desc_free() under a spin_lock
>   dmaengine: virt-dma: Add missing locking around list operations
>   dmaengine: virt-dma: use vchan_vdesc_fini() to free descriptors
>   dmaengine: imx-sdma: rename function
>   dmaengine: imx-sdma: find desc first in sdma_tx_status
>   dmaengine: imx-sdma: Fix memory leak
> 
>  drivers/dma/bcm2835-dma.c                     |  5 +--
>  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    |  8 +---
>  drivers/dma/imx-sdma.c                        | 37 +++++++++++--------
>  drivers/dma/mediatek/mtk-uart-apdma.c         |  3 +-
>  drivers/dma/owl-dma.c                         |  3 +-
>  drivers/dma/s3c24xx-dma.c                     | 22 +++++------
>  drivers/dma/sf-pdma/sf-pdma.c                 |  4 +-
>  drivers/dma/sun4i-dma.c                       |  3 +-
>  drivers/dma/virt-dma.c                        | 10 ++---
>  drivers/dma/virt-dma.h                        | 27 ++++++++------
>  10 files changed, 63 insertions(+), 59 deletions(-)
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
