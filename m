Return-Path: <SRS0=mdab=SQ=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E51C10F13
	for <dmaengine@archiver.kernel.org>; Sun, 14 Apr 2019 15:20:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 099D12084E
	for <dmaengine@archiver.kernel.org>; Sun, 14 Apr 2019 15:20:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="laGdOkGT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbfDNPUi (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Sun, 14 Apr 2019 11:20:38 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36282 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbfDNPUi (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Sun, 14 Apr 2019 11:20:38 -0400
Received: by mail-pf1-f196.google.com with SMTP id z5so7366679pfn.3;
        Sun, 14 Apr 2019 08:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OfFfp+7y/J/7fDjQ8vMbuBCRqlfSyEKyG8DVP1HnbZs=;
        b=laGdOkGTsCkbzb0qPA5GLLSPZ7pfSU/PB6Aydc+D8eXfOPF20VpCY/VIv5i804Vzc2
         8jn2iSFrJGH+ELJ65NWgDrs/NXT+oiQbOAkwS48Xira6RHyBoi0Qmqsb0SOSOwuktNJq
         i0bfPqgmPQTaMkAJTVnbyxCbbJg3B7Vm0ONM6RDyc9OgtnRajUwhRLhR/WcP9x40QxOV
         yl4f97GQH4w9iKFUNwCflGoAmL80XruXQXD5QpzCn2eWf+5YmKmzGPLc0gxsh3B4F7lK
         wQ/hphPEDw6tq1uNooniPkWhGd0TstV4/zjHAthH1ndRHRhiIlhocYvoC1GEaFh0mpSB
         3e1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OfFfp+7y/J/7fDjQ8vMbuBCRqlfSyEKyG8DVP1HnbZs=;
        b=d6fBSS3OfmdB24cjGfsQOWe5yxMy/7DEiuGutrpBlE0ffBSyqQ9UILxnuTocCyWym8
         GIecH3zPfFLAfb7phqLHXZaHnQgQkanAOFM+m7TU4h9wOilrL/BpySEJ+z3kTecleAt8
         2RbDkq7a4iZGLbSGu+NkoLE24TN9eMbzVMBWvQW6JeY/A/LpiTCONZAnAq+7J0KfOlP8
         d1wxudwpALLMiDbQJrQVpy8vcGEZxjumj25woXoWfzVmWgXrnYkFzGf3OxeeNDV4Hjh3
         nDvdJ2TVJwkN6ffpFvEebuXU+z+naKGU3OjOMlqwjvkkJU/Cwc2VfpR1ywYNtEvIjTm1
         FkNw==
X-Gm-Message-State: APjAAAWmeQCZ26L9MMCIN9+GrHYsBHkxckzsL210DmPTZMSZNqYcCo5R
        AnjNUurxjVcxM26OLFoz79NdxWyy
X-Google-Smtp-Source: APXvYqyzKASy8A05H8RNeWgd2RegrKj0q8vUCp7soz2W0ydLeL6n5k+Y9m/0gTVzFqRI3cbnVShbEw==
X-Received: by 2002:a65:6546:: with SMTP id a6mr65296581pgw.5.1555255237312;
        Sun, 14 Apr 2019 08:20:37 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
        by smtp.googlemail.com with ESMTPSA id q80sm91627419pfa.66.2019.04.14.08.20.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 14 Apr 2019 08:20:36 -0700 (PDT)
Subject: Re: [PATCH 4/6] dma: tegra: add accurate reporting of dma state
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     dan.j.williams@intel.com, vkoul@kernel.org, ldewangan@nvidia.com,
        dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20181031160309.20408-1-ben.dooks@codethink.co.uk>
 <20181031160309.20408-5-ben.dooks@codethink.co.uk>
 <5b955473-92fd-e4b9-d136-8df3e11525c1@gmail.com>
 <92e2651e-393a-e958-123b-355741a34f80@codethink.co.uk>
 <2d324d93-b869-8ae8-bfc7-789cdb5976b4@gmail.com>
 <3e1ab7c6-c820-a812-e879-a69344805fed@codethink.co.uk>
 <85a8afa6-8b0d-dcc2-3254-a79cf90e90df@gmail.com>
Message-ID: <687294f3-aeb5-f17f-bf7d-886346baf02d@gmail.com>
Date:   Sun, 14 Apr 2019 18:20:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <85a8afa6-8b0d-dcc2-3254-a79cf90e90df@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
Message-ID: <20190414152027.UsV_JI5bUumRpaaz_SSVlOkJ8OGCYyOt9u5Ykb77HHU@z>

22.02.2019 21:10, Dmitry Osipenko пишет:
> 22.02.2019 20:23, Ben Dooks пишет:
>> On 21/02/2019 13:02, Dmitry Osipenko wrote:
>>> 21.02.2019 13:06, Ben Dooks пишет:
>>>> On 21/02/2019 00:41, Dmitry Osipenko wrote:
>>>>> 31.10.2018 19:03, Ben Dooks пишет:
>>>>>> The tx_status callback does not report the state of the transfer
>>>>>> beyond complete segments. This causes problems with users such as
>>>>>> ALSA when applications want to know accurately how much data has
>>>>>> been moved.
>>>>>>
>>>>>> This patch addes a function tegra_dma_update_residual() to query
>>>>>> the hardware and modify the residual information accordinly. It
>>>>>> takes into account any hardware issues when trying to read the
>>>>>> state, such as delays between finishing a buffer and signalling
>>>>>> the interrupt.
>>>>>>
>>>>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>>>>
>>>>> Hello Ben,
>>>>>
>>>>> Do you have any plans to submit a new version of this patch? It's really useful and fixes a real problem with the audio playback. I could help with finalizing the patch and could submit it for you if you happened to lost the interest.
>>>>
>>>> Personally I think the original version was fine. It has been tested
>>>> and returns fairly quickly (I am not a fan of just adding more delay in)
>>>>
>>>> My notes say the condition doesn't last for long and the loop tends
>>>> to terminate within 2 runs.
>>>>
>>>
>>> Okay, so are you going to re-send the patch? We can back to the review after, you need at least to re-send because this series has been outdated. Also please take a look and feel free to use as-is the reduced variant of yours patch that I was carrying and testing for months now [0], it works great.
>>>
>>> [0] https://github.com/grate-driver/linux/commit/ab8a67a6f47185f265f16749b55df214aaaefad4
>>>
>>
>> I can try rebasing, but I have not got a lot of time to do any testing
>> at the moment. I agree I should have remembered to chase this stuff up
>> earlier.
> 
> No problems, thank you. I'll help with the testing. And I could rebase the patch and send it out for you if will be needed, please just let me know if you're okay with it.
> 

Hello Ben,

Do you have any status update on the state of the patch? Again, I could help with sending it out for you if you're too busy or something else. Please let me know how we could proceed with getting the fix upstreamed and sorry for disturbing you again with this.
