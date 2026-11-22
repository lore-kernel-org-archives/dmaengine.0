Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795341732;
	b=qaHQla3iPy6aYYJ0PAsT/vfi6r0c4a6UvVIlBOmqtX4SzIKAA93sKAJ8YTrIytQJgrzQ
	 QEtDJOAeLRQG6lgEKq1VqPHTi2tI6cTUvg7pRESWXCHKS3cdF5y2n4D7/HyLaiOF6o+FH
	 gXgJpivIR5igwnTYi8DuX7wZTqpg43Rtnjka/N9clftza+ROu36TIyP45xuAgBbiPvpSO
	 W7MaGOH1aqriLmEC5Q5justfIp07oYXqZh8BRV9SDVSB9vBNG6zBaRhWxU2hoDqmIB2M5
	 +56wdKkXSG3Gx/9BS1YyN0vOhppKJJ60M1q9/IPb2kxgp/SKKHqIV8vaR1QmBYtOE9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795341732;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iPXeVbUPSAnwOCmXI1Is/kb8j/fBzUSx76g6BvVy96U=;
	b=oYNXM02DFal/gHarlrLKFdWAE7NqWmKD0JUDeqKyvGCAAVwu148pGug1lwIGHU0y3eB6
	 hFN8VMU55qFFqsrTkqTJeFo81dVvkB/f9MghMtDB/SwoOh1jydF/JHb0ujo5ZRQKy9lOX
	 fH6PkwTEQs+I5JPMZ0HyJEXk5q9xjvCnNH36i1vCYOgyf3UpGxezezoaxQ7bfpdtww26e
	 3O+G9uwRRRxn3xik473EcNqt6ivDPspIFBhKMKK36LZIax5jU4s55PXq15uc4VBAiITxh
	 +9/qM+gfDWUnnuCtK3+4RQ4Ayoa0BKu16n1Ho70KbIM2JME5tJwrVpQcZpS31tZbt7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h5RJAm3c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FB0606A332
	for <dmaengine@vger.kernel.org>; Sun, 22 Nov 2026 10:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h5RJAm3c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 237ED1F000C0;
	Sun, 22 Nov 2026 10:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795341732;
	bh=iPXeVbUPSAnwOCmXI1Is/kb8j/fBzUSx76g6BvVy96U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h5RJAm3cR0tNnB+vTD76WE344VI4W2hkmYxNgSdTuSOityX1UuNFsMevecZqHmQI/
	 l0mqcLEzzIQiDojqAFWWfzDto01jxmzx8cE0it7kH7xbNkUKawOJEfKsNPjTW0h3wI
	 5mP/ID98AjCVOhY/GAnUXjJ9ENhBc113fLxFUK9ygYejFuwS5r5JwDL6AfoXLgCTeG
	 YnVW1bb9JDH6LtiXKITawIIXfmj0jmx6UkcnK27DzmM2M7P58NxuoK4Ga+tsBkLsJt
	 5fX5Dmcwgr/+ePTXq39F7iHXo9cxv/QkrT3tb8vFyek6DfKl8c9U0GYR8DMItmf4+Y
	 KIYGqqdIm6Nog==
Message-ID: <sashiko-outbox-227882@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dmaengine: ste_dma40: Use power domain for LCLA SRAM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261122-ux500-dma40-powerdomain-v2-1-8a0ebfc75b80@kernel.org>
References: <20261122-ux500-dma40-powerdomain-v2-1-8a0ebfc75b80@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 10:02:11 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dmaengine: ste_dma40: chained dev_err_probe() in d40_probe()
  clobbers reason
--

commit 8e29cc445c923c05eae5636fd084025260aae617
Author: Linus Walleij <linusw@kernel.org>

dmaengine: ste_dma40: Use power domain for LCLA SRAM

This commit replaces the LCLA ESRAM regulator and named memory resource
with an OF SRAM phandle and runtime PM management of the SRAM device.

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index f1cbc719c4f09..eca1ae95fe1c9 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
[ ... ]
> @@ -3781,13 +3791,70 @@ static int __init d40_of_probe(struct device *dev,
>  	return 0;
>  }
> =20
> -static int __init d40_probe(struct platform_device *pdev)
> +static int d40_lcla_sram_setup(struct d40_base *base)
> +{
[ ... ]
> +	if (!IS_ALIGNED(res.start, LCLA_ALIGNMENT) ||
> +	    resource_size(&res) < SZ_1K * base->num_phy_chans ||
> +	    res.end > U32_MAX) {
> +		of_node_put(parent);
> +		return dev_err_probe(dev, -EINVAL, "Invalid LCLA SRAM region\n");
> +	}
[ ... ]
> @@ -3844,26 +3911,12 @@ static int __init d40_probe(struct platform_devic=
e *pdev)
>  		d40_err(dev, "Failed to ioremap LCPA region\n");
>  		goto report_failure;
>  	}
[ ... ]
> +	ret =3D d40_lcla_sram_setup(base);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to set up LCLA SRAM\n");
> +		goto destroy_cache;
> +	}
[ ... ]
> @@ -3954,22 +3987,18 @@ static int __init d40_probe(struct platform_devic=
e *pdev)
[ ... ]
>   report_failure:
> -	d40_err(dev, "probe failed\n");
> -	return ret;
> +	return dev_err_probe(dev, ret, "probe failed\n");
>  }

[Severity: Low]
Does calling dev_err_probe() at report_failure overwrite the deferred
probe reason recorded by d40_lcla_sram_setup() or platform_get_irq() with
"probe failed"?

When d40_lcla_sram_setup() fails with a non-deferral error such as
-EINVAL, chaining dev_err_probe() across d40_lcla_sram_setup(), its caller
in d40_probe(), and report_failure also logs up to three error messages
for the same failure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-ux500-dma4=
0-powerdomain-v2-1-8a0ebfc75b80@kernel.org?part=3D1
