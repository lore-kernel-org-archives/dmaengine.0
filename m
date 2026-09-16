Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9678837204D;
	Wed, 16 Sep 2026 16:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574769; cv=none; b=QVoxJt+XfoH3lLnMN9FlV2i5Ekl+Zms554fVxGicDZ8SKeLmrjy4OvrYdqTsx4+NGalyWh3skY6k6aD+btt36GxHDBBB5/JXGa7unpsXA8FXfq0nW4826nfZNLPt/N+PIPDO1j/CaAIpW3hxCrzBWCIT0O+aP8W/XKZ1XnlccbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574769; c=relaxed/simple;
	bh=Qj5+127DNCzkqzuGszQrzjZHHjYHFiRkVcP+p8nkCgM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zz0z7fwbbCROCtojewZAnUqEpdWyzhIY0lDq0uKHJAyESOMgMhDkHX8feidNkK9DzJ+NZTGa+/iUvIf2lzeNmMv0Hn3RGvGqSNLhfnO/96YwCcjsTJ7bFs1glAwcNzzeuNudE+g7R7UfNx+h6FiQfE64y4O8j5KjyuCa3Qs8+NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVsZDh9W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVsZDh9W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099201F000FF;
	Wed, 16 Sep 2026 16:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789574768;
	bh=bSsGmSvnVHVpXDKo8RRXMT5lZT++LQtq9ySeurTXxjI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NVsZDh9WkmzuwKmrumd1EVQHYa9Hql/X8kpfqLXCSXw+dlYlIYOykg0O//h02Wrig
	 P9ulmS6CyKHE1ptwtn20AT5j3eyzo3cJAufJNn4VqWqTlbQZD8L1B9mYbyOHjn6/AO
	 u7D0r2+sPJtv7lGNZoGlPk9S1R/z8udvEmhi5FaY5qSZS0X1i4tdLwfzLIgAWWiYYN
	 4SuXCqzrIx61FaUg/BNX6I/zIAt45uZDrZhxecDj26nHwcEBiCO9+HMR1Yr6JPmhsp
	 MJl3vVXCa9jB68PVlZWlfVB1zI5uV1E2+OoZHNXNz6GfDz7vLAF1z4/SSLA8iBSIDF
	 SGim6ZmKGoRJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dmaengine: fsl-edma: add per-channel IOMMU support
 via iommu-map
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260916-edma-iommu-v1-2-e1731968081e@nxp.com>
References: <20260916-edma-iommu-v1-0-e1731968081e@nxp.com>
 <20260916-edma-iommu-v1-2-e1731968081e@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 16:06:07 +0000
Message-Id: <20260916160608.099201F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] dmaengine: fsl-edma: TCD pool mapped to parent device causing IOMM=
U faults
- [High] dmaengine: fsl-edma: masking -EPROBE_DEFER in xlate breaks deferre=
d probe
- [High] dmaengine: fsl-edma: late modification of dev->bus causes refcount=
 underflow
- [High] dmaengine: fsl-edma: DMA_MEMCPY channels bypass IOMMU configuration
- [High] dmaengine: fsl-edma: missing IOMMU configuration in fsl_edma_xlate
- [High] dmaengine: fsl-edma: dirty srcid state on error path blocks future=
 requests
--

commit 94975a647e48c96637ca91c3ba2539ad15656ede
Author: Peng Fan <peng.fan@nxp.com>

dmaengine: fsl-edma: add per-channel IOMMU support via iommu-map

This patch adds iommu-map support so each eDMA channel can be individually
mapped to an IOMMU stream ID. At probe time, per-channel devices are
initialized, and at xlate time the IOMMU domain is configured.

> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
> index bb7531c456dfa..58a92ff4ddbe7 100644
> --- a/drivers/dma/fsl-edma-common.c
> +++ b/drivers/dma/fsl-edma-common.c
> @@ -283,8 +283,10 @@ int fsl_edma_resume(struct dma_chan *chan)
> =20
>  static void fsl_edma_unprep_slave_dma(struct fsl_edma_chan *fsl_chan)
>  {
[ ... ]
> @@ -294,7 +296,7 @@ static void fsl_edma_unprep_slave_dma(struct fsl_edma=
_chan *fsl_chan)
>  static bool fsl_edma_prep_slave_dma(struct fsl_edma_chan *fsl_chan,
>  				    enum dma_transfer_direction dir)
>  {
> -	struct device *dev =3D fsl_chan->vchan.chan.device->dev;
> +	struct device *dev =3D dmaengine_get_dma_device(&fsl_chan->vchan.chan);
>  	enum dma_data_direction dma_dir;
>  	phys_addr_t addr =3D 0;
>  	u32 size =3D 0;

[Severity: High]
Since the new per-channel IOMMU feature maps channel devices differently fr=
om
the parent controller, does the hardware TCD pool allocation in
fsl_edma_alloc_chan_resources() also need to be updated?

It currently maps the TCD pool using the parent controller device:

	fsl_chan->tcd_pool =3D dma_pool_create("tcd_pool", chan->device->dev, ...

If the pool uses the parent device, won't its DMA addresses be invalid in
the channel's hardware IOMMU domain, causing translation faults when fetchi=
ng
the TCDs?

> diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
> index d9fb717b5b53c..eabb0086fc9de 100644
> --- a/drivers/dma/fsl-edma-main.c
> +++ b/drivers/dma/fsl-edma-main.c
[ ... ]
> @@ -332,6 +334,12 @@ static struct dma_chan *fsl_edma3_xlate(struct of_ph=
andle_args *dma_spec,
>  		fsl_chan->is_remote =3D dma_spec->args[2] & FSL_EDMA_REMOTE;
>  		fsl_chan->is_multi_fifo =3D dma_spec->args[2] & FSL_EDMA_MULTI_FIFO;
> =20
> +		if (fsl_edma->has_iommu_map) {
> +			ret =3D fsl_edma_chan_configure_iommu(fsl_chan);
> +			if (ret)
> +				return NULL;
> +		}
> +

[Severity: High]
If fsl_edma_chan_configure_iommu() fails and returns -EPROBE_DEFER because =
the
IOMMU driver is not yet probed, this drops the valid error code and returns
NULL. Will this mislead the core DMA engine (which treats NULL as 'channel =
not
found') and break deferred probing for client devices?

[Severity: High]
If fsl_edma_chan_configure_iommu() fails and returns an error, returning NU=
LL
here does not roll back the state assignments made just above
(e.g., fsl_chan->srcid =3D dma_spec->args[0]). Because the channel wasn't
successfully allocated, fsl_edma_free_chan_resources() will never be called=
 to
clear it. Will this leave a dirty srcid state that permanently locks out
future client requests for this hardware signal due to fsl_edma_srcid_in_us=
e()?

[Severity: High]
Because this IOMMU configuration logic is placed exclusively inside the DT
xlate function, does it completely bypass non-DT channel allocations? If a
client driver requests a channel for DMA_MEMCPY, memory will be mapped using
the parent controller device while the channel hardware fetches using its
hardwired Stream ID. Won't this cause IOMMU translation faults for non-DT
channels?

>  		chan =3D dma_get_slave_channel(chan);
>  		chan->device->privatecnt++;
>  		return chan;
[ ... ]
> +static void fsl_edma_init_chan_iommu(struct platform_device *pdev,
> +				    struct fsl_edma_engine *fsl_edma)
> +{
[ ... ]
> +	for (i =3D 0; i < fsl_edma->n_chans; i++) {
> +		struct fsl_edma_chan *fsl_chan =3D &fsl_edma->chans[i];
> +		struct device *dev;
> +
> +		if (fsl_edma->chan_masked & BIT(i))
> +			continue;
> +
> +		dev =3D &fsl_chan->vchan.chan.dev->device;
> +		dev->coherent_dma_mask =3D pdev->dev.coherent_dma_mask;
> +		dev->dma_mask =3D &dev->coherent_dma_mask;
> +		dev->bus =3D pdev->dev.bus;

[Severity: High]
Does this illegally modify the bus type of an already-registered device?

This is executed after dmaenginem_async_device_register() has already called
device_add(). Since bus_add_device() is never executed, won't device_del()
invoke bus_remove_device() during driver unbinding or removal, causing a fa=
tal
reference count underflow and use-after-free on the global platform_bus_type
subsystem?

> +	}
> +
> +	fsl_edma->has_iommu_map =3D true;
> +}
[ ... ]
> @@ -882,6 +954,8 @@ static int fsl_edma_probe(struct platform_device *pde=
v)
>  		return dev_err_probe(&pdev->dev, ret,
>  				     "Can't register Freescale eDMA engine.\n");
> =20
> +	fsl_edma_init_chan_iommu(pdev, fsl_edma);
> +
>  	ret =3D devm_of_dma_controller_register(&pdev->dev, np,
>  			drvdata->dmamuxs ? fsl_edma_xlate : fsl_edma3_xlate,
>  			fsl_edma);

[Severity: High]
Since the per-channel IOMMU configuration was only added to fsl_edma3_xlate=
(),
does this entirely omit configuration for hardware variants relying on
fsl_edma_xlate()? Will controller variants using fsl_edma_xlate bypass the
IOMMU configuration and cause hardware translation faults?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-edma-iommu=
-v1-0-e1731968081e@nxp.com?part=3D2
