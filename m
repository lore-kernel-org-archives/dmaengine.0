Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF2F413247
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 09:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797627; cv=none; b=QLITalhxH//Xujkl3QI+u79e6UHLxywLjiMgjXWnH49vQZPiFdbXiUtLavtO1qZ8b5HBnezxlNGzSbS2r1DlV2Tai8w5OsX+KWSjoQeTBlRJx2rO4nmBturIA25N1/F0lKImOTThOF4+ZexiPNG/SC0sisNlA/SkfSoPGW1HDjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797627; c=relaxed/simple;
	bh=2mqN7dry5zxu1tp8Zln3524/xL+huXgYvEmhUWXzxu8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YbAJLXngJXFvieA+klaLbJNd+FGkgTDRqE04RfU0ZDS9Bf86/LKH1PnxQpvHaAg+NpFSrm/GCdVijCPZQyRR5/BQD1aR1mvJwyxB2Pf5mznie0eVIEi66lQKPyNYCGXgwrUCWgJHZhvCMos52DKiptnd53obnjqRbgusvaeqeNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2NsGSkk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2NsGSkk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E41D1F000E9;
	Thu, 23 Jul 2026 09:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784797625;
	bh=ScUvh5ljK4t21B1HdlJiqQ84M+mMg2vfXATdLC44Vtw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M2NsGSkkHqcJNZ5hyNg8PMXI+WxwBrrDliH9ukc8o1YOcnxBBGBMlxfusykuVYTdA
	 i4S1AAHd6iOO1StxpxNmx7DMbiJRAW7uPA9NJyj1Yy/WsyRQiVrUZw/wW4SnAdjDD1
	 SxB8RiZxPc5CIDG7JqzVWlLO8ob2/LfTxfE/mIALhY6iO1gR+cPUp4OH3ukHJoo9Fy
	 ooD8k8ewCvkHXASH9UTjnAcKpByBLhZohxQzt1ZO3kVlNUYK3r3xWFC/5jeyLOeW3l
	 WWh23lZqojLLX6MIuXLiwUf30Mk1vnEwD5aolGhTSmg50VdOqr/EhdeOrnDO7WqSpj
	 40AIA4W6AYHhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/19] dmaengine: dw-edma: Make DMA link list work as
 a circular buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260723084150.521366-5-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-5-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 09:07:05 +0000
Message-Id: <20260723090705.9E41D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Ring buffer capacity is permanently leaked on error and terminatio=
n paths because `ll_end` is not advanced.
--

--- Patch [4]: [PATCH v2 04/19] dmaengine: dw-edma: Make DMA link list work=
 as a circular buffer ---
commit 2d5b6554b58830487f70a13eab5e1ac3de304658
Author: Frank Li <Frank.Li@nxp.com>

dmaengine: dw-edma: Make DMA link list work as a circular buffer

This commit updates the driver to use the DMA linked list as a circular
ring buffer. It appends entries at ll_head with the current cycle bit and
reserves the final entry to link back to the start.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c

[ ... ]

> @@ -645,6 +687,8 @@ static void dw_edma_done_interrupt(struct dw_edma_cha=
n *chan)
>  							    DMA_TRANS_NOERROR);
>  				list_del(&vd->node);
>  				vchan_cookie_complete(vd);
> +				if (!chan->non_ll)
> +					chan->ll_end =3D chan->ll_head;
>  			}
> =20
>  			if (chan->request =3D=3D EDMA_REQ_PAUSE) {

[Severity: High]
Does this leak ring capacity when descriptors are aborted or terminated?

This block successfully reclaims ring capacity on successful completion by
advancing chan->ll_end. However, if a client driver queues transfers and
then aborts them (for example, via dmaengine_terminate_all() or during an
abort interrupt), the descriptors are removed from the list but chan->ll_end
does not appear to be updated to reflect the aborted descriptors.

Since chan->ll_valid remains true after a termination, subsequent transfers
will bypass the dw_edma_core_reset_ll() ring reset logic and continue
appending to the un-reclaimed ring.

Will this eventually cause dw_edma_core_get_free_num() to permanently return
0 and deadlock the channel once the un-reclaimed slots exhaust the ring?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723084150.5213=
66-1-den@valinux.co.jp?part=3D4
