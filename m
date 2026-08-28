Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1A339A07C
	for <dmaengine@vger.kernel.org>; Fri, 28 Aug 2026 09:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787909062; cv=none; b=cmaxbwqphy5ne8QUwdmlGzpoLaRnMM3r3Xk7JZVPabXLlvOwkyt6D2cOGHmmIC87YPUrH3YEZO8ejcVXtXtiuRABzL1q9rfYw98qp6++zJ7eg3U48V0KUONoGzDbgD+TlOuqfFPvMKRlG70umHo4GpAUCwNRjGyarSu3dk2uG+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787909062; c=relaxed/simple;
	bh=EfFkWn5Ea9fb3/vBlRDSbeB2qRbCKw1lZeGp5o1jUxU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=QecYdFW1JHF9faGFTCsNeViORwXMLzrnVJLAh7mJ2En9qXiZM7iiZdOloMibVShXwItHyZ3UXNqnrNPCKSj89omQh/hbY0NLmP3BQWuy2mls9xhm0p0OjObweXPQRn8iMgTwGwodU7s42yF/5HDIIw+UI7jUfQpnhthi/imhqGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=W0oA2ujG; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="W0oA2ujG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=b3JYRN3m8NMiKBzPnAZQCZuNlnzhkxP/E
	l487CcLr0Q=; b=W0oA2ujGxZN1Q8ySVaWAQ2x+FViDQ2VB0s0P+GnPVxFNIsBi2
	aYIMM3K7L3pKHLWZeKjZksAulkLcWYPkv2DhaUrFzIApuqYWsZ/oCLGxYP0GDvkx
	A+ln5I1HXakf9eaEfebQ4hG+j7eS1VAKHuDicYvSY+NCPp9gvluBHmvQ/I=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwBHds3DU5FqjmoBAA--.217S2;
	Fri, 28 Aug 2026 17:24:19 +0800 (CST)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] dmaengine: dw-axi-dmac: Fix AXI burst length
 encoding
From: Jia Wang <wangjia@ultrarisc.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jia Wang <wangjia@ultrarisc.com>, dmaengine@vger.kernel.org, 
 Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260828005905.03C3C1F000E9@smtp.kernel.org>
References: <20260828-dma-fix-v1-0-a6947f487e07@ultrarisc.com>
 <20260828-dma-fix-v1-1-a6947f487e07@ultrarisc.com>
 <20260828005905.03C3C1F000E9@smtp.kernel.org>
Date: Fri, 28 Aug 2026 17:24:05 +0800
Message-Id: <178790904597.157024.15514368863692379180.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787909046; l=4031;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=EfFkWn5Ea9fb3/vBlRDSbeB2qRbCKw1lZeGp5o1jUxU=;
 b=MqRt5cd4xOzGp/uizX968CWaKGy5jGUlTJEPgwe4PPJgTAitJ1dYFnm6MUnaUgWaOYbRc+yG4
 EXgcxGSaK9CA+xLWAsKHAzY3lA3Ncx433uhY3zWf24mS0AZp8/IVlxI
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwBHds3DU5FqjmoBAA--.217S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXF1UKryruF4rZw4UJFyxKrg_yoWrWF1UpF
	W5Ka1YyFyrtrnIya1kGw1xZry0va15GFWUuF4jvw1fua43Zw1vkrnxK3yrWF9rur1Fya40
	qF4jv34fAF1jva7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUva14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyT
	uYvjfUehL0UUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAMEWqPrHsAIwAVsY

On 2026-08-28 00:59 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The error handling path for descriptor allocation failures calls `dma_pool_free` with NULL pointers and underflows the `descs_allocated` counter.
> - [High] Missing validation of transfer lengths (`len`, `buf_len`, `period_len`) in DMA prep functions leads to division-by-zero panics and out-of-bounds array accesses.
> --
> 
> commit 1edc02c6412e562b16e650ad23de4b1395cbcb68
> Author: Jia Wang <wangjia@ultrarisc.com>
> 
> dmaengine: dw-axi-dmac: Fix AXI burst length encoding
> 
> The snps,axi-max-burst-len property describes the number of beats in an
> AXI burst, while the ARLEN and AWLEN fields encode that value minus one.
> 
> The driver keeps axi_rw_burst_len as the actual burst length so that
> dma_device.max_burst reports the correct value. However, it also programs
> that unencoded value directly into the hardware fields. A value of 256
> therefore overflows the 8-bit fields and can cause AXI decode errors.
> 
> Subtract one only when constructing hardware descriptors, while keeping
> the actual value for dma_device.max_burst.
> 
> > diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > index eebed2474210d..742e08cfab435 100644
> > --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> 
> [ ... ]
> 
> > @@ -975,7 +975,7 @@ dma_chan_prep_dma_memcpy(struct dma_chan *dchan, dma_addr_t dst_adr,
> >  
> >  		reg = CH_CTL_H_LLI_VALID;
> >  		if (chan->chip->dw->hdata->restrict_axi_burst_len) {
> > -			u32 burst_len = chan->chip->dw->hdata->axi_rw_burst_len;
> > +			u32 burst_len = chan->chip->dw->hdata->axi_rw_burst_len - 1;
> 
> [Severity: High]
> This is a pre-existing issue, but does the error handling in this
> function cause a kernel panic if descriptor allocation fails?
> 
> If axi_desc_get() fails to allocate a descriptor (e.g., due to memory
> exhaustion), the code jumps to err_desc_get and calls axi_desc_put(desc):
> 
> 	hw_desc->lli = axi_desc_get(chan, &hw_desc->llp);
> 	if (unlikely(!hw_desc->lli))
> 		goto err_desc_get;
> 
> axi_desc_put() unconditionally loops over all requested descriptors and calls
> dma_pool_free() with hw_desc->lli. For elements that were not successfully
> allocated, hw_desc->lli is NULL, which causes dma_pool_free() to dereference
> a NULL pointer.
> 
> Additionally, axi_desc_put() subtracts the full requested number of
> descriptors from chan->descs_allocated instead of the successfully allocated
> count, which could underflow the counter:
> 
> 	atomic_sub(descs_put, &chan->descs_allocated);
> 
> [Severity: High]
> This is also a pre-existing issue, but does this function lack validation for
> transfer lengths?
> 
> If a DMA client driver provides a len of 0 in dma_chan_prep_dma_memcpy(),
> num evaluates to 0 and the transfer setup loop is skipped. The function then
> attempts to write to index -1, causing memory corruption:
> 
> 	/* Set end-of-link to the last link descriptor of list */
> 	set_desc_last(&desc->hw_desc[num - 1]);
> 
> Similarly, in dw_axi_dma_chan_prep_cyclic(), can a period_len of 0 cause an
> unhandled division-by-zero panic when calculating num_periods?
> 
> 	num_periods = buf_len / period_len;
> 
> And if buf_len is 0 in dw_axi_dma_chan_prep_cyclic(), making total_segments 0,
> does this access out of bounds on the 0-length allocation?
> 
> 	llp = desc->hw_desc[0].llp;
> 

I checked these paths and confirmed that the issues are pre-existing and
not introduced by this series. To keep this dmatest-driven fix series
scoped, I will address them in a separate follow-up series.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260828-dma-fix-v1-0-a6947f487e07@ultrarisc.com?part=1
> 

Best regards,
Jia Wang


