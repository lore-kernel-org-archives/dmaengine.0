Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793207020;
	b=cZgwtMFTu0+FJkF31vuCl/3bewlQlvbsMQL4tGR09l1E5c+SLNoezR2xGFAFGbPRd2EJ
	 7u3PwxjAxNxZEnjBBjbD38VuOkab8BbWtUtEBIDlKXqs5oCGW9u4peQCRkSb2Ec/NBBK1
	 OAAhow/Y4S3tz7XFimjXk8tIiqHCvnJkeNQyGrtKJu4ljQlD069mzpPwPqpNlaohcnOD/
	 N+4IWAIhmq0wpWee4jjFjrK7U/Bp3ebXsjPlkKyzQFhgeMkYE13qwmoxr2F8zuofg6qas
	 NDM6AWkKwzbWl7wpmjyS0+pajz1vXOdtyOld+TTvTZymKHtwJoFoWsriPqTcvadissA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=DO/5rN8t06lVCuIKT6Pz+YWotCVnUOjfp0iAhj+HMRg=;
	b=2EBKjczys4Nas8bGi9pObgs1Kn4FJEaaUoO/d8ZT4lD00qDyEJ1ZMQbnpB6XIf9jzUWF
	 5REop5TsA5F4P7V/08FdvJOAYXKQeC2wSTt+RWJw0b0sTPLlZexWH5naX+8z0pzmJ/Acp
	 vm1fpczGLzqsjrXBclEHGpXhSq5XsKiNwG2EF49/wsO8lYwrIYkvELpwuFk8Oh7l/tMed
	 acQvAq32iCipj32lsBi5HzfRunzMwJKn6cBmLOqZazO5OR33X6vN3hhVcjaRcNvdTz7/0
	 wKXH/k4DNJtzapSOVLO7TKDRrsgEG+/oZdR6elB4QqX1DgaSLFers3JfTof+ZFdZUYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wh63upBh;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A787606A31A
	for <dmaengine@vger.kernel.org>; Wed, 28 Oct 2026 17:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A787606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wh63upBh
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so192381866b.3
        for <dmaengine@vger.kernel.org>; Wed, 28 Oct 2026 10:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793207017; x=1793811817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DO/5rN8t06lVCuIKT6Pz+YWotCVnUOjfp0iAhj+HMRg=;
        b=Wh63upBhKqln1Dt0rWPscluGhXAz6aZc8Mlo6+SFGXkxnjnAB+dDcYrmn4lRueuAJz
         QgQXJ5TznTgLv696roqARD6qiqrA9WOvsRldSZ1Nl8K3vW7z9nVrd+vg9J5d8I8NX5De
         LlzM0Jzk9R+NDW9gEs1pqwPpMw7RmJmK0rbYrpjAhUWwghUEbbUvY9LeBmfEVUeqwiTX
         4i/NAPLA66XFMzLOs8cph87ZNs65VLLFZfXaFQyy5O5vvJItM/+dfcmgFDRsryQmkPh9
         SdrPkNM7z+/o3nlE8wfm+G9JVu9Wste7YWFinxPsXiDrPO4RCJTKkoT/kEWixB/TMUjM
         IddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207017; x=1793811817;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DO/5rN8t06lVCuIKT6Pz+YWotCVnUOjfp0iAhj+HMRg=;
        b=T7BxMRaBjtLPtbInSClF9ediT0FfiDiS11AbRZWHzkWpUziMpPp6Ad6uTNPKFzH/l6
         aLga5/AND6Xm7+lKpU9KS0qqX2ie98akpxm5ESEDoFwTjoiASAvD6iSog7jHc0TFqLIU
         ABzSxjSt7GVSV/sZlEIXymSj1tbTL+O/ou6/B0IslXNtm139+Cdh7Bqs6CYRT+Cbd3xZ
         5gQIaUKcbQgTc1oiaKMh6Me8D33qqRAYXZxt376vjep3IG9w8a+QsoedoHVRKbCzswbD
         hlJQQUhoNDpkTUgHorN40zR35BnsqxIb6rLz7qaV+iNjRR/9SF/00d3nvnSXBW2cZW3G
         uMrw==
X-Forwarded-Encrypted: i=1; AKwUvBylIjBNdwguyFSiR7zNgIPySm1XxIcF+03NVZVK8xyU5qM5pVhKdxqIVfurtWGd1UBI3gXR6EH3IkA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOKkjCJiQDOx1w8A7Mg5ngiFhSkGQr/wMWuL2nEqKl7u4MCQBB
	c7nviaVPXH8TRyGuyqJObTAINa+WPKYzpOWWGQHohokYdMSNn2Hhp7pVuRdjVTvC
X-Gm-Gg: AYBFou3LmMmhkDHALtY4ByAbUsYZXuC83edIVaEtxjaxt3tTfQ+4Wkx7CopMFWxpi/J
	NcDcvWk1O13yxWt9j27Vt0i1yI09thcqtwUR4SiWlpmx3iXneBigsQ0KA5bXRGp9baXtpm7xjcF
	4C88hkxPuVDckYGszMnHkn2i/6x2B1SSZ9NW34Q6MqYNrCUT4sDNUULI/EiJGncmR1b5kjwQrrF
	9EbH3ggK9wfxd/X7CF2YYky7NsnmkMyO8HH8fraPVM8PgIPzBJJjSl59Nr9DvdwDRMO+YQZRUMi
	vdGhLZsWlDCmtGzlFiTq+9KTqHYQYFmnF6Y6DoU1k9XfigJF/oVNMqljNbkeo9zo1UbV2kFxzAq
	eO6HEcwVPyTlpmcF9yHWrpxXJuJMLcUbUJ+xMZCDwWQ2MN2kRd9jl63gO75C7VA3TRq3P0RE7nC
	1Z+pBXFqgw+MVftLGeU0vxP6ZtcQcp17PDGouyGtUQPpwvGj5dJTVPu0n2IE3b6FoOK4EE6p5O3
	+fN+kyfofpZumiH/LcpFw2/Ti4DaCk3zdaWGIZBrrlBWj4rAfjLYff/RuRG/6XUjVH+7acivFaN
	XJNIxiS8faZ3msPrSXdBYqueOtXKgjGPdqV4KVYcEg==
X-Received: by 2002:a17:907:fd18:b0:c29:659e:2fd6 with SMTP id a640c23a62f3a-c49bdf2ba80mr270930466b.10.1793207017356;
        Wed, 28 Oct 2026 10:03:37 -0700 (PDT)
Received: from [192.168.0.24] ([195.136.82.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd77e1e9sm635884766b.67.2026.10.28.10.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 10:03:36 -0700 (PDT)
Message-ID: <af0c6729-6859-40e7-bb55-33fe67fb5c1a@gmail.com>
Date: Wed, 28 Oct 2026 18:03:33 +0100
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: pl330: drop only the runtime PM reference a
 channel holds
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261028-pl330-runtime-pm-v1-1-f0fb5c34a7c4@gmail.com>
 <auIIIC6ATpcJgDTM@SMW015318>
Content-Language: en-US
From: =?UTF-8?Q?Krzysztof_Soko=C5=82owski?= <krzysiek.sokolowski@gmail.com>
In-Reply-To: <auIIIC6ATpcJgDTM@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


W dniu 28.10.2026 o 15:35, Frank Li pisze:
> On Wed, Oct 28, 2026 at 12:28:11PM +0100, Krzysztof Sokołowski via B4 Relay wrote:
>> [You don't often get email from devnull+krzysiek.sokolowski.gmail.com@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> From: Krzysztof Sokołowski <krzysiek.sokolowski@gmail.com>
>>
>> pl330_tasklet() drops a runtime PM reference when the channel's work
>> list is empty, without checking that the channel still holds one.
>> pl330_terminate_all() drops that reference too (power_down =
>> pch->active) and clears pch->active. If a completion schedules the
>> tasklet and a client terminates the channel before the tasklet runs, the
>> tasklet finds an empty work list and drops the reference a second time:
>>
>>    Runtime PM usage count underflow!
>>
>> after which the controller can be runtime suspended while still in use.
>>
>> Seen on an RK3128 board (dw_mmc using the PL330 for SD transfers) under
>> combined SD and USB load, where the dw_mmc error path terminates the
>> channel; the underflow was followed by "pl330_update:1678 Unexpected!"
>> and a failure to request the DMA channel again.
>>
>> Take power_down from pch->active in the tasklet, as pl330_terminate_all()
>> does, so the reference taken in pl330_issue_pending() is dropped once.
>>
>> Fixes: 5c9e6c2b2ba3 ("dmaengine: pl330: Fix runtime PM support for terminated transfers")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Krzysztof Sokołowski <krzysiek.sokolowski@gmail.com>
>> ---
> The same patch at
> https://patchwork.kernel.org/project/linux-dmaengine/patch/20261015-review-pl330-pm-original-v3-v3-1-5be09f37df77@crepuse.com/
>
> Frank
>>   drivers/dma/pl330.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
>> index c2d0b47..b0eced8 100644
>> --- a/drivers/dma/pl330.c
>> +++ b/drivers/dma/pl330.c
>> @@ -2090,7 +2090,12 @@ static void pl330_tasklet(struct tasklet_struct *t)
>>                  spin_lock(&pch->thread->dmac->lock);
>>                  _stop(pch->thread);
>>                  spin_unlock(&pch->thread->dmac->lock);
>> -               power_down = true;
>> +               /*
>> +                * Drop the runtime PM reference only if this channel still
>> +                * holds it: pl330_terminate_all() may already have dropped it
>> +                * while this tasklet was scheduled.
>> +                */
>> +               power_down = pch->active;
>>                  pch->active = false;
>>          } else {
>>                  /* Make sure the PL330 Channel thread is active */
>>
>> ---
>> base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
>> change-id: 20261028-pl330-runtime-pm-b5a30050b2f5
>>
>> Best regards,
>> --
>> Krzysztof Sokołowski <krzysiek.sokolowski@gmail.com>
>>
>>
Hello.

It is very interesting, but I have it for last month only in my private 
repo, that has now public facing side to upstream fixes I have made .

My public repo: https://github.com/ksokolowski/rocknix-distribution/

Set of patches including this one are here:

https://github.com/ksokolowski/rocknix-distribution/commit/dd3923788d94588b8d5fdb602808b13370ab4208#diff-27b400675ba20f118e98f9a25b963ece2a2336d9ef1fc9416c273f507e24c271

Anyway, I can confirm it works fine on real hardware for last month. So 
you can drop my patch and merge previous one as tested and confirmed to 
work.

Krzysztof

