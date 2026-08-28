Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA9E3F107F
	for <dmaengine@vger.kernel.org>; Fri, 28 Aug 2026 01:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787879054; cv=none; b=sxOJPGTqXJOBOF0kszG3g4HrtlGELj8JjyPX65yRF+Eiwdxmg5zET6Bo8xkM15j3fCF3m4XCuU2ktKgNoCdtvYC75CKrf1qXQ93sz1nKRSw2DcGndTwIta88RDNSXaEIUDgRLHH9LqdG/VxBbTr7A1oGfIHBnQHW1CFweEK+D1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787879054; c=relaxed/simple;
	bh=LIO0xPG4m6ovczbGokzO/6nAYJMxtOk0r1lpbgjVsxo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Su2cX8iIZmYaLsJRAq396AyLdd8vg/13NzZcdZ6MaXPeV1puFs0SpAHpUSUC3hBEAqMJlDCvQLCk0fP9wotJ268puSeax2ke50XOUk6+dTB/hfLHX7FEzEQOYPs8fANKMn8O9GixFxjENtIGf6kJzDfsebV1N0FA5qfCT7fUZ9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XF1bsKZs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XF1bsKZs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6971A1F000E9;
	Fri, 28 Aug 2026 01:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787879052;
	bh=+UnE9vgudGm98agqmtfk/SudpWHUMkZ+cmZKLZo/DVQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XF1bsKZsL8TknFNKz5+ZaoULrGyZtGdat6r98+ZUFA/Repz6HoDsmVkINv/F7kP++
	 l0Zbfwfw+MfGy1OBnVaVe9FKjm0NvWEglc6KaMhhoq7rF045sF7+5PO2/Gd9uMseKD
	 mMe3ITbF/50sqramWOoWPLEC7Uof0SV9KeFdWWBqVhcWkUNPsh79ePhIpxyhnyejZX
	 4F+jwrmEPI0P4QVn4StKjUxVqs1xveMMqWHC8gvrNuWpMH8JKusTVfCg3mKDjsI273
	 8rNhy8xw4ACAsZWTxb1ytqF0adCQHw0CIkJuqLqgYh2BfXZu7kUV/E4Ni6KY/w5Wvb
	 EF3GxBegE3tpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dmaengine: dw-axi-dmac: Fix LLI dump out-of-bounds
 access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang" <wangjia@ultrarisc.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260828-dma-fix-v1-2-a6947f487e07@ultrarisc.com>
References: <20260828-dma-fix-v1-0-a6947f487e07@ultrarisc.com>
 <20260828-dma-fix-v1-2-a6947f487e07@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 01:04:11 +0000
Message-Id: <20260828010412.6971A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The exact same out-of-bounds array access bug that this commit fix=
es in `axi_chan_list_dump_lli()` remains unpatched in `axi_chan_block_xfer_=
complete()`, compounded by a TOCTOU race.
- [High] A flawed SG iteration loop in `dw_axi_dma_chan_prep_slave_sg()` ex=
its prematurely, silently truncating transfers and causing an immediate NUL=
L pointer dereference panic.
- [High] On descriptor allocation error paths, `axi_desc_put()` will attemp=
t to free `NULL` pointers to the DMA pool and incorrectly subtract unalloca=
ted counts from `chan->descs_allocated`, leading to kernel panics and count=
er corruption.
--

commit c635f1f1d2b17ebcac96fbdff2d3244d2e75fb83
Author: Jia Wang <wangjia@ultrarisc.com>

dmaengine: dw-axi-dmac: Fix LLI dump out-of-bounds access

axi_chan_list_dump_lli() uses the channel-wide descs_allocated count to
walk the hw_desc[] array of a single transaction. If multiple
transactions have allocated LLIs, the channel count can exceed the
transaction-local nr_hw_descs and make the DMA error path read past the
end of hw_desc[].

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index 742e08cfab435..858004b5a8467 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -1052,10 +1052,9 @@ static void axi_chan_dump_lli(struct axi_dma_chan =
*chan,
>  static void axi_chan_list_dump_lli(struct axi_dma_chan *chan,
>  				   struct axi_dma_desc *desc_head)
>  {
> -	int count =3D atomic_read(&chan->descs_allocated);
>  	int i;
> =20
> -	for (i =3D 0; i < count; i++)
> +	for (i =3D 0; i < desc_head->nr_hw_descs; i++)
>  		axi_chan_dump_lli(chan, &desc_head->hw_desc[i]);
>  }

[Severity: High]
This is a pre-existing issue, but the exact same out-of-bounds array access
bug that this commit fixes in axi_chan_list_dump_lli() remains unpatched in
axi_chan_block_xfer_complete():

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:axi_chan_block_xfer_complete=
() {
    ...
    int count =3D atomic_read(&chan->descs_allocated);
    ...
    for (i =3D 0; i < count; i++) {
        hw_desc =3D &desc->hw_desc[i];
    ...
}

Does this function also need to be updated to use desc->nr_hw_descs for
its loop limit? Using the channel-wide count (which is fetched outside the
channel spinlock, presenting a TOCTOU race) could cause an out-of-bounds re=
ad
on desc->hw_desc[]. If the garbage memory happens to match llp, it will mod=
ify
the memory via hw_desc->lli->ctl_hi.


[Severity: High]
This is a pre-existing issue, but looking at dw_axi_dma_chan_prep_slave_sg(=
),
is there a flaw in the SG iteration loop?

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dw_axi_dma_chan_prep_slave_s=
g() {
    ...
    segment_len =3D DIV_ROUND_UP(sg_dma_len(sg), num_segments);
    ...
    } while (len >=3D segment_len);
    ...
    write_desc_llp(hw_desc, llp | lms);
    ...
}

If a DMA client submits a scatter-gather list where the length does not eve=
nly
divide into the hardware maximum block size (e.g., length 4097 and block
length 4096 gives a segment_len of 2049, leaving 2048 bytes), the condition
while (len >=3D segment_len) evaluates to false and exits the loop prematur=
ely.

Does this silent truncation leave trailing descriptors uninitialized, causi=
ng an
immediate NULL pointer dereference panic when write_desc_llp() tries to acc=
ess
hw_desc->lli?


[Severity: High]
This is a pre-existing issue, but does axi_desc_put() safely handle error
rollbacks?

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:axi_desc_put() {
    ...
    for (i =3D 0; i < desc->nr_hw_descs; i++) {
        ...
        dma_pool_free(chan->desc_pool, hw_desc->lli, hw_desc->llp);
        ...
    }
    ...
    atomic_sub(descs_put, &chan->descs_allocated);
}

If descriptor initialization fails midway (e.g., due to OOM causing -ENOMEM=
),
the error path calls axi_desc_put(). Because it unconditionally iterates ov=
er
all desc->nr_hw_descs elements, won't it pass NULL hw_desc->lli pointers to
dma_pool_free() for unallocated entries, resulting in a panic?

Additionally, will subtracting the full capacity (descs_put) from
chan->descs_allocated cause an underflow when only partially allocated?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-dma-fix-v1=
-0-a6947f487e07@ultrarisc.com?part=3D2
