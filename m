Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B74285C91;
	Wed, 17 Jun 2026 02:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781663403; cv=none; b=IDV/C/OV2zgPooHhaUhixHmB4oCdVOgX4qibbFny7tQyvWzspmfbndS7mjSRCWVfmmrzBuPzspL6sN5A0Ogy5EIrMEbLJzbXo6/ziVWMDWijFymH/3iaMS4gfW2NjDXoFbQ96dfqwZcjVG0Zx17/ri5BLEW3009mTnwH3bjpKyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781663403; c=relaxed/simple;
	bh=L0xgJ+rKai2YUY8+NiLjHYLjaNCjJuHB7FtFOxM5/R4=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type; b=Z45mvrwZXWNzZeCSC872JuwHhwth4pPebMDPEIECKqHsyvnXVcIDWuEsI6xn7g3a7vlYJd+mXsnwUbMYMnHEqHasWjIIqG/8Z13eSgntq2P+I0ioRi2dB4+oZhz7HbyQXyjOjVjkCKnmmsmHyTPcKNw3SuSK+s39AzQOSi4A5Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=okul5jce; arc=none smtp.client-ip=220.197.31.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="okul5jce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:From:MIME-Version:To:Subject:
	Content-Type; bh=T2eQr/t8U1wQpTsAv2oqP/O+K73c/8wMmiyGmptHgmo=;
	b=okul5jce2NFh3k5vp7WjDI0WDf67UyKt1/zDFBfi7heNVLjta++no3Fk8aRn0P
	ciVVscI7M0P+K5pPcxXkuITBoOh99FFUTrtATDtMx7usCts/BmfRXq33c1Xg2JtY
	qHQS/9IDoT0wwsBwuHjZzbFVEseW4Ei1UqHOLzqIft4tw=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCkvCgCXL2ddBjJqASY2BQ--.52696S2;
	Wed, 17 Jun 2026 10:28:46 +0800 (CST)
Message-ID: <6A32065F.3030705@126.com>
Date: Wed, 17 Jun 2026 10:28:47 +0800
From: Hongling Zeng <zhongling0719@126.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101 Thunderbird/31.2.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: Frank Li <Frank.li@oss.nxp.com>
CC: Hongling Zeng <zenghongling@kylinos.cn>, vkoul@kernel.org, 
 Frank.Li@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, 
 samuel@sholland.org, mripard@kernel.org, arnd@arndb.de, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dmaengine: sun6i-dma: Fix memory leak in sun6i_dma_terminate_all
References: <20260616060449.42225-1-zenghongling@kylinos.cn> <ajG2aR70B4z6j1fd@SMW015318>
In-Reply-To: <ajG2aR70B4z6j1fd@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCkvCgCXL2ddBjJqASY2BQ--.52696S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxur15JF1UWFW3WrWDWryfJFb_yoW5XF13pr
	W5Ja13GFW5Jwsaga1ftw4FqF1Yqa13tF47u3y5Zw13Zr45trnFkF1xCw1F9F4DArn8Zrn0
	yFs8Z34xC3WUCFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jstxhUUUUU=
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/xtbBoR6-kGoyBl5mLQAA3b

Hi Frank and Jernej Skrabec:

      Thanks for all the review!

   You're absolutely right.After checking virt-dma.h, I see that 
desc_terminated is the correct queue for actively terminated transfers. 
I'll update to use:

   - vchan_terminate_vdesc(vd);

   I'll send v3 ,Please help to review.

   Best regards,
   Hongling Zeng

在 2026年06月17日 04:47, Frank Li 写道:
> On Tue, Jun 16, 2026 at 02:04:49PM +0800, Hongling Zeng wrote:
>> When terminating a non-cyclic DMA transfer, the active descriptor
>> is not properly reclaimed. The descriptor is removed from the
>> desc_issued list in sun6i_dma_start_desc(), but in
>> sun6i_dma_terminate_all(), only cyclic transfer descriptors are
>> added to the desc_completed list before cleanup.
>>
>> For non-cyclic transfers, pchan->desc is set to NULL without first
>> adding the descriptor back to a list that vchan_get_all_descriptors()
>> can collect. This causes the descriptor and its associated LLI chain
>> to be permanently leaked.
>>
>> Fix by ensuring both cyclic and non-cyclic active descriptors are
>> added to the desc_completed list before setting pchan->desc to NULL.
>>
>> Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
>> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
>>
>> ---
>>   Change in v2;
>>   -Add pchan->desc != pchan->done check to prevent race condition
>>    where completed descriptors could be double-added to desc_completed
>>    list, causing list corruption
>> ---
>>   drivers/dma/sun6i-dma.c | 12 +++++-------
>>   1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
>> index 7a79f346250a..12d038ef5f2e 100644
>> --- a/drivers/dma/sun6i-dma.c
>> +++ b/drivers/dma/sun6i-dma.c
>> @@ -946,16 +946,14 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
>>
>>   	spin_lock_irqsave(&vchan->vc.lock, flags);
>>
>> -	if (vchan->cyclic) {
>> -		vchan->cyclic = false;
>> -		if (pchan && pchan->desc) {
>> -			struct virt_dma_desc *vd = &pchan->desc->vd;
>> -			struct virt_dma_chan *vc = &vchan->vc;
>> +	if (pchan && pchan->desc && pchan->desc != pchan->done) {
>> +		struct virt_dma_desc *vd = &pchan->desc->vd;
>> +		struct virt_dma_chan *vc = &vchan->vc;
>>
>> -			list_add_tail(&vd->node, &vc->desc_completed);
>> -		}
>> +		list_add_tail(&vd->node, &vc->desc_completed);
> should It be in desc_terminated queue?
>
> ref: https://lore.kernel.org/dmaengine/ajETw7uwVx_U9o5F@ryzen/T/#m541c24b45fb425c6a8a81d800db225b58411447e
>
> Frank
>>   	}
>>
>> +	vchan->cyclic = false;
>>   	vchan_get_all_descriptors(&vchan->vc, &head);
>>
>>   	if (pchan) {
>> --
>> 2.25.1
>>

