Received: from fsn-vps-1.bereza.email (fsn-vps-1.bereza.email [162.55.44.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B623BFE5A;
	Tue, 18 Aug 2026 12:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.44.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787055103; cv=none; b=cV28l/+UG6DhFOGnYNBnXuABaN80UYCm/vE9whV07H+SeylhfLIEn0HRoB3rRytX1u+g3+NEl7Pk1akfPO5DnyPMayPgfoAW1g8p24zexDnXKJrHzkepzzAhHLJdWe8SbOUQbUi7SZ8AeLjBDRDBJmlN/vikNibuJslOyFxZQsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787055103; c=relaxed/simple;
	bh=58WgTsECTK1yYGL7QjCSrs8eH3LV5+Et7K9zcQkGotE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Es3Od470YrSD2Zwrms/wPVsIochkGitDMZCRxPolqEYrsRBxCv7j77b4Q7NRXcLgsN4exMZKrlF+Ja3bmzSMoJYGhrJ0q4oVTTNoYc2oc47ycsC1UdwSp/n28oxhs1kmm1FjOc6JvSHBY78qakapgwl666e4MjlvM+DaEig+Puw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bereza.email; spf=pass smtp.mailfrom=bereza.email; dkim=pass (2048-bit key) header.d=bereza.email header.i=@bereza.email header.b=CeO9w8Ym; arc=none smtp.client-ip=162.55.44.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bereza.email
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bereza.email
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bereza.email header.i=@bereza.email header.b="CeO9w8Ym"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bereza.email; s=mail;
	t=1787055092; bh=58WgTsECTK1yYGL7QjCSrs8eH3LV5+Et7K9zcQkGotE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CeO9w8Ym4eLgvq8Z1L2qgdHQ96Yu3QHE/AEmwjgWi8msk3uhmz/dQ1o+uUvKplxOw
	 0J/pahBDeNAzxJDQEQ+1/meuX6YWKOADMxwHr3PzAcxwnrZZPvH57ZD8bEW+Y4goz2
	 hQfNzs1lHdwPDHtKPHU7xWDr7hBabkIEEo7RCzFN7sx+RUTk1mBkrdeywz2FT/jHg2
	 hz+/PXHKIDFgB3tDkggGNbW/n1w3Sb+5xiRbeTjqtg3AMVcwJJpGjsV856kT0QnffA
	 ylPVWDdQzuCQXRGWl7Ykk+rnwnR6J7jww5628Kl4ISAX0MleIBunyrwr2knU6ieBOg
	 SykXsI1M0Pyeg==
Received: from localhost (pd95bbad8.dip0.t-ipconnect.de [217.91.186.216])
	by fsn-vps-1.bereza.email (Postfix) with ESMTPSA id 50DA36027C;
	Tue, 18 Aug 2026 14:11:32 +0200 (CEST)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Aug 2026 14:11:31 +0200
Message-Id: <DKS25RPXGPXB.2I0LD9EHK9GAP@bereza.email>
From: "Alex Bereza" <alex@bereza.email>
To: "Pandey, Radhey Shyam" <radheys@amd.com>, "Alex Bereza"
 <alex@bereza.email>, "Vinod Koul" <vkoul@kernel.org>, "Frank Li"
 <Frank.Li@kernel.org>, "Michal Simek" <michal.simek@amd.com>, "Kedareswara
 rao Appana" <appana.durga.rao@xilinx.com>
Cc: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Suraj Gupta" <Suraj.Gupta2@amd.com>
Subject: Re: [PATCH] dmaengine: xilinx_dma: Fix hardware buffer descriptor
 reuse order
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260817-fix-hw-buf-desc-reuse-v1-1-d79827a844c7@bereza.email>
 <QjUGg1to3KFvzKpfc2FoL0vjidDyRPAjT3cURLYpXEfdqk7LPzrRq6dCkhEROkPP47rIdqQYBa-BYKkdSV-oGQ==@protonmail.internalid> <e2877b7e-eb3f-4a4c-aa94-ed0907578e6f@amd.com>
In-Reply-To: <e2877b7e-eb3f-4a4c-aa94-ed0907578e6f@amd.com>

On Tue Aug 18, 2026 at 12:58 PM CEST, Radhey Shyam Pandey wrote:
>
> + Suraj
>
> On 8/17/2026 2:53 PM, Alex Bereza wrote:
>> xilinx_dma_alloc_chan_resources() builds a static ring of hardware
>> buffer descriptors once and the driver uses this ring throughout the
>> lifetime of a channel. This requires the allocation order of hardware
>> buffer descriptors from chan->free_seg_list to stay in sync with the
>> hardware buffer descriptor ring built at channel allocation time by
>> returning oldest descriptors to chan->free_seg_list first.
>>
>> When chan->pending_list is not empty e.g. during
>> xilinx_dma_terminate_all() the chan->free_seg_list and the order of the
>> static hardware buffer descriptor ring get out of sync. Descriptors age
>> in this order: pending -> active -> done. So freeing pending_list first
>> returns the newest buffer descriptors to the chan->free_seg_list first
>> and thus breaks the order required by the static hardware buffer
>> descriptor ring. Then when the channel is reused, after a wrap around of
>> the free_seg_list the DMA will find a hardware buffer descriptor with a
>> length field that is still zeroed and stop with something like this:
>>
>>    xilinx-vdma 86000000.dma: Channel 000000003a21d7b8 has errors 10, cdr=
 6de4c000 tdr 6de4c000
>>
>
> Just to understand - can you share steps on how are seeing this issue ?
> During terminate_all hw is in reset so how is free ordering matter?
> Want to ensure that change of order in not masking a real corruption.

To reproduce, pending_list must not be empty when
xilinx_dma_terminate_all() is called. For example by calling
dmaengine_submit without calling dma_async_issue_pending and then
terminating.

Since pending_list was freed first, the newest descriptors were appended
to the tail of the free_seg_list. Then when you continue to use the
channel and allocate new descriptors from free_seg_list you will
eventually cause the hardware to walk into a buffer descriptor with
length 0. This happens after a lap of free_seg_list, when you get the
descriptor freed from the pending_list previously. The hardware buffer
descriptor ring reads a different descriptor than what you "allocated"
from free_seg_list and fails, since the read descriptor's length field
is still 0. This is because the hardware ring order is different from
the order in free_seg_list, caused by the wrong freeing order.

The reset does not help to prevent this, because the hardware advances
along the hardware buffer descriptor ring via the next pointer. But the
driver hands out the descriptors in free_seg_list order, which no longer
matches hardware buffer descriptor ring order. The reset only re-syncs
the starting point, but not the order of the two.

>
>> After this no more descriptors are completed and a consumer potentially
>> blocks and waits forever. The only way to get out of this error state is
>> to rebuild the static hardware buffer descriptor ring and the
>> free_seg_list by releasing and re-acquiring the channel.
>>
>> Fix the order in which hardware buffer descriptors are returned to
>> free_seg_list to ensure the mentioned requirement holds.
>>
>> Fixes: 23059408b6a3 ("dmaengine: xilinx_dma: Fix race condition in the d=
river for multiple descriptor scenario")
>> Signed-off-by: Alex Bereza <alex@bereza.email>
>> ---
>>   drivers/dma/xilinx/xilinx_dma.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx=
_dma.c
>> index bef2b031dba1..0817b74f7450 100644
>> --- a/drivers/dma/xilinx/xilinx_dma.c
>> +++ b/drivers/dma/xilinx/xilinx_dma.c
>> @@ -920,9 +920,9 @@ static void xilinx_dma_free_descriptors(struct xilin=
x_dma_chan *chan)
>>
>>   	spin_lock_irqsave(&chan->lock, flags);
>>
>> -	xilinx_dma_free_desc_list(chan, &chan->pending_list);
>>   	xilinx_dma_free_desc_list(chan, &chan->done_list);
>>   	xilinx_dma_free_desc_list(chan, &chan->active_list);
>> +	xilinx_dma_free_desc_list(chan, &chan->pending_list);
>>
>>   	spin_unlock_irqrestore(&chan->lock, flags);
>>   }
>>
>> ---
>> base-commit: 0d995da5fb97e8c312834575604d4423eb6225b7
>> change-id: 20260817-fix-hw-buf-desc-reuse-b730e9e02185
>>
>> Best regards,
>> --
>> Alex Bereza <alex@bereza.email>
>>
>>
