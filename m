Return-Path: <SRS0=m5Qb=3E=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 241D5C33CB1
	for <dmaengine@archiver.kernel.org>; Wed, 15 Jan 2020 14:25:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EBD20214AF
	for <dmaengine@archiver.kernel.org>; Wed, 15 Jan 2020 14:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579098352;
	bh=j9yEfBDHhl+/vGQXG9FN/ORRlqtP/XAwny5T+hPsUVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=KDZbl9ZkjeRVnXMFw3Q+/JXUB3yVLgVlfLmLrhYd32uf5/C3WC6giIMgAhk0FxCeB
	 pLFFKM1GF710fKU1c+LG6dZO07SAq2U/cUUW1qgVHzZh5uD2fKZkpns4OJKZ0wsG0M
	 YJzc+CbEtp5wcwiJHevswzKvz4pKJL/B/3q5b94E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728978AbgAOOZv (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 15 Jan 2020 09:25:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:56214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726248AbgAOOZv (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 15 Jan 2020 09:25:51 -0500
Received: from localhost (unknown [49.207.51.160])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D56F62073A;
        Wed, 15 Jan 2020 14:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579098350;
        bh=j9yEfBDHhl+/vGQXG9FN/ORRlqtP/XAwny5T+hPsUVU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=03MtiPEbz1i6sSJvezDHWfrAss5uRCGxKCCGQW6SSPxlW9Vd/wQriScmQof2+eopa
         EAe6RmCEpUlAe72Cgs+7FGMqztbCvifGxme4U4YwdWDQvOHkFNuFMvoDygYJijOzBr
         IAhoko6A4S5rboOsJagr3cjmSP9FxuX95h7kPKWI=
Date:   Wed, 15 Jan 2020 19:55:34 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Zhou Wang <wangzhou1@hisilicon.com>
Cc:     Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org,
        linuxarm@huawei.com, Zhenfa Qiu <qiuzhenfa@hisilicon.com>
Subject: Re: [PATCH v4] dmaengine: hisilicon: Add Kunpeng DMA engine support
Message-ID: <20200115142534.GM2818@vkoul-mobl>
References: <1577932428-217801-1-git-send-email-wangzhou1@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577932428-217801-1-git-send-email-wangzhou1@hisilicon.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 02-01-20, 10:33, Zhou Wang wrote:

> +#define HISI_DMA_SQ_BASE_L(i)		(0x0 + (i) * 0x100)
> +#define HISI_DMA_SQ_BASE_H(i)		(0x4 + (i) * 0x100)
> +#define HISI_DMA_SQ_DEPTH(i)		(0x8 + (i) * 0x100)
> +#define HISI_DMA_SQ_TAIL_PTR(i)		(0xc + (i) * 0x100)
> +#define HISI_DMA_CQ_BASE_L(i)		(0x10 + (i) * 0x100)
> +#define HISI_DMA_CQ_BASE_H(i)		(0x14 + (i) * 0x100)
> +#define HISI_DMA_CQ_DEPTH(i)		(0x18 + (i) * 0x100)
> +#define HISI_DMA_CQ_HEAD_PTR(i)		(0x1c + (i) * 0x100)
> +#define HISI_DMA_CTRL0(i)		(0x20 + (i) * 0x100)
> +#define HISI_DMA_CTRL0_QUEUE_EN_S	0
> +#define HISI_DMA_CTRL0_QUEUE_PAUSE_S	4
> +#define HISI_DMA_CTRL1(i)		(0x24 + (i) * 0x100)
> +#define HISI_DMA_CTRL1_QUEUE_RESET_S	0
> +#define HISI_DMA_Q_FSM_STS(i)		(0x30 + (i) * 0x100)
> +#define HISI_DMA_FSM_STS_MASK		GENMASK(3, 0)
> +#define HISI_DMA_INT_STS(i)		(0x40 + (i) * 0x100)
> +#define HISI_DMA_INT_STS_MASK		GENMASK(12, 0)
> +#define HISI_DMA_INT_MSK(i)		(0x44 + (i) * 0x100)

These really sound as offset + i * 0x100, so I think it might be better
to define this as:

define HISI_DMA_SQ_BASE_L               0x0
with HISI_DMA_OFFSET                    0x100

and then use read/write accessors:

hisi_channel_read(... , register, index)
{
        return readl( register + index * HISI_DMA_OFFSET)
}

> +#define HISI_DMA_MODE			0x217c
> +
> +#define HISI_DMA_MSI_NUM		30
> +#define HISI_DMA_CHAN_NUM		30
> +#define HISI_DMA_Q_DEPTH_VAL		1024
> +
> +#define PCI_DEVICE_ID_HISI_DMA		0xa122

This is used only once so can be removed

> +static void hisi_dma_reset_hw_chan(struct hisi_dma_chan *chan)
> +{
> +	struct hisi_dma_dev *hdma_dev = chan->hdma_dev;
> +	u32 index = chan->qp_num, tmp;
> +	int ret;
> +
> +	hisi_dma_pause_dma(hdma_dev, index, true);
> +	hisi_dma_enable_dma(hdma_dev, index, false);
> +	hisi_dma_mask_irq(hdma_dev, index);
> +
> +	ret = readl_relaxed_poll_timeout(hdma_dev->base +
> +		HISI_DMA_Q_FSM_STS(index), tmp,
> +		FIELD_GET(HISI_DMA_FSM_STS_MASK, tmp) != RUN, 10, 1000);
> +	if (ret) {
> +		dev_err(&hdma_dev->pdev->dev, "disable channel timeout!\n");
> +		BUG_ON(1);

we dont kill kernel on this! you should probably complain violently
(dump_stack() etc)...)

-- 
~Vinod
