Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AE4238C0A;
	Mon, 15 Jun 2026 02:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781490499; cv=none; b=a9Iy+gjRnbOjxZlfFiFH7fOKcudp2hyu9lfcmrR06be1O6iXhU7FPSGnqfADb3jzvvY3fFHxUYtYcblCepzDkP76C/CpW6yJPJ+i/05CLRirvsejN4BHs20k8xgy/qPfAHNwAO6k6Z2VzACwNAeQTYaIBMZPlT2udhJoYzfEM/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781490499; c=relaxed/simple;
	bh=m8jBWU15C9EHvw0zQZbvtcGi9Ysx4hcRbyls+8zIQyw=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type; b=moHtfJishe79dX6gW222EDChki7FbMVaNoKkdJO8rNVUDIV8R6aAtjSOLfhc/BpCVe06fRVCB8U4E2UBs/EQnQRPb/6hI1AJ2ybYg+XA5eDCN1psFLdsd4XNLQzI6rGnkrlmiTWWLP+g7hJyEDH5eX2+EIaJgk+0sHFflw3j/mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=Lvrh4HbF; arc=none smtp.client-ip=220.197.31.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="Lvrh4HbF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:From:MIME-Version:To:Subject:
	Content-Type; bh=F+HNNdlyuRmjijcNZ9VuH9FOCs8YBSRZkVxVMqWsky8=;
	b=Lvrh4HbF575bJUuKBCxdRbsAm9gfMUVXg9FsTxguQpFvjpNyLER9Eg4DGtvIDh
	g0TMdLw/jVtDtyUq2zmoA7WtgdS8S/ORcXfwEDzddXuZF8uY6X4gpkKlhpbwSHEX
	FXNRa9WO4PjGh4so3uo2RiE58uXtqsAPHKpKYZojS71C4=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCkvCgDHj7RqYi9qrvV3Aw--.16977S2;
	Mon, 15 Jun 2026 10:24:43 +0800 (CST)
Message-ID: <6A2F626A.1010508@126.com>
Date: Mon, 15 Jun 2026 10:24:42 +0800
From: Hongling Zeng <zhongling0719@126.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101 Thunderbird/31.2.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: =?UTF-8?B?SmVybmVqIMWga3JhYmVj?= <jernej.skrabec@gmail.com>, 
 vkoul@kernel.org, Frank.Li@kernel.org, wens@kernel.org, 
 samuel@sholland.org, mripard@kernel.org, arnd@arndb.de, 
 Hongling Zeng <zenghongling@kylinos.cn>
CC: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: sun6i-dma: Fix use-after-free in error handling
 paths
References: <20260611063631.96566-1-zenghongling@kylinos.cn> <CyWPMXMZRBuYyL_Lpl2t_Q@gmail.com>
In-Reply-To: <CyWPMXMZRBuYyL_Lpl2t_Q@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCkvCgDHj7RqYi9qrvV3Aw--.16977S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAF1DtFW5CFyrCFW3CF1UGFg_yoW5Gw1fpr
	WUCa1rWF4kJ3Wava13Ja4kur1Fgrs3JFy8CrW5C3Z8CFnFvF92va4xCa4rCrn0yrn8Gr4f
	Zrn8K3W5ur17GaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jstxhUUUUU=
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/xtbBoQsZ6WovYmsmKAAA3Y

   Hi Jernej,

   Thanks for the feedback. I've sent v2 implementing your suggestion - 
refactored to use a helper function sun6i_dma_free_lli_list() that accepts
   struct sun6i_desc * parameter, eliminating code duplication.

   Please help review.

   Best regards,
   Hongling Zeng


在 2026年06月13日 15:46, Jernej Škrabec 写道:
> Dne četrtek, 11. junij 2026 ob 08:36:31 Srednjeevropski poletni čas je Hongling Zeng napisal(a):
>> In error handling paths, the for loop frees v_lli in the loop body,
>> then accesses v_lli->v_lli_next and v_lli->p_lli_next in the
>> increment expression, which is use-after-free.
>>
>> Fix by saving both the next virtual and physical pointers before
>> freeing the current node.
>>
>> Fixes: 555859308723 ("dmaengine: Add driver for Allwinner sun6i DMA")
>> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
>> ---
>>   drivers/dma/sun6i-dma.c | 20 ++++++++++++++++----
>>   1 file changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
>> index a9a254dbf8cb..eb9c4ae87ac8 100644
>> --- a/drivers/dma/sun6i-dma.c
>> +++ b/drivers/dma/sun6i-dma.c
>> @@ -788,9 +788,15 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
>>   	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
>>   
>>   err_lli_free:
>> -	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
>> -	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
>> +	p_lli = txd->p_lli;
>> +	v_lli = txd->v_lli;
>> +	while (v_lli) {
>> +		struct sun6i_dma_lli *next_v_lli = v_lli->v_lli_next;
>> +		dma_addr_t next_p_lli = v_lli->p_lli_next;
>>   		dma_pool_free(sdev->pool, v_lli, p_lli);
>> +		v_lli = next_v_lli;
>> +		p_lli = next_p_lli;
>> +	}
>>   	kfree(txd);
>>   	return NULL;
>>   }
>> @@ -869,9 +875,15 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
>>   	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
>>   
>>   err_lli_free:
>> -	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
>> -	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
>> +	p_lli = txd->p_lli;
>> +	v_lli = txd->v_lli;
>> +	while (v_lli) {
>> +		struct sun6i_dma_lli *next_v_lli = v_lli->v_lli_next;
>> +		dma_addr_t next_p_lli = v_lli->p_lli_next;
>>   		dma_pool_free(sdev->pool, v_lli, p_lli);
>> +		v_lli = next_v_lli;
>> +		p_lli = next_p_lli;
>> +	}
>>   	kfree(txd);
>>   	return NULL;
>>   }
>>
> This is certainly a valid fix, but it's replicating what sun6i_dma_free_desc()
> is already doing. It would be better to split code to accept struct sun6i_desc
> *txd parameter and call that instead from all places.
>
> Best regards,
> Jernej
>

