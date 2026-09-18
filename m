Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6059518127
	for <dmaengine@vger.kernel.org>; Fri, 18 Sep 2026 16:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749423; cv=none; b=VbuyiznA/HGujXx7CprOsok21lvQ8k6WzZcv0ER1MQlD6WbcV2EOUGBvS3fIQKJna9rVYsiKsh0MEIM/yh7FknDeQ1+8o16PfuJwmJEjFLu4i6eNYxGKIlfBRExGQd0GG2ljjX+XLOb8CnEw8ebe1o5w0ImzbxTaghZquyIv3q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749423; c=relaxed/simple;
	bh=rcBGyn6jrDqaequDHZ4xkPNjKsE0QHNCQCGXnYymoqs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RwTlYPsVUn1IBsY8uE7EdtqpSQQG3aMA86jHjrV0MxXCBHhC0zgstsEFbZEAlVP9nQO88bvXgIx+SvuuncggB/kguXa6fHscB0OKZ/UrPYlT/1hRSjs9JnoT3lwfeMuGI+odLhOaaJjhXMg56iUf1oG91gfXHFpwslfxa/THWwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EEraWchS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EEraWchS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2366F1F000FF;
	Fri, 18 Sep 2026 16:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789749421;
	bh=rVvttde0EMVfiXWDWThhaD+aO8QekUxtCEAGlG4qRtA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EEraWchSXGKKLL20Wy/lsvGDzVME8bPCCLux2dEUxXOeYP72vIoTiq99VfIqMw5cb
	 H8RauqOL3y4lclZTlGjBUvHsGRkeaDMjx+Xtn3Y4aYUCbsqk/SHjj9Bf0tkkBThZCV
	 i/nBw0md9Ag3wrrTnc9xhFCso3u5HDoJ9XM8GdxXMEjG74SMgXC27qez0vhGjBh9CH
	 xb09GdBul3/vUuWq2Bd+7ZSFANctj+QywpldxOsl4fk5SxPGQMSAskzeljjdU0Nr2f
	 u2eN0ToLhrseopiTYkElVfjapi/iXY4lusxtv8sGN9pw0yfmrVL28gVnWyCZhH4sa5
	 +mkfuSHEb51rA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/22] dmaengine: ste_dma40: Handle runtime PM resume
 errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260918-dma40-fixes-v3-6-8dd8450669e8@kernel.org>
References: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
 <20260918-dma40-fixes-v3-6-8dd8450669e8@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 16:37:00 +0000
Message-Id: <20260918163701.2366F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dmaengine: ste_dma40: skip channel teardown on PM resume failure
- [High] dmaengine: ste_dma40: leave descriptor queued on PM resume failure
--

commit ed522d6297daebccbf846812d9e9d09ad29b8000
Author: Linus Walleij <linusw@kernel.org>

    dmaengine: ste_dma40: Handle runtime PM resume errors
   =20
    This commit replaces pm_runtime_get_sync() with pm_runtime_resume_and_g=
et()
    in several ste_dma40 channel operations. It adds error checking to abort
    hardware access if the PM resume fails.

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 1baee6f4d919a..c6f633353f3ea 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c

[ ... ]

> @@ -1521,8 +1527,13 @@ static struct d40_desc *d40_queue_start(struct d40=
_chan *d40c)
> =20
>  	if (d40d !=3D NULL) {
>  		if (!d40c->busy) {
> +			err =3D pm_runtime_resume_and_get(d40c->base->dev);
> +			if (err < 0) {
> +				chan_err(d40c, "Failed to resume DMA: %d\n",
> +					 err);
> +				return ERR_PTR(err);
> +			}

[Severity: High]
Does returning an error here without removing the pending descriptor from t=
he
queue or scheduling a completion tasklet cause issues? If a caller such as
dma_async_issue_pending() triggers this, it appears the DMA client will hang
indefinitely waiting for a transfer completion callback that never arrives.

>  			d40c->busy =3D true;
> -			pm_runtime_get_sync(d40c->base->dev);
>  		}
> =20
>  		/* Remove from queue */

[ ... ]

> @@ -2042,9 +2053,6 @@ static int d40_free_dma(struct d40_chan *d40c)
>  	struct d40_phy_res *phy =3D d40c->phy_chan;
>  	bool is_src;
> =20
> -	/* Terminate all queued and active transfers */
> -	d40_term_all(d40c);
> -
>  	if (phy =3D=3D NULL) {
>  		chan_err(d40c, "phy =3D=3D null\n");
>  		return -EINVAL;
> @@ -2066,7 +2074,13 @@ static int d40_free_dma(struct d40_chan *d40c)
>  		return -EINVAL;
>  	}
> =20
> -	pm_runtime_get_sync(d40c->base->dev);
> +	res =3D pm_runtime_resume_and_get(d40c->base->dev);
> +	if (res < 0)
> +		return res;
> +
> +	/* Terminate all queued and active transfers */
> +	d40_term_all(d40c);
> +

[Severity: High]
Can this early return on PM resume failure cause hardware channels and
descriptor memory to leak? By returning before calling d40_term_all() and
d40_alloc_mask_free(), the physical channel state seems permanently locked =
to
allocated and descriptors are not released.

>  	res =3D d40_channel_execute_command(d40c, D40_DMA_STOP);
>  	if (res) {
>  		chan_err(d40c, "stop failed\n");

[ ... ]

> @@ -2658,7 +2675,10 @@ static int d40_terminate_all(struct dma_chan *chan)
> =20
>  	spin_lock_irqsave(&d40c->lock, flags);
> =20
> -	pm_runtime_get_sync(d40c->base->dev);
> +	ret =3D pm_runtime_resume_and_get(d40c->base->dev);
> +	if (ret < 0)
> +		goto unlock;
> +

[Severity: High]
Does jumping to the unlock label here skip d40_term_all()? If
pm_runtime_resume_and_get() fails, it looks like pending and active
descriptors are left in the queues and permanently leaked instead of being
cleaned up.

>  	ret =3D d40_channel_execute_command(d40c, D40_DMA_STOP);
>  	if (ret)
>  		chan_err(d40c, "Failed to stop channel\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-dma40-fixe=
s-v3-0-8dd8450669e8@kernel.org?part=3D6
