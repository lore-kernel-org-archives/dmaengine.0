Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FE2C07E98
	for <dmaengine@archiver.kernel.org>; Mon,  5 Jul 2021 08:41:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 939F3613C2
	for <dmaengine@archiver.kernel.org>; Mon,  5 Jul 2021 08:41:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbhGEIoT (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 5 Jul 2021 04:44:19 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:9465 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbhGEIoS (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 5 Jul 2021 04:44:18 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GJJxK6H6czZqtJ;
        Mon,  5 Jul 2021 16:38:29 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 5 Jul 2021 16:41:40 +0800
Received: from [10.174.176.221] (10.174.176.221) by
 dggema762-chm.china.huawei.com (10.1.198.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 5 Jul 2021 16:41:39 +0800
Subject: Re: [PATCH 2/3] dmaengine: usb-dmac: Fix PM reference leak in
 usb_dmac_probe()
To:     Vinod Koul <vkoul@kernel.org>, Johan Hovold <johan@kernel.org>
CC:     <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <michal.simek@xilinx.com>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <yi.zhang@huawei.com>
References: <20210517081826.1564698-1-yukuai3@huawei.com>
 <20210517081826.1564698-3-yukuai3@huawei.com>
 <YLRfZfnuxc0+n/LN@vkoul-mobl.Dlink>
 <b6c340de-b0b5-6aad-94c0-03f062575b63@huawei.com>
 <YLSk/i6GmYWGEa9E@vkoul-mobl.Dlink> <YLSqD+9nZIWJpn+r@hovoldconsulting.com>
 <YLi4VGwzrat8wJHP@vkoul-mobl> <YL3TlDqe4KSr3ICl@hovoldconsulting.com>
 <YL3ynd1KiJoe9y6+@vkoul-mobl>
From:   "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <c8fcdaa1-f053-47aa-2dad-521b8f34b8d1@huawei.com>
Date:   Mon, 5 Jul 2021 16:41:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <YL3ynd1KiJoe9y6+@vkoul-mobl>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.221]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Hi, Vinod

Are you still intrested in accepting this patch?

Thanks,
Yu Kuai

On 2021/06/07 18:19, Vinod Koul wrote:
> On 07-06-21, 10:06, Johan Hovold wrote:
>> On Thu, Jun 03, 2021 at 04:39:08PM +0530, Vinod Koul wrote:
>>> On 31-05-21, 11:19, Johan Hovold wrote:
>>>> On Mon, May 31, 2021 at 02:27:34PM +0530, Vinod Koul wrote:
>>>>> On 31-05-21, 14:11, yukuai (C) wrote:
>>>>>> On 2021/05/31 12:00, Vinod Koul wrote:
>>>>>>> On 17-05-21, 16:18, Yu Kuai wrote:
>>>>>>>> pm_runtime_get_sync will increment pm usage counter even it failed.
>>>>>>>> Forgetting to putting operation will result in reference leak here.
>>>>>>>> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
>>>>>>>> counter balanced.
>>
>>>>> Yes the rumtime_pm is disabled on failure here and the count would have
>>>>> no consequence...
>>>>
>>>> You should still balance the PM usage counter as it isn't reset for
>>>> example when reloading the driver.
>>>
>>> Should I driver trust that on load PM usage counter is balanced and not
>>> to be reset..?
>>
>> Not sure what you're asking here. But a driver should never leave the PM
>> usage counter unbalanced.
> 
> Thinking about again, yes we should safely assume the counter is
> balanced when driver loads.. so unloading while balancing sounds better
> behaviour
> 
> Thanks
> 
