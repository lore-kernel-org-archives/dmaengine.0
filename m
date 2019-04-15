Return-Path: <SRS0=BZfm=SR=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3CAC10F0E
	for <dmaengine@archiver.kernel.org>; Mon, 15 Apr 2019 16:56:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C3282077C
	for <dmaengine@archiver.kernel.org>; Mon, 15 Apr 2019 16:56:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMJvkaR8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbfDOQ4a (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 15 Apr 2019 12:56:30 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37607 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbfDOQ4a (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 15 Apr 2019 12:56:30 -0400
Received: by mail-lf1-f66.google.com with SMTP id o19so9320030lfl.4;
        Mon, 15 Apr 2019 09:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tClfXadjyrF6+aZMAlT2go17OlVy7BVazY0h6iOGTFc=;
        b=iMJvkaR8VlaAU0rvlFWZUmBw6sNF+Vzz83del1bUA3oLmq9Nv3cg4z83ULZsj9yKyK
         mTridcJMoShxEidfOkmg1wlvY6qdJRFvioXMBvdxj7RtDtM0APBtdEa3jI/LTgSdl61p
         NFn7aX3BnvLwnAsFk5XtthXV3ntRChnoJbm93t5e7gGExR/oO8tEjZa6vltJ1htGxh6p
         oLeUSeYvx8QS7eicVWekGoe4B543WyXGgrZbWgqbYYUdVqw1Mv8CMiitNh42Ru5eRIDg
         Q84SSYWzmJ32RgFdv8rO//gxMovzBtTfZmJ02oVPLa6tDf5QJ7ZXBNlUVU0hcziFnki2
         bPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tClfXadjyrF6+aZMAlT2go17OlVy7BVazY0h6iOGTFc=;
        b=HtA/3W19QaBMnMKxjSkbhoTANldoYIqV6KdqVf1UQEJDLnFZR8SIMC+K1rnjfTPLlq
         uwgONQnzIOc2pFgul4HhnUv3R+HeeBVpO0xGWyj+l2GwUf4p178mAegfIbw7SNygl8eQ
         AhMsNPMcvHfZTjcrWfuMmDB07zJ1FvdZZO2PLibRAEy/ZnJyzs0WKaI7zHtMwyrNGCFg
         vKl2+EGe4ijhttuSSPPTErlCqypQ6jsY7HZPj0vu1Tmx/G2InoSSASMaauVlHlCZ05Fv
         RauJoztLlgtqjlGnd9kN2LMInGo87QGBOGWv2qHMXG5o8uGmDz6GGSMt+vuhCOfY+wpK
         b7aw==
X-Gm-Message-State: APjAAAUH6Hy7WRgMgjTJBZls0CoQAWN+jdGjhM36+Y5znuzBvTNfISER
        turs/j6C5UFSFmLJ3rVWyq4oJNG6
X-Google-Smtp-Source: APXvYqw2XsxGV1eF9d9ZZiyihrDBW5V3dF+iAUmjqVwrIuIOTMjZ+CzM5RsTf1Zk7GYlwzjLfVsqKA==
X-Received: by 2002:ac2:43cf:: with SMTP id u15mr18787264lfl.67.1555347386853;
        Mon, 15 Apr 2019 09:56:26 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
        by smtp.googlemail.com with ESMTPSA id g6sm9982443lja.64.2019.04.15.09.56.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Apr 2019 09:56:25 -0700 (PDT)
Subject: Re: [PATCH 4/6] dma: tegra: add accurate reporting of dma state
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
 <687294f3-aeb5-f17f-bf7d-886346baf02d@gmail.com>
 <204824b3-40af-5fa1-1005-028153dbe83a@codethink.co.uk>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c720ffaf-e903-602a-f1c4-4e9e3dd02be5@gmail.com>
Date:   Mon, 15 Apr 2019 19:56:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <204824b3-40af-5fa1-1005-028153dbe83a@codethink.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
Message-ID: <20190415165624.zHEB8PWn5Xpt-ET04byRD3yQZu-RC6Ysn3frkiVtJ_U@z>

15.04.2019 18:01, Ben Dooks пишет:
> On 14/04/2019 16:20, Dmitry Osipenko wrote:
>> 22.02.2019 21:10, Dmitry Osipenko пишет:
>>> 22.02.2019 20:23, Ben Dooks пишет:
>>>> On 21/02/2019 13:02, Dmitry Osipenko wrote:
>>>>> 21.02.2019 13:06, Ben Dooks пишет:
>>>>>> On 21/02/2019 00:41, Dmitry Osipenko wrote:
>>>>>>> 31.10.2018 19:03, Ben Dooks пишет:
>>>>>>>> The tx_status callback does not report the state of the transfer
>>>>>>>> beyond complete segments. This causes problems with users such as
>>>>>>>> ALSA when applications want to know accurately how much data has
>>>>>>>> been moved.
>>>>>>>>
>>>>>>>> This patch addes a function tegra_dma_update_residual() to query
>>>>>>>> the hardware and modify the residual information accordinly. It
>>>>>>>> takes into account any hardware issues when trying to read the
>>>>>>>> state, such as delays between finishing a buffer and signalling
>>>>>>>> the interrupt.
>>>>>>>>
>>>>>>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>>>>>>
>>>>>>> Hello Ben,
>>>>>>>
>>>>>>> Do you have any plans to submit a new version of this patch? It's really useful and fixes a real problem with the audio playback. I could help with finalizing the patch and could submit it for you if you happened to lost the interest.
>>>>>>
>>>>>> Personally I think the original version was fine. It has been tested
>>>>>> and returns fairly quickly (I am not a fan of just adding more delay in)
>>>>>>
>>>>>> My notes say the condition doesn't last for long and the loop tends
>>>>>> to terminate within 2 runs.
>>>>>>
>>>>>
>>>>> Okay, so are you going to re-send the patch? We can back to the review after, you need at least to re-send because this series has been outdated. Also please take a look and feel free to use as-is the reduced variant of yours patch that I was carrying and testing for months now [0], it works great.
>>>>>
>>>>> [0] https://github.com/grate-driver/linux/commit/ab8a67a6f47185f265f16749b55df214aaaefad4
>>>>>
>>>>
>>>> I can try rebasing, but I have not got a lot of time to do any testing
>>>> at the moment. I agree I should have remembered to chase this stuff up
>>>> earlier.
>>>
>>> No problems, thank you. I'll help with the testing. And I could rebase the patch and send it out for you if will be needed, please just let me know if you're okay with it.
>>>
>>
>> Hello Ben,
>>
>> Do you have any status update on the state of the patch? Again, I could help with sending it out for you if you're too busy or something else. Please let me know how we could proceed with getting the fix upstreamed and sorry for disturbing you again with this.
> 
> I am currently re-looking at the updates for TDM audio and slave mode
> audio for the tegra, I should be able to re-test the original patch
> tomorrow.

Sounds great, thank you very much.
