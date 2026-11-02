Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793603408;
	b=4NhF9kV6458yDLH7T0p/PGd3VMz2uvjnLRhb6L/BnQO0kBKel1kJXRu16H7fSpJNdSlA
	 D9Uo/3y7JytkTxiGZDsOvy2D9knLmsG9IyRez8o2mho04fpzQ8EhPVVcFtdzqqFeD1x9Q
	 GRFSeovvrKtRHp/7R1+ksmt5KjBBjg0cEr31MgXrQjYa1EzhT+GQ97AYk82UQ1F60wEz5
	 P2cuEk655y9rf5I/Gag4b7z0Pi06H8cMnVoYzlwI4Y713Xtmewklp9zBbTBca9q5voTeJ
	 yIG0TjWhmF4aj0lwy50fRh/HUfAeDoytwnhMwkFhRtShlh9KgVka6TeBgwdtNNZO9yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603408;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aQiC2ZyARkAEx1wtC84bg+n6W25xkOC7EF7hGKPvRPE=;
	b=mhAwKwyk0JTvtYpY1jj47t1c+bXKgwhRRVozLhBmbWr41Iy4ApTzsImFYiXIbTiCRo/s
	 OdrZCmkCprJYqwyo91QSpAbHZNIN9cvJgxN36zx0nCNDMJyQc/K965GbwF3gTklZgrU7g
	 R1L+seVhfTI8bcZ+lzpRH7k1kB6kJAIba4p9e2hWwL48sjKg/XyQwF17C9HbCcDqsk+9b
	 A/rnpMIpVF8sl8bjAHPcpZOLscecVQrui8kT3Mh1QQ4u3l992bxXPQSTyRiPI0vVo/D9s
	 NsvDMMLveKjVdlGqpCn9VU0XzBJ2HS0Ad1MEQvZSFZveIcqqYIgpIJt09oXgI312G+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IPfmeLpn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D524C606A324;
	Mon,  2 Nov 2026 07:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IPfmeLpn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E62801F000C1;
	Mon,  2 Nov 2026 07:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793603407;
	bh=aQiC2ZyARkAEx1wtC84bg+n6W25xkOC7EF7hGKPvRPE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IPfmeLpndtBXDtqjHcmfRha8aXMq6JWSVkp5aM7RLvV1Dvy9besW5d8npB4jl54sb
	 PXHH8ZUaa8n/UsT+J8P1ctKgvgPQEVjNwNENaM55g2+0CGASj/IiPjtQZkatIUGrN7
	 AvpsazjVNfnj+NNROlut42PwamV6XFdkhV7F/pNrmuK/n9c3G7OkKKhy5fTavGowDp
	 m97aqzyFGT7QnefT3X3JE7LNWgIVtY/rrwMrc9e7c065UC7YZWt3rQGbE5VhBuSHm2
	 IJTUN+w7c64meXx3V3pU+j8fGrllwqKhRsj6b9tJv+ssiY8wD4jla2HSzO5wrI9H1r
	 3CVFxuSQCS9XQ==
Message-ID: <sashiko-outbox-193000@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/7] dmaengine: fsl-edma: support per-channel DT
 child nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261102-edma-iommu-v3-v3-6-9d0e62a954eb@Example.Com>
References: <20261102-edma-iommu-v3-v3-0-9d0e62a954eb@Example.Com>
 <20261102-edma-iommu-v3-v3-6-9d0e62a954eb@Example.Com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 07:10:06 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] dmaengine: fsl-edma: missing dma_parms on chdev in fsl_edma_config=
ure_chan_iommu()
- [Medium] dmaengine: fsl-edma: 64-bit division and missing bounds check in=
 fsl_edma_child_to_chan_id()
- [Medium] dmaengine: fsl-edma: 32-bit BIT() used on u64 chan_masked in DT =
channel helpers
- [Medium] dmaengine: fsl-edma: probe failure and errirq lookup in fsl_edma=
3_irq_init() with child IRQs
- [Medium] dmaengine: fsl-edma: unimplemented child power-domains support c=
laimed in commit message
- [Medium] dmaengine: fsl-edma: silent non-deferral IOMMU errors in fsl_edm=
a_configure_chan_iommu()
--

commit 6337712c7d2219f406bdb1b2711aad20264a4f74
Author: Peng Fan <peng.fan@nxp.com>

dmaengine: fsl-edma: support per-channel DT child nodes

This commit adds support for parsing per-channel devicetree child nodes in =
the
fsl-edma driver to configure per-channel interrupts and IOMMU mappings.

>     dmaengine: fsl-edma: support per-channel DT child nodes
>    =20
>     Add support for parsing per-channel child nodes from devicetree.
>     Each child node can carry its own interrupts, iommus, and
>     power-domains properties.
>    =20
>     The implementation is split into three functions:
>    =20
>     - fsl_edma_child_to_chan_id(): derives the channel index from the
>       child MMIO address relative to the parent base.
>    =20
>     - fsl_edma_configure_chan_from_dt(): called before setup_irq() to
>       populate per-channel txirq from child interrupt properties.
>       fsl_edma3_irq_init() is updated to skip platform_get_irq() for
>       channels that already have an IRQ assigned from their child node.
>    =20
>     - fsl_edma_configure_chan_iommu(): called after
>       dmaenginem_async_device_register() to configure per-channel IOMMU
>       by calling of_dma_configure() on each dma_chan_dev and setting
>       chan_dma_dev so dmaengine_get_dma_device() returns the per-channel
>       device.
>    =20
>     Existing DTS without child nodes continues to work unchanged.
>    =20
>     Signed-off-by: Peng Fan <peng.fan@nxp.com>

[Severity: Medium]
The commit message states that each child node can carry its own interrupts,
iommus, and power-domains properties, and that support is added for parsing
per-channel child nodes from devicetree.

However, fsl_edma_configure_chan_from_dt() only parses reg and interrupts, =
and
fsl_edma_configure_chan_iommu() only parses iommus. In fsl_edma3_attach_pd(=
),
power domains are still attached by index from the parent platform_device n=
ode
via dev_pm_domain_attach_by_id(dev, i), so any power-domains properties pla=
ced
on child nodes are ignored.

Should per-channel child power-domains be attached here, or should the comm=
it
message be updated to reflect that child power-domains are not handled by t=
his
patch?

> diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
> index 30d548a723462..795744e67837d 100644
> --- a/drivers/dma/fsl-edma-main.c
> +++ b/drivers/dma/fsl-edma-main.c
[ ... ]
> @@ -400,12 +403,13 @@ static int fsl_edma3_irq_init(struct platform_devic=
e *pdev, struct fsl_edma_engi
>  		if (fsl_edma->chan_masked & BIT(i))
>  			continue;
> =20
> -		/* request channel irq */
> -		fsl_chan->txirq =3D platform_get_irq(pdev, i);
> -		if (fsl_chan->txirq < 0)
> -			return  -EINVAL;
> +		if (fsl_chan->txirq <=3D 0) {
> +			fsl_chan->txirq =3D platform_get_irq(pdev, i);
> +			if (fsl_chan->txirq < 0)
> +				return fsl_chan->txirq;
> =20
> -		fsl_chan->irq_handler =3D fsl_edma3_tx_handler;
> +			fsl_chan->irq_handler =3D fsl_edma3_tx_handler;
> +		}

[Severity: Medium]
What happens in fsl_edma3_irq_init() when a devicetree omits parent interru=
pts
and only defines available child nodes for a subset of channels (or marks s=
ome
child nodes as status =3D "disabled") without a matching dma-channel-mask?

In fsl_edma_configure_chan_from_dt(), fsl_chan->txirq is only populated for
available child nodes, leaving fsl_chan->txirq =3D=3D 0 and the channel unm=
asked
in fsl_edma->chan_masked for any remaining channels. When fsl_edma3_irq_ini=
t()
then runs, it falls back to platform_get_irq(pdev, i) on the parent device =
for
the first channel without an available child node, which fails with -ENXIO =
and
aborts fsl_edma_probe().

Also, further down in fsl_edma3_irq_init(), when FSL_EDMA_DRV_ERRIRQ_SHARE =
is
set:

	if (fsl_edma->drvdata->flags & FSL_EDMA_DRV_ERRIRQ_SHARE) {
		/* last one is error irq */
		fsl_edma->errirq =3D platform_get_irq_optional(pdev, fsl_edma->n_chans);

When per-channel interrupts are moved into child nodes, can the shared error
IRQ still be found at index fsl_edma->n_chans on the parent node?

> @@ -703,6 +707,136 @@ static int fsl_edma3_attach_pd(struct platform_devi=
ce *pdev, struct fsl_edma_eng
>  	return -EINVAL;
>  }
> =20
> +static int fsl_edma_child_to_chan_id(struct platform_device *pdev,
> +				     struct fsl_edma_engine *fsl_edma,
> +				     struct device_node *child,
> +				     struct resource *parent_res)
> +{
> +	const struct fsl_edma_drvdata *drvdata =3D fsl_edma->drvdata;
> +	struct resource child_res;
> +	u32 ch_id;
> +	int ret;
> +
> +	ret =3D of_address_to_resource(child, 0, &child_res);
> +	if (ret)
> +		return ret;
> +
> +	if (child_res.start < parent_res->start + drvdata->chreg_off)
> +		return -EINVAL;
> +
> +	ch_id =3D (child_res.start - parent_res->start - drvdata->chreg_off)
> +		/ drvdata->chreg_space_sz;
> +
> +	if (ch_id >=3D fsl_edma->n_chans)
> +		return -EINVAL;
> +
> +	return ch_id;
> +}

[Severity: Medium]
Can the division in fsl_edma_child_to_chan_id() cause a link failure on 32-=
bit
architectures with CONFIG_PHYS_ADDR_T_64BIT=3Dy (such as 32-bit ARM with LP=
AE or
32-bit PowerPC with CONFIG_PHYS_64BIT=3Dy)?

Because child_res.start and parent_res->start have type resource_size_t, the
expression

	(child_res.start - parent_res->start - drvdata->chreg_off)
		/ drvdata->chreg_space_sz

performs a 64-bit division by the non-constant u32 drvdata->chreg_space_sz
using the plain / operator, which emits an unresolved __aeabi_uldivmod or
__udivdi3 call on 32-bit builds.

In addition, before computing ch_id, only the lower bound is checked. If
child_res is not verified to be contained within parent_res (for example via
resource_contains(parent_res, &child_res)) and aligned to
drvdata->chreg_space_sz, could a large or unaligned child reg address trunc=
ate
when assigned to u32 ch_id or alias a valid channel index?

> +
> +static int fsl_edma_configure_chan_from_dt(struct platform_device *pdev,
> +					   struct fsl_edma_engine *fsl_edma)
> +{
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct resource parent_res;
> +	struct device_node *child;
> +	int ret;
> +
> +	ret =3D of_address_to_resource(np, 0, &parent_res);
> +	if (ret)
> +		return ret;
> +
> +	for_each_available_child_of_node(np, child) {
> +		struct fsl_edma_chan *fsl_chan;
> +		int ch_id, irq;
> +
> +		ch_id =3D fsl_edma_child_to_chan_id(pdev, fsl_edma, child,
> +						  &parent_res);
> +		if (ch_id < 0) {
> +			dev_err(&pdev->dev, "invalid channel in %pOFn\n", child);
> +			of_node_put(child);
> +			return -EINVAL;
> +		}
> +
> +		if (fsl_edma->chan_masked & BIT(ch_id))
> +			continue;

[Severity: Medium]
Should this check in fsl_edma_configure_chan_from_dt() (and the identical
check in fsl_edma_configure_chan_iommu() below) use BIT_ULL(ch_id) instead =
of
BIT(ch_id)?

fsl_edma->chan_masked is a u64 bitmask supporting up to 64 channels (for
example on fsl,imx95-edma5 where dma-channels is 64 and ch_id can be 0..63),
whereas BIT(ch_id) uses unsigned long and overflows on 32-bit architectures
when ch_id >=3D 32.

[ ... ]
> +static int fsl_edma_configure_chan_iommu(struct platform_device *pdev,
> +					struct fsl_edma_engine *fsl_edma)
> +{
[ ... ]
> +		list_for_each_entry(chan, &fsl_edma->dma_dev.channels,
> +				    device_node) {
> +			struct device *chdev;
> +
> +			if (to_fsl_edma_chan(chan) !=3D fsl_chan)
> +				continue;
> +
> +			chdev =3D dmaengine_chan_dev(chan);
> +			if (fsl_edma->drvdata->flags & FSL_EDMA_DRV_TCD64)
> +				dma_coerce_mask_and_coherent(chdev,
> +					DMA_BIT_MASK(64));
> +			else
> +				dma_coerce_mask_and_coherent(chdev,
> +					DMA_BIT_MASK(32));
> +			ret =3D of_dma_configure(chdev, child, true);
> +			if (ret) {
> +				dev_err(&pdev->dev,
> +					"IOMMU config failed for channel %d: %d\n",
> +					ch_id, ret);
> +				of_node_put(child);
> +				return ret;
> +			}

[Severity: Medium]
As reported by Frank Li on v1 [1], should dev_err_probe() be used here when
of_dma_configure() fails so that -EPROBE_DEFER does not log an error messag=
e?

Also, in drivers/of/device.c, of_dma_configure_id() ignores all errors from
of_iommu_configure() other than -EPROBE_DEFER (for example when duplicate
StreamIDs across channels cause arm_smmu_insert_master() to return -ENODEV)
and returns 0 after falling back to non-IOMMU DMA ops. If that happens, will
fsl_edma_configure_chan_iommu() silently set chan_dma_dev =3D true on a cha=
nnel
device that failed to attach to the IOMMU?

> +
> +			chan->chan_dev->chan_dma_dev =3D true;

[Severity: High]
When chan->chan_dev->chan_dma_dev is set to true in
fsl_edma_configure_chan_iommu(), dmaengine_get_dma_device(chan) returns chd=
ev
instead of fsl_edma->dma_dev.dev (&pdev->dev).

In fsl_edma_probe(), max_seg_size is configured on fsl_edma->dma_dev.dev:

	/* Per worst case 'nbytes =3D 1' take CITER as the max_seg_size */
	dma_set_max_seg_size(fsl_edma->dma_dev.dev,
			     FIELD_GET(EDMA_TCD_ITER_MASK, EDMA_TCD_ITER_MASK));

However, chdev->dma_parms is left as NULL on the per-channel device. Doesn't
that cause dma_get_max_seg_size(dmaengine_get_dma_device(chan)) to return t=
he
64 KiB default (SZ_64K) instead of 0x7fff (32767), allowing iommu_dma_map_s=
g()
and DMAengine clients to coalesce scatterlist segments up to 64 KiB and
overflow the 15-bit CITER/BITER iteration count in fsl_edma_prep_slave_sg()
and fsl_edma_prep_dma_cyclic()?

Should chdev->dma_parms be set to pdev->dev.dma_parms in
fsl_edma_configure_chan_iommu()?

[1] https://lore.kernel.org/r/aqrem_EkcQM2t0IE@SMW015318

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-edma-iommu=
-v3-v3-0-9d0e62a954eb@Example.Com?part=3D6
