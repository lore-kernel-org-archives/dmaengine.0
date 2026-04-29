Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAA6271A9A
	for <dmaengine@vger.kernel.org>; Wed, 29 Apr 2026 02:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777431341; cv=none; b=ZSLL0IJjZhdTEafaRA9VbsG0UfkuH+KPfPJJ9Plgm91ramEB4c+zabNELG/L7AUjcGB9LIyEsofur+rVHsBSaqRbtwz2z21dGrv/CXR12xfif3t7BsKGSol58RQtHWK4MRwV81JFfSQYNpZrb6ETM8m9hVjkw0poafYcxVcgLrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777431341; c=relaxed/simple;
	bh=KJ6yjqr37h7QCt3waxbc5xPqX3IGOJvayl9EV/Fkml8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=R8NgVv9L18zNNgJxNK+5+RRi4jtM//QpipUu5H4h9IbdtL/ts2ljt5R9SnQP2SsE34i5HwlxQw4a9laF5j2TvdkFAcdZ9+0JiFzBh+v8b9hdAWdtG1La8hWI8MRtPorRsAIswA2jWKLRApdP31uJpTlTLlellPEQl3pQpP5Kmms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=xmh9e581; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="xmh9e581"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1777431335; h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
	bh=RTA7QInQigpqDtGsnEy+r0oxuuwfNE64gnxHJzJZSpA=;
	b=xmh9e581dNsNetc1pezVleXbaL3pz8P5Qs/lub6uBmZZyn8T8yKfkAa9hjJ5HxnWD33SuwEshJztRtGgTSEHvafF4SRXrQh8h/h9Xk+qH53plCphrhDkoByEnS7fzFzA/f/POgBrYoLWRTF9/kbLh+C5YXw3iGzMXdpMrZcHK6c=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0X1w.Pny_1777431334;
Received: from 30.178.83.183(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0X1w.Pny_1777431334 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 29 Apr 2026 10:55:35 +0800
Message-ID: <e9500d11-11c0-461c-a215-705b4f9b15f6@linux.alibaba.com>
Date: Wed, 29 Apr 2026 10:55:32 +0800
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dmaengine: idxd: Fix use-after-free of idxd_wq
From: Guixin Liu <kanie@linux.alibaba.com>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
 Xunlei Pang <xlpang@linux.alibaba.com>, oliver.yang@linux.alibaba.com
References: <20260415095030.42183-1-kanie@linux.alibaba.com>
 <177689364254.530433.11713441936347707463.b4-review@b4>
 <968e2a4f-7613-4ef2-8cf4-68710ec55163@linux.alibaba.com>
 <87cxzp1p9o.fsf@intel.com>
 <d8d91f16-4323-4c66-85cf-10fbc6a99ebc@linux.alibaba.com>
 <3847a039-bdab-478d-be57-c46c7665f92c@linux.alibaba.com>
In-Reply-To: <3847a039-bdab-478d-be57-c46c7665f92c@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Vinicius,

It looks like all the issues from the AI Review have been clarified,
Can this patch be accepted?

Best Regards,
Guixin Liu

在 2026/4/24 13:56, Guixin Liu 写道:
>
>
> 在 2026/4/24 13:43, Guixin Liu 写道:
>>
>>
>> 在 2026/4/24 02:54, Vinicius Costa Gomes 写道:
>>> Guixin Liu <kanie@linux.alibaba.com> writes:
>>>
>>>> 在 2026/4/23 05:34, Vinicius Costa Gomes 写道:
>>>>> On Wed, 15 Apr 2026 17:50:30 +0800, Guixin Liu 
>>>>> <kanie@linux.alibaba.com> wrote:
>>>>>> diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
>>>>>> index fb80803d5b57..c3cfd96074c9 100644
>>>>>> --- a/drivers/dma/idxd/init.c
>>>>>> +++ b/drivers/dma/idxd/init.c
>>>>>> @@ -1293,13 +1293,30 @@ static void idxd_remove(struct pci_dev 
>>>>>> *pdev)
>>>>>> [ ... skip 14 lines ... ]
>>>>>> +     *
>>>>>> +     * Use device_release_driver() to only unbind the driver 
>>>>>> (triggering
>>>>>> +     * idxd_device_drv_remove()) without touching sysfs. Then 
>>>>>> safely
>>>>>> +     * unregister children before the parent.
>>>>>> +     */
>>>>>> +    device_release_driver(idxd_confdev(idxd));
>>>> Thanks for the reply.
>>>>> Below are sashiko comments verbatim, some notes:
>>>>>
>>>>>    - I do believe the race condition that it points out is real (but
>>>>>      very narrow), but not sure that we don't have a similar one in
>>>>>      current code (i.e. it wasn't introduced by your patch);
>>>>>    - The possible wq leak was definitely not introduced by this 
>>>>> patch;
>>>>>    - The question about what happens with the file references after a
>>>>>      device is removed is a separate issue;
>>>>>
>>>>> The patch looks good, not opposed to it at all, the only one I am a
>>>>> bit concerned, about this patch, to be sure, is the race condition,
>>>>> and the two "paths" to reach it. (the others we can fix separately)
>>>>>
>>>>> sashiko.dev <sashiko@sashiko.dev>:
>>>>>
>>>>> Does this introduce a race condition with sysfs?
>>>>>
>>>>> Since the driver's sysfs nodes remain active after 
>>>>> device_release_driver()
>>>>> is called, a user with sysfs privileges could write to the bind 
>>>>> attribute
>>>>> to re-probe the driver before the device unregistration completes.
>>>>>
>>>>> If idxd_device_drv_probe()->idxd_wqs_setup() runs concurrently with
>>>>> idxd_unregister_devices(), does it cause a use-after-free when it
>>>>> iterates over the idxd->wqs[] objects being freed, since
>>>>> suppress_bind_attrs is not set?
>>>> I think re-probe will call idxd_pci_probe() to allocate an new idxd 
>>>> device,
>>>> this avoids accessing stale data.
>>> Yeah, I missed the (now obvious) that a new 'probe' also means a new
>>> device. So this "path" is not valid. Thank you.
>>>
>>>>> Also, does this code leak the workqueue?
>>>>>
>>>>> The workqueue idxd->wq is dynamically allocated using 
>>>>> create_workqueue()
>>>>> during device initialization, but destroy_workqueue(idxd->wq) does 
>>>>> not
>>>>> appear to be called in idxd_remove() or the sysfs device release 
>>>>> callback.
>>>> Looks like it's b7cb9a034305 ("dmaengine: idxd: Fix refcount underflow
>>>> on module unload")
>>>> overlooked this, destory_workqueue(idxd->wq) is called in 
>>>> idxd_cleanup()
>>>> -> idxd_cleanup_internals().
>>>>
>>>> If so, I can send another patch to fix this.
>>> Yes, please do.
>> Will be added in v3.
> Well, the idxd->wq is freed in idxd_conf_device_release(), so there is no
> problem, no need to fix.
>>>>>> idxd_unregister_devices(idxd);
>>>>> sashiko.dev <sashiko@sashiko.dev>:
>>>>>
>>>>> If idxd_unregister_devices() drops the last reference to the child wq
>>>>> objects and frees them, can idxd_shutdown() trigger a use-after-free
>>>>> when called shortly after?
>>>>>
>>>>> For example, if a hardware error interrupt fired during teardown,
>>>>> idxd_shutdown()->flush_workqueue() could execute an error handler 
>>>>> that
>>>>> iterates over the freed idxd->wqs[] memory.
>>>>>
>>>>> Additionally, if the hardware is wedged,
>>>>> idxd_shutdown()->idxd_device_disable()->idxd_device_clear_state()
>>>>> iterates over idxd->wqs[] and attempts to acquire 
>>>>> mutex_lock(&wq->wq_lock)
>>>>> on the freed memory.
>>>> I took a look — idxd_shutdown() is only invoked by idxd_remove() and
>>>> during system shutdown/reboot.
>>>> Is idxd_shutdown() ever reached from the idxd hardware error interrupt
>>>> path?
>>> The bot's suggestion that this code path could be hit by a hardware
>>> error is false, but the shutdown path (like the user pressing a button)
>>> could be valid.
>>>
>>> A crash during that could cause the machine to not poweroff, which is
>>> not good. Worth thinking about this, if there's something we could do
>>> while we are here.
>>
>> Both idxd_remove() and idxd_shutdown() are called under 
>> device_lock(dev) —
>> the lock is acquired by the driver core before invoking any bus 
>> callback:
>>
>> 1.
>>
>>    Remove path: device_release_driver_internal() →
>>    __device_driver_lock(dev, parent) → device_lock(dev) → ... →
>>    pci_device_remove() → idxd_remove()
>>
>> 2.
>>
>>    Shutdown path: device_shutdown() → device_lock(dev) →
>>    dev->bus->shutdown(dev) → pci_device_shutdown() → idxd_shutdown()
>>
>> Since both paths acquire the same dev->mutex on the same PCI device,
>>
>> idxd_remove() and idxd_shutdown() are mutually exclusive.
>>
>> Best Regards,
>>
>> Guixin Liu
>>
>>>>> Is there also a missing reference count for the cdev open path?
>>>>>
>>>>> Since idxd_unregister_devices() frees the wq structure, if user space
>>>>> holds an open file descriptor, cdev_device_del() won't revoke it.
>>>>> Can file operations like mmap or poll subsequently access the freed
>>>>> ctx->wq pointer? Should idxd_cdev_open() take a kobject reference on
>>>>> the parent wq device?
>>>> To be honest, I'm not very familiar with the idxd driver. At this 
>>>> point,
>>>> it looks like the idxd driver needs a state machine to ensure mutual
>>>> exclusion
>>>> across the various concurrent paths.
>>> Don't worry about this one, it's a separate issue.
>>>
>>>> Best Regards,
>>>> Guixin Liu
>>>>> via: 
>>>>> https://sashiko.dev/#/message/20260415095030.42183-1-kanie@linux.alibaba.com
>>>>> via: 
>>>>> https://sashiko.dev/#/message/20260415095030.42183-1-kanie@linux.alibaba.com
>>>>>
>>>>> via: 
>>>>> https://sashiko.dev/#/message/20260415095030.42183-1-kanie@linux.alibaba.com
>>>>> via: 
>>>>> https://sashiko.dev/#/message/20260415095030.42183-1-kanie@linux.alibaba.com
>>>>>
>>>
>>> Cheers,
>>

