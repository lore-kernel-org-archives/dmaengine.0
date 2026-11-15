Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794759281;
	b=ELpwbmS5kpz6KkL5iSbkBNK28Gk07+HdyHODgDalDs3LklFyMEmfDyEPjtXJXUji+bdj
	 dcvMNvAat/FZncUwKugdymzb8nuuEmn17By+tGx0IbxUEyzZfInm3u6Md4rCO84kqUEGZ
	 /ur76bCQFp5r95VuRlLpd0z+83E4q1G9EAwQFHRRPmphgpTZRBWdW7mhahBpNUeX3k/ID
	 +BMAThtBMM1mmi2Rq4vAdJcOedXB89+S54g9WLRig3LmP8v5MhguGM+YzKTvihIMm1xql
	 eDkITE/iMLFo8BVq1T8FbcaJj81HHrfovq5WX0jozFMqBHf8PShGfvlTLRzNBE/kpyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794759281;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=VJ28sg+WpgoKr8RqyZCJ5+6VPbt7JtBzAkrOxn+KB8g=;
	b=zvCjs1VymVVFP8KuDRnEzJWZ2nXvEwrleqaIHXaPffEwvsdKKICptZ5oLkGyG37EbRux
	 p2Jq34P5r2gP/vqm48qV4aLYcATMdgFYSc/bBL/5gfAAE4UhPxVg/37sANa0I6WPKiG61
	 NdkLDhynS7ShOud8F0j7MV/S4I4zTE7BIX7uRYZLtmfhAKeDAtDClBdwlsXf1AW7Yml+u
	 tjN0CzuMvRBlHy9u8qMUwxiIGIgFLbmxS+p3sswwpKi6Mk4GILBg+uMQFNDJ/DykGafVY
	 uoAM9xYETqr2mS77z5O3ydXd0wListbHVk1mY21uRN+9pcqgnvCp9l47HC9h0MzECug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=nR8p81Cd;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=GJc17JQB;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577E1606A31E
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 16:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 577E1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=nR8p81Cd;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=GJc17JQB
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1794759275; bh=VJ28sg+WpgoKr8RqyZCJ5+6
	VPbt7JtBzAkrOxn+KB8g=; b=nR8p81Cd1qsp1YVxNWWYwceUf1RQDjPtVYusszGRmuM7vSk/q8
	g3mp3H6B47WxUbjsYx3LAyBWw2kfSGjUs9wGVW6BqF53BF46cKolAsvX8ECG77lmPePJew0/yOM
	EXGWohpFaFwBl4X7e3j4y2u/qpdlXBR6RNYIl4z8uCLISinQ2DaGc8uU3tSWivP2ByIQQ4KC/ub
	kXM4yd+NkVKcy2L2uGTcdR6i75XqW8dWXQyTBN9qqhH/uMBbS2Sc8Vt+hrHa+HCo6poJ4f1DPr3
	5ctUMspbF0+x9oS44FKJ+7eP3YlaK4KzCxLkLUXwbLbiiKnCnrfNv4qdl+h4rduoGMg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1794759275; bh=VJ28sg+WpgoKr8RqyZCJ5+6
	VPbt7JtBzAkrOxn+KB8g=; b=GJc17JQBJ/wdznycqNltCwfBJ9CzGCmOEOdTTAiBbhhRi6vsXZ
	NdOWMCGVWVuuofYTP+JPp7d9lRUy3WG7/wBw==;
Message-ID: <7ac6f154-952c-412d-8ae3-b4e07a334ee1@mainlining.org>
Date: Sun, 15 Nov 2026 19:14:34 +0300
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
Subject: Re: [PATCH] dmaengine: qcom: bam_dma: Report the residue of packet
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
References: <20261115-qcom-bam-dma-metadata-v1-1-52e4de54ffd3@mainlining.org>
 <sashiko-outbox-215642@kernel.org>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <sashiko-outbox-215642@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


15.11.2026 19:08, sashiko-bot@kernel.org пишет:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] dmaengine: qcom: bam_dma: missing opening brace in
>    bam_fifo_xfer_len()
> - [High] dmaengine: qcom: bam_dma: undeclared metadata_ops in
>    bam_prep_slave_sg()
> - [Medium] dmaengine: qcom: bam_dma: missing read barrier in
>    process_channel_irqs()
> It also noticed 2 related pre-existing issues this patch does not
> introduce:
> - [Critical] dmaengine: qcom: bam_dma: ring buffer space miscalculation
>    in bam_start_dma() [1]
> - [High] dmaengine: qcom: bam_dma: unclocked register access in
>    bam_dma_irq() [2]
> --
>
> commit e40d68fe8bef09bdcbef42721a06c3fd7ad7197d
> Author: Nickolay Goppen <setotau@mainlining.org>
>
> dmaengine: qcom: bam_dma: Report the residue of packet
>
> This commit calculates the number of bytes transferred from the BAM FIFO
> descriptors and reports the transfer residue in async_desc->vd.tx_result.residue
> upon descriptor completion.
>
>> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
>> index e62e411dc8f8b..b5cfe3ce34060 100644
>> --- a/drivers/dma/qcom/bam_dma.c
>> +++ b/drivers/dma/qcom/bam_dma.c
> [ ... ]
>
>> @@ -447,6 +448,30 @@ static inline void __iomem *bam_addr(struct bam_device *bdev, u32 pipe,
>>   		r.ee_mult * bdev->ee;
>>   }
>>   
>> +/**
>> + * bam_fifo_xfer_len - bytes transferred for a completed descriptor chunk
>> + * @bchan: BAM channel the chunk was queued on
>> + * @async_desc: BAM async descriptor owning the chunk
>> + *
>> + * For RX pipes the BAM overwrites the size field of the descriptor that
>> + * ended the transfer with the number of bytes actually written to memory,
>> + * which can be less than the buffer size (e.g. an IPA packet).  Those
>> + * values live in the FIFO copy, not in async_desc->desc[].
>> + */
>> +
>> +static u32 bam_fifo_xfer_len(struct bam_chan *bchan,
>> +			     const struct bam_async_desc *async_desc)
>> +	struct bam_desc_hw *fifo = PTR_ALIGN(bchan->fifo_virt,
>> +					     sizeof(struct bam_desc_hw));
>> +	u32 len = 0;
>> +	unsigned int i;
>> +
>> +	for (i = bchan->head; i < bchan->head + async_desc->xfer_len; i++)
>> +		len += le16_to_cpu(fifo[i % MAX_DESCRIPTORS].size);
>> +
>> +	return len;
>> +}
> [Severity: High]
> bam_fifo_xfer_len() is missing its opening '{' after the parameter list,
> which breaks the build when CONFIG_QCOM_BAM_DMA is enabled.
>
> [Severity: Critical]
> This problem wasn't introduced by this patch, but in bam_start_dma(), the
> producer side of the same descriptor FIFO ring buffer miscalculates
> available space [1] and can overwrite in-flight DMA descriptors:
>
> drivers/dma/qcom/bam_dma.c:bam_start_dma() {
> 	...
> 		avail = CIRC_SPACE(bchan->tail, bchan->head,
> 				   MAX_DESCRIPTORS + 1);
> 	...
> 		bchan->tail += async_desc->xfer_len;
> 		bchan->tail %= MAX_DESCRIPTORS;
> }
>
> CIRC_SPACE() is called with MAX_DESCRIPTORS + 1 (4096), which returns 4095
> when the ring is empty (tail == head), while bchan->tail and bchan->head
> wrap modulo MAX_DESCRIPTORS (4095).  Enqueuing 4095 descriptors wraps
> bchan->tail back to bchan->head, making a full ring appear empty so
> subsequent submissions overwrite active descriptors before hardware
> processes them.
>
>> @@ -732,6 +757,8 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
>>   		} while (remainder > 0);
>>   	}
>>   
>> +	async_desc->vd.tx.metadata_ops = &metadata_ops;
>> +
>>   	return vchan_tx_prep(&bchan->vc, &async_desc->vd, flags);
>>   }
>>   
> [Severity: High]
> metadata_ops is not declared anywhere in this file or its included headers,
> which causes compilation to fail.
>
>> @@ -881,6 +908,11 @@ static u32 process_channel_irqs(struct bam_device *bdev)
>>   			if (avail < async_desc->xfer_len)
>>   				break;
>>   
>> +			async_desc->transferred +=
>> +				bam_fifo_xfer_len(bchan, async_desc);
>> +			async_desc->vd.tx_result.residue =
>> +				async_desc->length - async_desc->transferred;
>> +
>>   			/* manage FIFO */
>>   			bchan->head += async_desc->xfer_len;
>>   			bchan->head %= MAX_DESCRIPTORS;
> [Severity: Medium]
> Can bam_fifo_xfer_len() read stale fifo[].size values before the hardware
> descriptor writeback is observed?
>
> bchan->fifo_virt is allocated with dma_alloc_wc() (Normal Non-Cacheable
> memory on ARM/ARM64, which allows speculative loads), and earlier in
> process_channel_irqs() BAM_P_SW_OFSTS is read with readl_relaxed():
>
> drivers/dma/qcom/bam_dma.c:process_channel_irqs() {
> 	...
> 		offset = readl_relaxed(bam_addr(bdev, i, BAM_P_SW_OFSTS)) &
> 				       P_SW_OFSTS_MASK;
> }
>
> Because readl_relaxed() has no read barrier and the address of
> fifo[i % MAX_DESCRIPTORS].size does not depend on offset, the CPU can
> speculatively load the initial buffer size written by bam_start_dma()
> instead of the byte count written back by the BAM hardware, reporting the
> wrong residue to clients.  Using readl() for BAM_P_SW_OFSTS or adding a
> dma_rmb() before reading fifo[].size would order the reads.
>
> [Severity: High]
> This problem wasn't introduced by this patch, but bam_dma_irq() calls
> process_channel_irqs() before acquiring a runtime PM reference [2]:
>
> drivers/dma/qcom/bam_dma.c:bam_dma_irq() {
> 	...
> 	srcs |= process_channel_irqs(bdev);
> 	...
> 	ret = pm_runtime_get_sync(bdev->dev);
> }
>
> If a shared or spurious interrupt fires while the BAM controller is
> runtime-suspended with its clocks disabled, the readl_relaxed() of
> BAM_IRQ_SRCS_EE at the start of process_channel_irqs() accesses an
> unclocked register and triggers a synchronous external abort.
>
> [1] https://sashiko.dev/#/bug/linux-a877fd6c-244a-404b-88a7-7d77506711a9
> [2] https://sashiko.dev/#/bug/linux-0ca05019-399c-4f9d-a7e1-d74c7ddced75

I will address the issues of the patch in next respin, but I don't know 
what to do with issues that |
wasn't introduced by my patch.

-- 
Best regards,
Nickolay
