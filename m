Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02B14E5333;
	Thu, 17 Sep 2026 20:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789676152; cv=none; b=dND2Lr3CMyed6OPzccRVf1nCQte6RQTbEE1rPDkiWSKp2MfytpHz9YA8DsXncL9Ipk9VACGneT4yhgl7hluXvTYvxL5tFjqERcJRFLdzuzxmmQHRcRmRV4VZJWeRF715ECprvPjWKEFZj8yWx6jC475iAuqR3LtW1asUYt08w40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789676152; c=relaxed/simple;
	bh=bkqNmhbL3y8rxN7TuV9jrIbJgqSnziWZ+n2bHnlkg1w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CHTBwoNt4dcZ3SBMNDvMKGUhqxjVx3GbAePOIqVWF4qbuCZA2X4EXTItLG0cl2QvcRcOWkk3JdnlUGWz8eFQVlp48DiPg6+C4wD0DQJAqImDlSHbCosoP07qsbiXqSHkxIndM4HMKjqXcZmNcnEYTABV+cu6XPm2JkHCaYZ50zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kneL6/kS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kneL6/kS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F4D1F000FF;
	Thu, 17 Sep 2026 20:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789676145;
	bh=CQbTHf9VweIjPmCkdvV95Thm9zRMYbqUA5/M4YLYD9s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kneL6/kS5Gdhwn5ddOB1muBkNNv/1GL/R2m9X7+4WyctTveSkt4FP+H4XYEZDbyTj
	 yJpZeHhW8N1oHU0rb7i5R47nbLL0ByCnXwu06n/QmbCytLlasvLBB5+xv+6i3nsIQ6
	 9BbhMDbGSHDXBVg6VZvHlIxXNJTFc8yYDP7iI3Q3Vc481D5uowpMLTV8GlfgwZEh2O
	 rbyKNFnpEY8Fg0t7veNTaFKBGkgqBz77sGHK+/aZStZHTzGbZOwxdmMjvO3gaZOMYW
	 CJTPSyAKM13F/1aGh4ixwBTzuHUbbBuIWrj7G5EIOuB080Wrf7Auv6R37iX/F3LeAd
	 Wk5nJLUo2nTXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dmaengine: add dmaengine_prep_slave_sg_context() to
 wrap prep_slave_sg
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260917-b4-dmaengine-prep-slave-sg-v1-1-239c12864143@nxp.com>
References: <20260917-b4-dmaengine-prep-slave-sg-v1-0-239c12864143@nxp.com>
 <20260917-b4-dmaengine-prep-slave-sg-v1-1-239c12864143@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 20:15:44 +0000
Message-Id: <20260917201545.32F4D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dmaengine: missing NULL pointer checks in dmaengine_prep_slave_s=
g_context()
- [Low] dmaengine: missing __deprecated attribute on dmaengine_prep_slave_s=
g_context()
- [Low] dmaengine: typo 'Depercated' in API comment
--

commit 624ba4c53934aaa9d35d6692c60ed829474f761a
Author: Frank Li <Frank.Li@nxp.com>

dmaengine: add dmaengine_prep_slave_sg_context() to wrap prep_slave_sg

This adds a wrapper function for dmaengine_prep_slave_sg_context() to allow
certain consumers and providers to use the context argument without accessi=
ng
the DMA engine callback pointer directly. It also prepares to make the DMA
engine provider internals private, and marks the new wrapper as deprecated.

> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index c3a49a33307c6..b4589cad6d742 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -1084,6 +1084,19 @@ dmaengine_prep_slave_sg(struct dma_chan *chan, str=
uct scatterlist *sgl,
>  	return dmaengine_prep_config_sg(chan, sgl, sg_len, dir, flags, NULL);
>  }
> =20
> +/* Depercated, don't use it except sound/soc/sprd/ */

[Severity: Low]
This isn't a bug, but there's a typo in the comment: "Depercated" instead of
"Deprecated".

> +static inline struct dma_async_tx_descriptor *

[Severity: Low]
Since the comment and commit message note this function is deprecated, shou=
ld
it be marked with the __deprecated compiler attribute so that any new usages
trigger a compile-time warning?

> +dmaengine_prep_slave_sg_context(struct dma_chan *chan, struct scatterlis=
t *sgl,
> +				unsigned int sg_len, enum dma_transfer_direction dir,
> +				unsigned long flags, void *context)
> +{
> +	if (!chan->device->device_prep_slave_sg)

[Severity: Medium]
Does this expose callers to a NULL pointer dereference if an uninitialized
or invalid channel is passed?

Other public wrappers in the DMA engine API, such as dmaengine_prep_config_=
sg(),
explicitly check if (!chan || !chan->device) before accessing the device
pointer.

Should this function include the same safeguard?

> +		return NULL;
> +
> +	return chan->device->device_prep_slave_sg(chan, sgl, sg_len, dir,
> +						  flags, context);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-b4-dmaengi=
ne-prep-slave-sg-v1-0-239c12864143@nxp.com?part=3D1
