Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099790;
	b=ijh6aSGOJBOfj98AG9jm+uFSPFUscJvrWNJc6f6C4TAShRjQzirVBa6tOqTRN69sW2wa
	 7j+zW3gnYXhLp7DCg8o8D97oJOmXNOPpjHZdgtmAme0QhZUReu4O6JutRJ+ucw2hzoGii
	 uYe/oDGLebGuNh9z0DLo+bBVtAaSDi05ywDtOalNx5UdN5bl2WQyheQaifpnzPNE5c/hk
	 tWNwSYTVYpcJNUZlh0CpK+K2bgohUYargi/bnIBfMDKNbW0XnRHKGHRO1cdSXhoh4BZPg
	 Ogok+SPZnk1RPO8wk2kJfUZBZZxIDlKq2kSlzfR38u8ffmcKB1ccEoBCmi9vG2F6L4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099790;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=vVtBkWkK7zs4jMXWSQ4xXM4N92+j1aNMfI0Zy/p0UKc=;
	b=IUM8Oj6zDmJuzEuc/GHyg0tT/21I3mvUr7tOe6jFPFZXzZSEopHD+EZ6T0wwhXeaINZe
	 BE3D8a/gk0WbKrmbT1qN4Krw1FduOUMJiwIEg1A2preOwjqvWkyCCNXiKhe2AmArnCc+p
	 5sLY0ZpK7+LwtPSERFNt41AlCsgYS6uKujtHjc3o4Oasr1f53J8RVdtHK6LxaD2d/xd39
	 WS4xxWx3k9khk347idOKCGsDVWrKOXTOiHNV0f+MMbXcJy6u9eR7GKIZjmZ6JnBdLh6Cv
	 62Nup3C8ax3ze8de0qrUM5q7KOSOEtmnrCNeJXSttzbq7Jle8UmbVIKi5FOegjAw+HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A05D606A31B;
	Tue, 27 Oct 2026 11:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A05D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8DxTtMIiOBqbsoZAA--.8947S3;
	Tue, 27 Oct 2026 19:16:24 +0800 (CST)
Received: from [127.0.0.1] (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJAxmM0GiOBqWqYwAA--.35025S2;
	Tue, 27 Oct 2026 19:16:23 +0800 (CST)
Message-ID: <006f82c9-e689-4ca4-8a5e-cd4cc3e14225@loongson.cn>
Date: Tue, 27 Oct 2026 19:16:20 +0800
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
Subject: Re: [PATCH 1/4] dmaengine: loongson: loongson2-apb-cmc-dma: Fix
 cyclic residue wrap NULL dereference
To: sashiko-reviews@lists.linux.dev, dmaengine@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 vkoul@kernel.org, Frank.Li@kernel.org
References: <cover.1792988985.git.zhoubinbin@loongson.cn>
 <e094c8dc1d01af2f296457f6c18b5d85ae76905f.1792988985.git.zhoubinbin@loongson.cn>
 <sashiko-outbox-184754@kernel.org>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <sashiko-outbox-184754@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJAxmM0GiOBqWqYwAA--.35025S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQENCGrgBnkJzgADs0
X-Coremail-Antispam: 1Uk129KBj93XoW3Jr4kCr47tFy5CF4DAF17CFX_yoW7tr4xpF
	y3Jwn5Wry5Jw4rZFs8ur1rXF1UAFWrJFZ2qw43WrnxWr98Xrn29r1fta1rXayUAr98ur1j
	qrs5u397C3WUGacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXUUUUU=



On 2026/10/26 17:17, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dmaengine: loongson: wrong next_sg check in loongson2_cmc_dma_desc_residue()
> --
> 
> commit d1cdc3886ec73f6a09aef30478b0b2741d57690c
> Author: Binbin Zhou <zhoubinbin@loongson.cn>
> 
> dmaengine: loongson: loongson2-apb-cmc-dma: Fix cyclic residue wrap NULL dereference
> 
> This commit updates loongson2_cmc_dma_desc_residue() to check desc->cyclic
> instead of lchan->desc->cyclic when next_sg == 0, and adds a comment
> explaining the cyclic wrap behavior.
> 
>> diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
>> index 2037120b23caa..f090fbe0b8a1e 100644
>> --- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
>> +++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
>> @@ -484,7 +484,19 @@ static size_t loongson2_cmc_dma_desc_residue(struct loongson2_cmc_dma_chan *lcha
>>   	ndtr = loongson2_cmc_dma_read(lddev, LOONGSON2_CMCDMA_CNDTR, lchan->id);
>>   	residue = ndtr << width;
>>   
>> -	if (lchan->desc->cyclic && next_sg == 0)
>> +	/*
>> +	 * For a cyclic descriptor that has wrapped (next_sg == 0), the
>> +	 * current period only has the in-flight entry left; the entries
>> +	 * from sg[0] onwards belong to the next period. Adding them would
>> +	 * make residue exceed one period.
>> +	 *
>> +	 * Use desc->cyclic, not lchan->desc->cyclic: this helper is also
>> +	 * reachable with a descriptor that is not lchan->desc, and only
>> +	 * the active-descriptor branch passes lchan->desc today. Keying
>> +	 * the wrap decision on the descriptor being queried keeps the
>> +	 * result correct and avoids depending on lchan->desc being set.
>> +	 */
>> +	if (desc->cyclic && next_sg == 0)
>>   		return residue;
> 
> [Severity: Medium]
> Can an active cyclic descriptor ever reach loongson2_cmc_dma_desc_residue()
> in drivers/dma/loongson/loongson2-apb-cmc-dma.c with next_sg == 0?
> 
> When starting a transfer in loongson2_cmc_dma_start_transfer(), lchan->next_sg
> is set to 0 before configuring sg_req[0] and immediately incremented to 1
> under lchan->vchan.lock:
> 
>      if (lchan->next_sg == lchan->desc->num_sgs)
>          lchan->next_sg = 0;
> 
>      sg_req = &lchan->desc->sg_req[lchan->next_sg];
>      ...
>      lchan->next_sg++;
> 
> Similarly, on cyclic period completion in loongson2_cmc_dma_handle_chan_done(),
> loongson2_cmc_dma_configure_next_sg() wraps lchan->next_sg from
> lchan->desc->num_sgs to 0 to program sg_req[0], and
> loongson2_cmc_dma_handle_chan_done() immediately increments lchan->next_sg to
> 1 under lchan->vchan.lock:
> 
>      if (lchan->desc->cyclic) {
>          vchan_cyclic_callback(&lchan->desc->vdesc);
>          /* LOONGSON2_CMCDMA_CCR_CIRC mode don't need update register */
>          if (lchan->desc->num_sgs == 1)
>              return;
>          loongson2_cmc_dma_configure_next_sg(lchan);
>          lchan->next_sg++;
>      }
> 
> While the final period sg_req[num_sgs - 1] is in flight, lchan->next_sg equals
> desc->num_sgs, so the loop
> 
>      for (i = next_sg; i < desc->num_sgs; i++)
>          residue += desc->sg_req[i].len;
> 
> naturally executes zero iterations. Thus for an active descriptor,
> lchan->next_sg is always in [1, desc->num_sgs] when
> loongson2_cmc_dma_tx_status() queries it under lchan->vchan.lock.
> 
> In this patch, the only caller that passes next_sg == 0 to
> loongson2_cmc_dma_desc_residue() is the else if (vdesc) branch in
> loongson2_cmc_dma_tx_status() for an unstarted queued descriptor on
> vchan.desc_issued:
> 
>      if (lchan->desc && cookie == lchan->desc->vdesc.tx.cookie)
>          state->residue = loongson2_cmc_dma_desc_residue(lchan, lchan->desc,
>                                                          lchan->next_sg);
>      else if (vdesc)
>          state->residue = loongson2_cmc_dma_desc_residue(lchan,
>                                                          to_lmdma_desc(vdesc), 0);
> 
> With desc->cyclic && next_sg == 0, querying a queued cyclic descriptor (while
> another descriptor is active) returns early before summing desc->sg_req[i].len,
> reporting only the active transfer's ndtr << width.
> 
> Even after the later commit in the series ("dmaengine: loongson:
> loongson2-apb-cmc-dma: Fix residue for queued descriptors") switches the
> else if (vdesc) branch to loongson2_cmc_dma_desc_total_len(),
> loongson2_cmc_dma_desc_residue() is only called for the active descriptor
> lchan->desc with lchan->next_sg in [1, desc->num_sgs]. Doesn't that leave the
> next_sg == 0 check as dead code and the comment describing cyclic wrap and
> non-active descriptors inaccurate?

Yes, an active cyclic descriptor next_sg is never 0.
loongson2_cmc_dma_start_transfer() sets next_sg to 0 and immediately
increments it to 1 before programming sg_req[0], and
loongson2_cmc_dma_configure_next_sg() does the same after wrapping. So
the next_sg == 0 branch is dead code for the active path, and the
existing loop already handles the last period correctly (next_sg ==
num_sgs means zero iterations).

I'm inclined to merge patch-1 and patch-2 because this section of code 
needs to be removed in patch-2, so there's no point in fixing it first 
and then deleting it.
> 
> Also, regarding the commit message description of the NULL dereference when
> lchan->desc == NULL: since vchan_find_desc() searches vchan.desc_issued, and
> both loongson2_cmc_dma_issue_pending() and loongson2_cmc_dma_handle_chan_done()
> immediately start the first descriptor from vchan.desc_issued under
> lchan->vchan.lock, can vchan.desc_issued ever be non-empty while lchan->desc
> is NULL? Should this check and its comment be removed altogether once queued
> descriptors use loongson2_cmc_dma_desc_total_len()?
> 

-- 
Thanks.
Binbin

