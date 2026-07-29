Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6E747A87B;
	Wed, 29 Jul 2026 11:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785326174; cv=none; b=rHhNUaSeuY4dWbxhpvU2xwfyx7giJjw5BD11j8Vf6qjyJTPpINhN4WHiH7Iul93L4jKYkHzL0ZQU47Px6qyJrdsuSkZh6YiKW1y33XJz08YkE4EueDL4GESbmTA5AKT+NDgiUsf4hEkuompoZ9c2wBOj2CLVifhOR7N0n6nSAHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785326174; c=relaxed/simple;
	bh=I1BHMnC7gJYXLrkfU7v8e1A0JJJZhj9ZD9vcQ0x2d7Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cmt57jt0Nf1Hsqxx+oFR6Z+VnhvFKagHcRVD1Hu70iyMJG0DQ06hvIltOi6RtKFhbIT5yZq5EW7UlXvAQsppDSUEWtwm79byFFLUmJL+dLlZ3xW35f0WTI4BXUgHgrgC+NjmVKLo5qSSk6aVk/rbskY329+x5500y8Dq5MHTNkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFrdRjrn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFrdRjrn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7CC31F000E9;
	Wed, 29 Jul 2026 11:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785326173;
	bh=pyk3ersoilGzCxngyyl7AHzUGDzKJUpUkOct9+nO+Ow=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lFrdRjrnzwdjOI+skMMJsRUDdP5IGEKFypKbcHSUioSKVQJZfzi2ml8IPlGJ5jUOM
	 0JfiPKU/x2q8oJHOioB1+XBD5oCV/8s3fvi7EfRBbEFRlFHaKxCTjVEi1R0+GHFyXs
	 2a9tSPOQDRKrhbun8eKdMW1th+eHD2F2Hk8uO/lSRUe8zlBjRHN6ISOB4KQMmx8pUu
	 8GKR8YVV5Pd/tC41Xt8b3ibVKegQM4ZraXgbq8N7tji/tiOHIbzDTZbeokN9Ok0ppS
	 w0GywNYkJNpcDGhELqIFYKWkFHG0Rct8kYum0VasZApUAXH/92gxzX4HdHJ7Rpc9N5
	 XXXLq1fgmUpRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] dmaengine: apple-admac: Add M3 generation ADMACs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260729-t603x-admac-v2-2-e4b2bb6ca45e@chaosmail.tech>
References: <20260729-t603x-admac-v2-0-e4b2bb6ca45e@chaosmail.tech>
 <20260729-t603x-admac-v2-2-e4b2bb6ca45e@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 11:56:12 +0000
Message-Id: <20260729115612.C7CC31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver schedules a tasklet for DMA channel completion but fail=
s to kill it upon driver unbind, leading to a Use-After-Free.
- [High] Missing memory barrier between CPU writes to the DMA buffer and tr=
iggering the hardware via MMIO.
--

--- Patch [2]: [PATCH v2 2/2] dmaengine: apple-admac: Add M3 generation ADM=
ACs ---
commit 3e4665bdfbbc14988e79c929d83bff445def0885
Author: Sasha Finkelstein <k@chaosmail.tech>

dmaengine: apple-admac: Add M3 generation ADMACs
   =20
The admacs present on t8122 and t603x SoCs need additional writes in
order to operate correctly. The exact purpose of this register
is unknown

> diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
> index 14a5ee14a4815..72ff677c8ce54 100644
> --- a/drivers/dma/apple-admac.c
> +++ b/drivers/dma/apple-admac.c
[ ... ]
> @@ -935,9 +954,18 @@ static void admac_remove(struct platform_device *pde=
v)
>  	reset_control_rearm(ad->rstc);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but I noticed the driver schedul=
es
a tasklet for DMA channel completion but fails to kill it upon driver unbin=
d.

Does this leave the code open to a use-after-free? If an interrupt fires ju=
st
before free_irq() and schedules the tasklet, the tasklet may run after
admac_remove() returns and the devm_kzalloc managed memory (struct admac_da=
ta)
is freed.

Could we add a call to tasklet_kill() during the teardown sequence?

[Severity: High]
This is another pre-existing issue not touched by this patch, but I noticed
missing memory barriers when the hardware is started via MMIO.

Looking at admac_start_chan() and admac_cyclic_write_one_desc():

drivers/dma/apple-admac.c:admac_start_chan() {
    ...
	switch (admac_chan_direction(adchan->no)) {
	case DMA_MEM_TO_DEV:
		writel_relaxed(startbit, ad->base + REG_TX_START);
		break;
    ...
}

drivers/dma/apple-admac.c:admac_cyclic_write_one_desc() {
    ...
	writel_relaxed(lower_32_bits(addr), ad->base + REG_DESC_WRITE(channo));
	writel_relaxed(upper_32_bits(addr), ad->base + REG_DESC_WRITE(channo));
    ...
}

Could CPU writes to the DMA buffer be delayed and become visible to the DMA
controller only after it starts fetching data?=20

Since writel_relaxed() does not include a memory barrier on ARM64 architect=
ures
and spin_lock only provides ACQUIRE semantics, prior memory stores to the D=
MA
buffer might be reordered after the MMIO write. Does this require a memory
barrier to prevent transmitting stale data?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-t603x-adma=
c-v2-0-e4b2bb6ca45e@chaosmail.tech?part=3D2
