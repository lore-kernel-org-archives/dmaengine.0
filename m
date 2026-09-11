Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E313D647C;
	Fri, 11 Sep 2026 06:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789107978; cv=none; b=LkZb0auL8HkkIAHdm7sahwHWil7Bfp5ii5Zi9wy7KMZJRN82IERccoR1cTvBJO8GtfhXEHIhDk8KPJ50nNIg7W884rPjc6HDA8fFYUwQe70J0J0ybR6KFNSA8HwKARx/FVvKQcTZbS+49eInsyaCejfFOXB48nNBM+xQZsMF6zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789107978; c=relaxed/simple;
	bh=sR5GKss9r2XWwJijZ1L4GYxywqgK8XXB1hcuLwjZwWI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UtOkBHZArjC0eFldNaqNEniRM9ONCLmgX8u3ytZlaT4lL8dUP9NmdfvUoQ9oDpyNssS4qdCd2qUq1rVBnQb2eNHl6zvnQJjipIUK0k8mobOZX1y+C3k60Kc0VG+0gIS20U31zmaN+OC2XZ/PHrho5BITMIrCgY4p1wzkALgwpBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VU0FCMKP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VU0FCMKP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49AE1F00893;
	Fri, 11 Sep 2026 06:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789107970;
	bh=obER54slj/jr9x9QFgNOeQ99rtMC5FNXc4eaQuwOnyM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VU0FCMKPfiDoETgoatCEYn826woH/OvqDOO4E1HwlB9oSylNpNl/B6rgOg1GeV4YO
	 nLvJExdpKzrhkvlK7962HlhGUiVKkJEeDD3gvWKKjZwz3innfyzwq79GfbKeA3VVEr
	 IsvXLVIO77x4MNCcr+LaRgHU0GKSyePG77GWtixnD9kmyKBdOX6VKucRmRyljqS8HT
	 I7gK9QscpKs/58M7ust+tTzJSNNo1ivOvE0b2nZuW23hEdK54tnRk3CvjP1BMTTFJ5
	 2OA7zMM/XaZFZxe2/apIWCYCPU3mx01c4gIQvG6nTvmqQIpU9vlzc3pprrZLpb/YvG
	 poyuPjX0UW95A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC] dmaengine: fsl-edma: check channel acquisition
 before use
Reply-To: sashiko-reviews@lists.linux.dev
To: "Slavin Liu" <bolin.liu@seu.edu.cn>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260911060902.94153-1-bolin.liu@seu.edu.cn>
References: <20260911060902.94153-1-bolin.liu@seu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 06:26:09 +0000
Message-Id: <20260911062609.D49AE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Premature abortion of channel multiplexing search when channel acq=
uisition fails.

Pre-existing issues:
- [High] Double-increment of device privatecnt causes a reference leak and =
lockless data race.
- [High] Acquired DMA channel is permanently leaked on error path in fsl_ed=
ma_xlate.
- [High] Channel state flags like `srcid` and `is_remote` are updated lockl=
essly during resource free, racing with channel allocation logic.
- [High] Failure to verify the return value of `dma_pool_create()` leads to=
 a latent NULL pointer dereference.
--

commit fd5b3c44a24930a11481b00458a1c4c8b54e5433
Author: Slavin Liu <bolin.liu@seu.edu.cn>

    dmaengine: fsl-edma: check channel acquisition before use
   =20
    dma_get_slave_channel() can return NULL when acquiring a channel fails,
    for example if fsl_edma_alloc_chan_resources() cannot request an IRQ.
    fsl_edma3_xlate() dereferences that return value to update privatecnt.

> diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
> index d9fb717b5b53c..6934ac8826976 100644
> --- a/drivers/dma/fsl-edma-main.c
> +++ b/drivers/dma/fsl-edma-main.c
> @@ -326,13 +326,16 @@ static struct dma_chan *fsl_edma3_xlate(struct of_p=
handle_args *dma_spec,
>  		if ((dma_spec->args[2] & FSL_EDMA_ODD_CH) && !(i & 0x1))
>  			continue;
> =20
> +		chan =3D dma_get_slave_channel(chan);
> +		if (!chan)
> +			return NULL;

[Severity: High]
Does returning NULL here prematurely abort the channel multiplexing search?

If the first eligible channel fails dma_get_slave_channel() (e.g., due to a=
n=20
IRQ allocation error), returning NULL prevents the loop from checking other=
=20
available channels.=20

In multiplexed environments, should this use continue instead of return NUL=
L to=20
attempt acquiring the next available channel in the list?

> +
>  		fsl_chan->srcid =3D dma_spec->args[0];
>  		fsl_chan->priority =3D dma_spec->args[1];
>  		fsl_chan->is_rxchan =3D dma_spec->args[2] & FSL_EDMA_RX;
>  		fsl_chan->is_remote =3D dma_spec->args[2] & FSL_EDMA_REMOTE;
>  		fsl_chan->is_multi_fifo =3D dma_spec->args[2] & FSL_EDMA_MULTI_FIFO;
> =20
> -		chan =3D dma_get_slave_channel(chan);
>  		chan->device->privatecnt++;

[Severity: High]
This is a pre-existing issue, but does this cause a reference leak and lock=
less
data race on the device privatecnt?

Since dma_get_slave_channel() safely increments privatecnt under=20
dma_list_mutex, manually incrementing it again here without holding the loc=
k=20
appears redundant. This double-increment could permanently leak the private=
=20
capability counter.

The same unprotected double-increment is also present in the legacy transla=
tion=20
function fsl_edma_xlate().

[ ... ]

[Severity: High]
This is a pre-existing issue, but does fsl_edma_xlate() permanently leak the
acquired DMA channel on this error path?

drivers/dma/fsl-edma-main.c:fsl_edma_xlate() {
    ...
				if (!fsl_chan->srcid) {
					dev_err(&fsl_chan->pdev->dev, "Invalidate srcid %d\n",
						fsl_chan->srcid);
					return NULL;
				}
    ...
}

If a device tree specifies a 0 source ID, the function directly returns NULL
without unwinding and releasing the previously acquired dma_chan via
dma_release_channel().


[Severity: High]
This is a pre-existing issue, but do these lockless updates in=20
fsl_edma_free_chan_resources() race with channel allocation logic?

drivers/dma/fsl-edma-common.c:fsl_edma_free_chan_resources() {
    ...
    fsl_chan->srcid =3D 0;
    fsl_chan->is_remote =3D false;
    ...
}

These shared state fields are updated without holding fsl_edma_mutex. If on=
e=20
device releases its DMA channel while another requests a channel for the sa=
me=20
source ID, could fsl_edma3_xlate() observe a stale non-zero value?=20

This could cause a spurious failure in fsl_edma_srcid_in_use():

drivers/dma/fsl-edma-main.c:fsl_edma_srcid_in_use() {
    ...
    if (fsl_chan->srcid && srcid =3D=3D fsl_chan->srcid)
    ...
}


[Severity: High]
This is a pre-existing issue, but does fsl_edma_alloc_chan_resources() fail=
 to=20
verify the return value of dma_pool_create()?

drivers/dma/fsl-edma-common.c:fsl_edma_alloc_chan_resources() {
    ...
	fsl_chan->tcd_pool =3D dma_pool_create("tcd_pool", chan->device->dev,
				fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_TCD64 ?
				sizeof(struct fsl_edma_hw_tcd64) : sizeof(struct fsl_edma_hw_tcd),
				32, 0);

	if (fsl_chan->txirq)
    ...
}

If dma_pool_create() fails under memory pressure and returns NULL, the func=
tion
ignores the error and returns success to the DMA framework.=20

Subsequent DMA transfer preparations would pass the NULL pool pointer to=20
dma_pool_alloc(), causing a null pointer dereference when accessing the poo=
l's=20
internal spinlock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911060902.9415=
3-1-bolin.liu@seu.edu.cn?part=3D1
