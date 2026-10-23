Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792739424;
	b=x5yJBx0kbXCLWZgBIY0+yQOGvjpDR7u6B71lZCwu+VqdYXd6yAhCOwFr7GzB12JliymN
	 LYyu7b30nCTHDWoOlTg1G88SvdHURtgKfFqNlzWlRCj6HCWTXJWOstoDUdEnscmmjOgB7
	 VTkfRiJ3lNF81kBKq33PgkEsRwev64Y7TzjWoHx5xdralxnZA+Oi4zUWI19UayxkoguIH
	 uDpB4rGT2qF7oakjOX2cD5ok0hVadillzIJhJ8oWtej49f6eMk0y6Xz5+NtDGXymgw7Jj
	 smAPWpzXTh2hkicddtXsZvjyZr2lR6cJEbf0vChBHX0Fi+dPG1l2G6Yt41ID5FAzuqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739424;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IjUW9VOy+z+U6O2o5i7NrlYe2z7xMdh2bO5jUNJ/p34=;
	b=2/FMlRaUiuxwHVnyDfOmpHh7D3Il16Wbqt8e4MyRkaYZwitPIRMHB4/H9h5Qkg9Tn6Aa
	 pR3Daqic9U5mH/ivxK9S54+4EytQYtmGmWd0hnouQXocdpztC59OYNbX7i3ycmuG4i0/o
	 WbRVm62luJmukKRHOmQslk9p9tBr+LEr3YLrt624p3t1AaMUj2k+ocmjwSMQzt8dO0a3Y
	 RQcGvnySCkwf+8w0SwYfRLo4OyOfO4DfqoEIQiyTHV4aKGm6NVHXsc9zG3lZO4aZbqbyK
	 HrpeIE4eDF/8q0HyRzOZ8lt+Ajj5nAiZ+wTQk4BLwFpHYu4vdKghHsRYo4U1bJmY7eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JZecYBrU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E262606A32C
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 07:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JZecYBrU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67CEC1F01825;
	Fri, 23 Oct 2026 07:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792739423;
	bh=IjUW9VOy+z+U6O2o5i7NrlYe2z7xMdh2bO5jUNJ/p34=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JZecYBrUmRPxwo0QerVryVljDGZnHatcxgZz93dueswDJOwzVvjS+y5yZMmvJw6OL
	 hf1jE4LStUL4/2N3y/Wt7edLEWC65p8zANL/a0sXGLXHwpcZL7GSHUjP7ReEcuGqlW
	 XEjGMlSr5DRXMouz9JYl/064+TVGxNVntY44uxM9AoPKnU0yrua1qrcpbkSz/D9S9C
	 9xGOhbFBIuh9dSw4Tp9v66bD1bs0lTh4qieQbtYSZZGegETAsa8E6Hr6pK99B0F5w3
	 ijL+FytD3njsTVgc6bSMoKhBKOAlYSV03bmjSdNNofK0ZvZEsKf5KrjCmpCkR89rfD
	 IkpJ4VK9nbL4w==
Message-ID: <sashiko-outbox-182385@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: xilinx: Fix wild pointer dereference on
 empty segment list
Reply-To: sashiko-reviews@lists.linux.dev
To: "Li Ximo" <lixicaicai@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261023065806.3175584-1-lixicaicai@gmail.com>
References: <20261023065806.3175584-1-lixicaicai@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 07:10:22 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: xilinx: NULL return in xilinx_dma_get_metadata_ptr()
--

commit 5ff31a1fefdaf467f495be421ba38281e2cbd1a6
Author: Wang Haoran <haoranwangsec@gmail.com>

dmaengine: xilinx: Fix wild pointer dereference on empty segment list

This commit guards against empty segment lists in the Xilinx DMA prep
functions and in xilinx_dma_get_metadata_ptr() to avoid dereferencing wild
pointers from list_first_entry().

> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index cffe7c6fa6405..07f52f8412b10 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -650,8 +650,11 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_=
async_tx_descriptor *tx,
>  	struct xilinx_axidma_tx_segment *seg;
> =20
>  	*max_len =3D *payload_len =3D sizeof(u32) * XILINX_DMA_NUM_APP_WORDS;
> -	seg =3D list_first_entry(&desc->segments,
> -			       struct xilinx_axidma_tx_segment, node);
> +	seg =3D list_first_entry_or_null(&desc->segments,
> +				       struct xilinx_axidma_tx_segment, node);
> +	if (!seg)
> +		return NULL;

[Severity: High]
Should xilinx_dma_get_metadata_ptr() return an ERR_PTR() (such as
ERR_PTR(-EINVAL) or ERR_PTR(-ENODATA)) before modifying *max_len and
*payload_len when desc->segments is empty, rather than returning NULL?

The caller in drivers/dma/dmaengine.c uses the ERR_PTR() error convention a=
nd
directly returns the result of metadata_ops->get_ptr():

void *dmaengine_desc_get_metadata_ptr(struct dma_async_tx_descriptor *desc,
				      size_t *payload_len, size_t *max_len)
{
	int ret;

	if (!desc)
		return ERR_PTR(-EINVAL);

	ret =3D desc_check_and_set_metadata_mode(desc, DESC_METADATA_ENGINE);
	if (ret)
		return ERR_PTR(ret);

	if (!desc->metadata_ops || !desc->metadata_ops->get_ptr)
		return ERR_PTR(-ENOTSUPP);

	return desc->metadata_ops->get_ptr(desc, payload_len, max_len);
}

Callers of dmaengine_desc_get_metadata_ptr(), such as axienet_dma_rx_cb() in
drivers/net/ethernet/xilinx/xilinx_axienet_main.c, check the returned point=
er
with IS_ERR() before dereferencing it:

	app_metadata =3D dmaengine_desc_get_metadata_ptr(skbuf_dma->desc, &meta_le=
n,
						       &meta_max_len);
	...
	if (IS_ERR(app_metadata)) {
		if (net_ratelimit())
			netdev_err(lp->ndev, "Failed to get RX metadata pointer\n");
		dev_kfree_skb_any(skb);
		lp->ndev->stats.rx_dropped++;
		goto rx_submit;
	}

	/* TODO: Derive app word index programmatically */
	rx_len =3D (app_metadata[LEN_APP] & 0xFFFF);

Because IS_ERR(NULL) is false, returning NULL when !seg bypasses the caller=
's
error check and leads to a NULL pointer dereference, while also mutating
*max_len and *payload_len on failure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023065806.3175=
584-1-lixicaicai@gmail.com?part=3D1
