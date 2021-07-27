Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DC7C4338F
	for <dmaengine@archiver.kernel.org>; Tue, 27 Jul 2021 04:47:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 978256108C
	for <dmaengine@archiver.kernel.org>; Tue, 27 Jul 2021 04:47:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235063AbhG0ErU (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 27 Jul 2021 00:47:20 -0400
Received: from mx.socionext.com ([202.248.49.38]:28107 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235038AbhG0ErS (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 27 Jul 2021 00:47:18 -0400
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 27 Jul 2021 13:47:18 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 58A15201C948;
        Tue, 27 Jul 2021 13:47:18 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 27 Jul 2021 13:47:18 +0900
Received: from yuzu2.css.socionext.com (yuzu2 [172.31.9.57])
        by kinkan2.css.socionext.com (Postfix) with ESMTP id C3967B633F;
        Tue, 27 Jul 2021 13:47:17 +0900 (JST)
Received: from [10.212.29.138] (unknown [10.212.29.138])
        by yuzu2.css.socionext.com (Postfix) with ESMTP id 8BB64B1D52;
        Tue, 27 Jul 2021 13:47:17 +0900 (JST)
Subject: Re: [bug report] dmaengine: uniphier-xdmac: Add UniPhier external DMA
 controller driver
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     dmaengine@vger.kernel.org
References: <20210726073436.GA9691@kili>
 <3e36256e-d7ac-f727-c714-b79f3d1d1da7@socionext.com>
Message-ID: <8671e63b-fcf4-6a21-045a-b05c4b3b4b69@socionext.com>
Date:   Tue, 27 Jul 2021 13:47:17 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3e36256e-d7ac-f727-c714-b79f3d1d1da7@socionext.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Hi,

On 2021/07/27 13:05, Kunihiko Hayashi wrote:
> Hi Dan,
> Thank you for reporting.
> 
> On 2021/07/26 16:34, Dan Carpenter wrote:
>> Hello Kunihiko Hayashi,
>>
>> The patch 667b9251440b: "dmaengine: uniphier-xdmac: Add UniPhier
>> external DMA controller driver" from Feb 21, 2020, leads to the
>> following static checker warning:
>>
>>     drivers/dma/uniphier-xdmac.c:212 uniphier_xdmac_chan_stop()
>>     warn: sleeping in atomic context
>>
>> drivers/dma/uniphier-xdmac.c
>>      197 static int uniphier_xdmac_chan_stop(struct uniphier_xdmac_chan *xc)
>>      198 {
>>      199     u32 val;
>>      200
>>      201     /* disable interrupt */
>>      202     val = readl(xc->reg_ch_base + XDMAC_IEN);
>>      203     val &= ~(XDMAC_IEN_ENDIEN | XDMAC_IEN_ERRIEN);
>>      204     writel(val, xc->reg_ch_base + XDMAC_IEN);
>>      205
>>      206     /* stop XDMAC */
>>      207     val = readl(xc->reg_ch_base + XDMAC_TSS);
>>      208     val &= ~XDMAC_TSS_REQ;
>>      209     writel(0, xc->reg_ch_base + XDMAC_TSS);
>>      210
>>      211     /* wait until transfer is stopped */
>> --> 212     return readl_poll_timeout(xc->reg_ch_base + XDMAC_STAT, val,
>>      213                   !(val & XDMAC_STAT_TENF), 100, 1000);
>>                                                                      ^^^
>> This is doing a 100 us sleep but both callers hold a spin lock.
> 
> Yes, this waiting code is in spin lock context.
> I think that the function needs to be rewritten in tasklet.

I found this can be simply replaced with readl_poll_timeout_atomic().
I'll fix it.

Thank you,
---
Best Regards
Kunihiko Hayashi
