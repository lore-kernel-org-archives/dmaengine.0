Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A522453E0B
	for <dmaengine@vger.kernel.org>; Fri, 28 Aug 2026 00:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787878747; cv=none; b=i75Ipcpo3QzTa2AZv5D7QKJo1HvaezudFDuS77jqP5gnSBscToFbYLOPMDQmxOBOB+zX1BDD9pwcLM12Sd1XcsfQym7rxqPeLd81PyL6gagZRIxEPA4eqJ0TRZUKqryctUpm9/0U4nSW1K2VrSU0WPKuaXU475Inc0oSAtDoY+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787878747; c=relaxed/simple;
	bh=fWOfBi3k1QA7mTjM8iKF+DLnKqOQ7MbO3yMRIbzI8jk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o0CTLHqCo/VBhL7/lpKXpcSXJBRdwbEpJqbx+wlxcsiKC2P5rg+l/t/O9LqtPiMW/oY4AT1YayeaREKEz933qThgNudZatxYwi3O5vlffEDBdF2RJ48MUnTNovXEl4mMx5Zvstzt0CSkSUvUtMCqzIm3Eli6Ps46/cNhcPG3rwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mmY4zql9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mmY4zql9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03C3C1F000E9;
	Fri, 28 Aug 2026 00:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787878745;
	bh=I6vPksalnajmZowDRbcshdjwFgQj0swtv0sdSyNQWUA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mmY4zql9ABOoBjMham8G8Kpw75hVRClURCXjGFUX+rEpYzZg939AhvrKjV12hLcsb
	 ePUI3dtTLzcFpppb+02YIh1LID476ZAdTlc8IwqeuPgZ93Q4JBye/29NLGoFR1N6ZR
	 oEyuKQ4pTQFrJfjRvAT5b0qQbtmx7N9vQnyN/oid3HZ54lvwMt1/s8YfsoIbHwtkQ6
	 Qqq411PHWrDtvSvrxcxNmvr+3sZ1kAJNsnQzf4QPfDUyjxN86XH9RKlLqf1jVtjPe3
	 VbUQtBDmehYUEp9EJzdotXxFBuS0fg0jH2jDrd/lV00CF/kdKyC9habCRPu2Favlwh
	 675Ywe+Ub9dkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dmaengine: dw-axi-dmac: Fix AXI burst length
 encoding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang" <wangjia@ultrarisc.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260828-dma-fix-v1-1-a6947f487e07@ultrarisc.com>
References: <20260828-dma-fix-v1-0-a6947f487e07@ultrarisc.com>
 <20260828-dma-fix-v1-1-a6947f487e07@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 00:59:04 +0000
Message-Id: <20260828005905.03C3C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The error handling path for descriptor allocation failures calls `=
dma_pool_free` with NULL pointers and underflows the `descs_allocated` coun=
ter.
- [High] Missing validation of transfer lengths (`len`, `buf_len`, `period_=
len`) in DMA prep functions leads to division-by-zero panics and out-of-bou=
nds array accesses.
--

commit 1edc02c6412e562b16e650ad23de4b1395cbcb68
Author: Jia Wang <wangjia@ultrarisc.com>

dmaengine: dw-axi-dmac: Fix AXI burst length encoding

The snps,axi-max-burst-len property describes the number of beats in an
AXI burst, while the ARLEN and AWLEN fields encode that value minus one.

The driver keeps axi_rw_burst_len as the actual burst length so that
dma_device.max_burst reports the correct value. However, it also programs
that unencoded value directly into the hardware fields. A value of 256
therefore overflows the 8-bit fields and can cause AXI decode errors.

Subtract one only when constructing hardware descriptors, while keeping
the actual value for dma_device.max_burst.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index eebed2474210d..742e08cfab435 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c

[ ... ]

> @@ -975,7 +975,7 @@ dma_chan_prep_dma_memcpy(struct dma_chan *dchan, dma_=
addr_t dst_adr,
> =20
>  		reg =3D CH_CTL_H_LLI_VALID;
>  		if (chan->chip->dw->hdata->restrict_axi_burst_len) {
> -			u32 burst_len =3D chan->chip->dw->hdata->axi_rw_burst_len;
> +			u32 burst_len =3D chan->chip->dw->hdata->axi_rw_burst_len - 1;

[Severity: High]
This is a pre-existing issue, but does the error handling in this
function cause a kernel panic if descriptor allocation fails?

If axi_desc_get() fails to allocate a descriptor (e.g., due to memory
exhaustion), the code jumps to err_desc_get and calls axi_desc_put(desc):

	hw_desc->lli =3D axi_desc_get(chan, &hw_desc->llp);
	if (unlikely(!hw_desc->lli))
		goto err_desc_get;

axi_desc_put() unconditionally loops over all requested descriptors and cal=
ls
dma_pool_free() with hw_desc->lli. For elements that were not successfully
allocated, hw_desc->lli is NULL, which causes dma_pool_free() to dereference
a NULL pointer.

Additionally, axi_desc_put() subtracts the full requested number of
descriptors from chan->descs_allocated instead of the successfully allocated
count, which could underflow the counter:

	atomic_sub(descs_put, &chan->descs_allocated);

[Severity: High]
This is also a pre-existing issue, but does this function lack validation f=
or
transfer lengths?

If a DMA client driver provides a len of 0 in dma_chan_prep_dma_memcpy(),
num evaluates to 0 and the transfer setup loop is skipped. The function then
attempts to write to index -1, causing memory corruption:

	/* Set end-of-link to the last link descriptor of list */
	set_desc_last(&desc->hw_desc[num - 1]);

Similarly, in dw_axi_dma_chan_prep_cyclic(), can a period_len of 0 cause an
unhandled division-by-zero panic when calculating num_periods?

	num_periods =3D buf_len / period_len;

And if buf_len is 0 in dw_axi_dma_chan_prep_cyclic(), making total_segments=
 0,
does this access out of bounds on the 0-length allocation?

	llp =3D desc->hw_desc[0].llp;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-dma-fix-v1=
-0-a6947f487e07@ultrarisc.com?part=3D1
