Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA59542EDA;
	Thu, 15 Oct 2026 15:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079869; cv=none; b=d8xRQrWuHN/F/5Tsu84Njn7AFGvYpaYKllAQI+IiCHf55x+WVbi/dmp4FKpAtVLt0KfBCx7noLZJ1X6NTW6E/EJDq21lrVdAazzBE4pgtMe3a1mKL+gpv2WxKnwDAzZrCEcz9Bj4p1vdGIKxEBGwiUOF2P49bi0udcW9N7dt5JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079869; c=relaxed/simple;
	bh=rroV3Q2nBmkWM+9CqC/5gsctTk4I12+dpYM3JZfu71g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=N3HI+4ki7RSnBTaMeHQeH5pKfc0nGnnYo3K47s/QVsLVFic+FBlnAb3DeNT3SvM32enCnDENmRp7G5kpcdNHkj1pHXwNfH5fcBwu+HVn8Si8VRLMuY3eyslVxXq1sYFuWpZ6SBb2J9EqrpyqEdi8pwcaPWE7ubRZxX2TqDk87X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WMqHPwaJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WMqHPwaJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BF891F000C4;
	Thu, 15 Oct 2026 15:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792079855;
	bh=iY3PP7DIQAbfWz1JnGaeLc6zk2os4FiSyacU+IpucYE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WMqHPwaJmaIISE0zSxkfojk7xxNIrXkOgIZucNi6/gxrfu0Yeeb0IQe8FDJHUrOA1
	 Lqs59ynhAPNyb6/Ybei1yS0TW780IjEZRth/mTJE1fLHv8veOeICxcWBVSs8uK7iEA
	 ySjnFX247zGBtkn5dBkFsfS/68at5D1+LIUNb7fF+Dm7jMVvV4AuQGMiXIPaPAUDng
	 ZcmwcaEgz5JmY9pQFsdhIlrUvz70GPHreGYUxNSSh6DU95h//E7l/CsxRYRTeUCTRU
	 eNkxvHSSh1RwpfU0i22BkwjancKvhb1paUsgIW89iBKC/oFPp/lUXuNjzthqkPQCRu
	 N6lQW7fI4nNTA==
Message-ID: <sashiko-outbox-173119@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] dmaengine: replace dma_maxqp() with
 dmaengine_maxpq() taking struct dma_chan *
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com, =?utf-8?b?b3BlbiBsaXN0OkRNQSBHRU5FUklDIE9GRkxP?=
 =?utf-8?b?QUQgRU5HSU5FIFNVQlNZU1RFTQ==?= <dmaengine@vger.kernel.org>
Cc: imx@lists.linux.dev, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261015155118.3063149-2-Frank.Li@oss.nxp.com>
References: <20261015155118.3063149-1-Frank.Li@oss.nxp.com>
 <20261015155118.3063149-2-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 15:57:35 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dmaengine: stale documentation and comments after dma_maxpq rename
--

commit d1c8559bd7d041826990cfe2359c6880e20a68d4
Author: Frank Li <Frank.Li@nxp.com>

dmaengine: replace dma_maxqp() with dmaengine_maxpq() taking struct dma_cha=
n *

This commit renames dma_maxpq() to dmaengine_maxpq() and updates it to take
a struct dma_chan pointer instead of a struct dma_device pointer. It also
updates the callers in the async_tx and dmatest subsystems to use the new
API convention.

Link: https://lore.kernel.org/dmaengine/20260923-dmaengine_prep_dma_pq-v2-0=
-32ed65b8a9b4@nxp.com/

> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index c6c212ba33734..3edd80eed0a2a 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
[ ... ]
> @@ -1443,7 +1443,7 @@ static inline unsigned short dma_dev_to_maxpq(struc=
t dma_device *dma)
>  	return dma->max_pq & ~DMA_HAS_PQ_CONTINUE;
>  }
> =20
> -/* dma_maxpq - reduce maxpq in the face of continued operations
> +/* dmaengine_maxpq - reduce maxpq in the face of continued operations
>   * @dma - dma device with PQ capability

[Severity: Low]
Should this kernel-doc comment be updated to document the new @chan
parameter instead of the removed @dma parameter?

Additionally, it looks like there is a stale reference to the old function
name in drivers/dma/ioat/prep.c that says "see the comment for dma_maxpq in
include/linux/dmaengine.h". Does that file need to be updated in this patch
to reflect the rename?

>   * @flags - to check if DMA_PREP_CONTINUE and DMA_PREP_PQ_DISABLE_P are =
set
>   *
> @@ -1456,8 +1456,10 @@ static inline unsigned short dma_dev_to_maxpq(stru=
ct dma_device *dma)
>   * In the case where P is disabled we only need 1 extra source:
>   * 1/ {01} * Q : use Q to continue Q' calculation
>   */
> -static inline int dma_maxpq(struct dma_device *dma, enum dma_ctrl_flags =
flags)
> +static inline int dmaengine_maxpq(struct dma_chan *chan, enum dma_ctrl_f=
lags flags)
>  {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015155118.3063=
149-1-Frank.Li@oss.nxp.com?part=3D2
