Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88D536AB6B
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641803; cv=none; b=cHCT6iBc5eOJqv/DAyXnDzX8tNCntYG8SdnDzkId6RTGBnQHvOpuLIqK0pgtcAM6li32MSouN/X9HpVjHiZ8kJhH0C7tHupVr/QFVBIPwJJU18jEGhJABizxJQbLyMie+jKZPqF0AYKv7pGZii6y67Od/nHN4ynWSHAYpyJLK4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641803; c=relaxed/simple;
	bh=lx5BCGuFz9j46E6Z92SS73BNHj7e/Dj3UApbZXP3aRc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g+XpX1NpvVecZlyEZrIXLWTNsEtJM1BGu2yOUl2m33p47IQpM0DDwG9MI6In6o8e8xdBKDk+fZGrmx+YJ+UznIX1CGYvu95uDTtpO3WiN4+oNOO8ResY+hOGHb0RrUFKCAxYhMOsfF9ggH0BbAyn6JyKTwfQ1UAtj/adftzXev4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yz57xYwq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yz57xYwq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CDDE1F000E9;
	Tue, 21 Jul 2026 13:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784641801;
	bh=m+gqxxHZgyNEywGgUmUwVhxtmfPW/M0S2N2GTn31jZc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yz57xYwq/C5mRXhFAzK2ZgbzNdVxa/L3w/Tc3EJM75dtjeVx7ysAhsyHCPArlCuNr
	 AwtUwHg+FmPJATR4LLLGKBgUDqDMtsAe6ur/TRxRf2RQv+9fM+DZpn76WROLKlcZQD
	 J7kq2osVjRXgNEMsfDoL51Q01lEnrP13bjl3TRRMGEWX7v7KsLfjD9dKCfGeLWdAys
	 XACmkvAbdTABSsn7j/yvXAtDgtMxSB/6+jcoDMvvOWgeXXTCYa3iqSHbRbLUn41NE/
	 sid7cVpmgbo2GP5tK0jtGH+QBhvgK1kWDAr8dGyfOMl8P5BzEGavgXM92SiN2QDR7T
	 wUO7xwbgkSvOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 13/14] crypto: qce - Add BAM DMA support for crypto
 register I/O
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-13-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-13-1be02deffda9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 13:50:00 +0000
Message-Id: <20260721135000.9CDDE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] BAM DMA command descriptors are populated with native-endian value=
s instead of little-endian values, breaking Big-Endian architectures.
- [Medium] Extremely inefficient scatterlist generation isolates every comm=
and into its own scatterlist entry instead of batching them.
- [Medium] Early return in `qce_dma_terminate_all` bypasses DMA unmapping a=
nd TX channel termination on failure.
- [Low] Unnecessary dynamic allocation and unused struct `qce_desc_info`.
--

--- Patch [13]: [PATCH v23 13/14] crypto: qce - Add BAM DMA support for cry=
pto register I/O ---
commit 5eea68044298bd3c177ad5e3c2972d5e1761d259
Author: Bartosz Golaszewski <brgl@kernel.org>

crypto: qce - Add BAM DMA support for crypto register I/O

Switch to using BAM DMA for register I/O in addition to passing data. To
that end: provide the necessary infrastructure in the driver, modify the
ordering of operations as required and replace all direct register writes
with wrappers queueing DMA command descriptors.

> diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
> index 26347e9fc078a..88d253d9147cf 100644
> --- a/drivers/crypto/qce/dma.c
> +++ b/drivers/crypto/qce/dma.c
[ ... ]
> +int qce_submit_cmd_desc(struct qce_device *qce)
> +{
> +	struct qce_desc_info *qce_desc =3D qce->dma.bam_txn->desc;
> +	struct qce_bam_transaction *bam_txn =3D qce->dma.bam_txn;
> +	struct dma_async_tx_descriptor *dma_desc;
> +	struct dma_chan *chan =3D qce->dma.rxchan;
> +	unsigned long attrs =3D DMA_PREP_CMD;
> +	dma_cookie_t cookie;
> +	unsigned int mapped;
> +	int ret;
> +
> +	mapped =3D dma_map_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, D=
MA_TO_DEVICE);
> +	if (!mapped)
> +		return -ENOMEM;
> +
> +	dma_desc =3D dmaengine_prep_slave_sg(chan, bam_txn->wr_sgl, mapped, DMA=
_MEM_TO_DEV, attrs);
> +	if (!dma_desc) {
> +		ret =3D -ENOMEM;
> +		goto err_unmap_sg;
> +	}
> +
> +	qce_desc->dma_desc =3D dma_desc;
> +	cookie =3D dmaengine_submit(qce_desc->dma_desc);

[Severity: Low]
Is the separate dynamic allocation and usage of struct qce_desc_info
necessary?

The dma_desc field appears to be used merely to temporarily hold the
dma_desc pointer right before passing it directly to dmaengine_submit().
Additionally, the dir field of struct qce_desc_info is never used. Removing
this could avoid unnecessary code complexity and memory allocation overhead.

[ ... ]
> +static void qce_prep_dma_cmd_desc(struct qce_device *qce, struct qce_dma=
_data *dma,
> +				  unsigned int addr, void *buf)
> +{
> +	struct qce_bam_transaction *bam_txn =3D dma->bam_txn;
> +	struct bam_cmd_element *bam_ce_buf;
> +	int bam_ce_size, cnt, idx;
> +
> +	idx =3D bam_txn->bam_ce_idx;
> +	bam_ce_buf =3D &bam_txn->bam_ce[idx];
> +	bam_prep_ce_le32(bam_ce_buf, addr, BAM_WRITE_COMMAND, *((__le32 *)buf));

[Severity: High]
Can this cause endianness issues on big-endian architectures?

When qce_write_dma() is called, the host-endian u32 variable val is passed
by reference. Casting the pointer with *((__le32 *)buf) merely reinterprets
the memory without applying the required cpu_to_le32() byte swap. As a
result, the native bytes are assigned directly to bam_ce->data, discarding
the endianness handling that the prior writel() implementation provided.

> +
> +	bam_ce_buf =3D &bam_txn->bam_ce[bam_txn->pre_bam_ce_idx];
> +	bam_txn->bam_ce_idx++;
> +	bam_ce_size =3D (bam_txn->bam_ce_idx - bam_txn->pre_bam_ce_idx) * sizeo=
f(*bam_ce_buf);
> +
> +	cnt =3D bam_txn->wr_sgl_cnt;
> +
> +	sg_set_buf(&bam_txn->wr_sgl[cnt], bam_ce_buf, bam_ce_size);
> +
> +	++bam_txn->wr_sgl_cnt;
> +	bam_txn->pre_bam_ce_idx =3D bam_txn->bam_ce_idx;
> +}

[Severity: Medium]
Does this logic unintentionally isolate every single command into its own
scatterlist entry?

Because pre_bam_ce_idx is immediately synchronized with bam_ce_idx at the
end of this per-write wrapper, the bam_ce_size calculation will always equal
the size of a single element. This appears to defeat the contiguous bam_ce
array batching, resulting in around 80 discrete hardware descriptors per
operation, which may degrade performance and waste DMA ring capacity.

[ ... ]
>  int qce_dma_terminate_all(struct qce_dma_data *dma)
>  {
> +	struct qce_device *qce =3D container_of(dma, struct qce_device, dma);
> +	struct qce_bam_transaction *bam_txn =3D dma->bam_txn;
>  	int ret;
> =20
>  	ret =3D dmaengine_terminate_all(dma->rxchan);
> -	return ret ?: dmaengine_terminate_all(dma->txchan);
> +	if (ret)
> +		return ret;
> +
> +	dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEV=
ICE);
> +
> +	return dmaengine_terminate_all(dma->txchan);
>  }

[Severity: Medium]
Could this early return cause a memory leak and leave the TX channel
orphaned?

If dmaengine_terminate_all(dma->rxchan) fails during an error rollback
(e.g., from the error_terminate path), returning early completely abandons
the unmapping of bam_txn->wr_sgl and fails to terminate dma->txchan. Should
the teardown sequence proceed to release the remaining resources even if
this step fails?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-qcom-qce-c=
md-descr-v23-0-1be02deffda9@oss.qualcomm.com?part=3D13
