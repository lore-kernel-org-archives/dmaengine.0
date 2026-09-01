Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF6835A3BF
	for <dmaengine@vger.kernel.org>; Tue,  1 Sep 2026 06:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244184; cv=none; b=Y6NVT0IHc1ZiOLEPhe3yT9grKs5cxeo/zRKl0XfoCaTV5YIAQuf6XtawsSsrLYDzLInFYir+rt1jfe7bBTV3g4FZSFyU1nOi2S19Me7lC0ktr49ck9OXEuGZGi9jLOdh//66GVFGGtYWyy5+jXJqtwqMAYZUlhW97EabMkf3OTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244184; c=relaxed/simple;
	bh=Uq/XjCGSQK174YdCEEEYuXTDSZZ0YZUgzD+IKTA77JA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MG4VxEedcjCBnPCugVpWPHi2miY7dNCpqENIPkfoRCdy9kL8QdSsg4o4vkuVGWsz8927ukbOAlnXcw5rFBGSkjDUnhyuMb0bvEsCvueQoZL+ik16zwDiI95jZt9zCAWbotrvVYRPaNHqUb7YN7SdkpfYObYf8ot88+hZs7t91II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWWJVNYB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWWJVNYB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF2431F000E9;
	Tue,  1 Sep 2026 06:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788244183;
	bh=GyOJH4CAf7Vi86WwN7SSBWYkCke1+8nTNb0y4MvR0/8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KWWJVNYB6D/G/kOiuoMJ47MIYuEMb9l0eYYJvPTBmy+LZT92zmBRf/KDUCRaIm4/G
	 hXu8v9OheZPEYUJymLiTRg9Xip4dbnpj5aVxS0RBWl+D2eFWYU3NBFiXg/fwk/H3Rp
	 Vk9sYeQGW01/c63B2SAhbtTzGU7c11xWICGHohrGkfWeuDbseD0EfYHD41TPtAgsia
	 ftzE9PEkb4CXlxz/oXeNwAZbuld2r0zcjOR+R8t+19dD8iV3arsIhmIjF7yfdp5obJ
	 8OwM0B79BXkdl1wsByXE2qiH5j7YWyA7JqLdCqTk9VUdOlzrB3xL83DljhMptrZioX
	 QaAca5GoMOzRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] dmaengine: dw-axi-dmac: Fix LLI dump
 out-of-bounds access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang" <wangjia@ultrarisc.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260901-dma-fix-v2-2-d7f0459ebb14@ultrarisc.com>
References: <20260901-dma-fix-v2-0-d7f0459ebb14@ultrarisc.com>
 <20260901-dma-fix-v2-2-d7f0459ebb14@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 06:29:42 +0000
Message-Id: <20260901062942.DF2431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] The patch fixes an out-of-bounds access in `axi_chan_list_dump=
_lli()` by using the transaction-local `desc->nr_hw_descs` instead of the c=
hannel-wide `chan->descs_allocated`. However, it completely misses the exac=
t same bug in `axi_chan_block_xfer_complete()` which can lead to memory cor=
ruption.
- [Critical] Flawed calculations for `segment_len` and loop bounds in both =
`dw_axi_dma_chan_prep_slave_sg` and `dw_axi_dma_chan_prep_cyclic` lead to d=
ata truncation, DMA overruns, and NULL pointer dereferences when buffer len=
gths are not perfectly divisible by the calculated `segment_len`.
--

commit 5ff010f18efeeec7fde7f85a181da39448ad009d
Author: Jia Wang <wangjia@ultrarisc.com>

dmaengine: dw-axi-dmac: Fix LLI dump out-of-bounds access

This commit fixes an out-of-bounds access in axi_chan_list_dump_lli() by
using the transaction-local descriptor count instead of the channel-wide
count.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index 742e08cfab435..61230d2b1c561 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -1052,10 +1052,7 @@ static void axi_chan_dump_lli(struct axi_dma_chan =
*chan,
>  static void axi_chan_list_dump_lli(struct axi_dma_chan *chan,
>  				   struct axi_dma_desc *desc_head)
>  {
> -	int count =3D atomic_read(&chan->descs_allocated);
> -	int i;
> -
> -	for (i =3D 0; i < count; i++)
> +	for (unsigned int i =3D 0; i < desc_head->nr_hw_descs; i++)
>  		axi_chan_dump_lli(chan, &desc_head->hw_desc[i]);
>  }

[Severity: Critical]
This is a pre-existing issue, but does axi_chan_block_xfer_complete() have
the same out-of-bounds access regression?

If multiple transactions are prepared, chan->descs_allocated can exceed the
transaction-local desc->nr_hw_descs:

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:axi_chan_block_xfer_complete=
() {
    ...
    int count =3D atomic_read(&chan->descs_allocated);
    ...
    if (chan->cyclic) {
        desc =3D vd_to_axi_desc(vd);
        if (desc) {
            llp =3D lo_hi_readq(chan->chan_regs + CH_LLP);
            for (i =3D 0; i < count; i++) {
                hw_desc =3D &desc->hw_desc[i];
                if (hw_desc->llp =3D=3D llp) {
                    axi_chan_irq_clear(chan, hw_desc->lli->status_lo);
                    hw_desc->lli->ctl_hi |=3D cpu_to_le32(CH_CTL_H_LLI_VALI=
D);
    ...
}

Could this cause an out-of-bounds read on the desc->hw_desc array, and
corrupt memory when writing to hw_desc->lli->ctl_hi?

[Severity: Critical]
This is also a pre-existing issue, but can the segment loop bounds cause
data truncation or memory overruns?

In dw_axi_dma_chan_prep_slave_sg(), if len is not perfectly divisible by
segment_len, the loop terminates prematurely:

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dw_axi_dma_chan_prep_slave_s=
g() {
    ...
    do {
        hw_desc =3D &desc->hw_desc[loop++];
        status =3D dw_axi_dma_set_hw_desc(chan, hw_desc, mem, segment_len);
        ...
        len -=3D segment_len;
        mem +=3D segment_len;
    } while (len >=3D segment_len);
    ...
}

Does this drop the remainder bytes and leave trailing descriptors
uninitialized, causing a NULL dereference when set_desc_last() is called?

Similarly, in dw_axi_dma_chan_prep_cyclic():

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dw_axi_dma_chan_prep_cyclic(=
) {
    ...
    for (i =3D 0; i < total_segments; i++) {
        hw_desc =3D &desc->hw_desc[i];
        status =3D dw_axi_dma_set_hw_desc(chan, hw_desc, src_addr, segment_=
len);
        ...
        src_addr +=3D segment_len;
    }
    ...
}

Can this unconditionally program the DMA to transfer segment_len for each
segment, exceeding the requested period_len and reading or writing past the
end of the provided DMA buffer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-dma-fix-v2=
-0-d7f0459ebb14@ultrarisc.com?part=3D2
