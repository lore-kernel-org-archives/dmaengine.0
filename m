Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192333FA5E7;
	Thu,  1 Oct 2026 09:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845599; cv=none; b=tVHB1CKmkTyTRmOl32kfGZkjZGFD9Cqg145P+/rIMrPN5/Igjrjd0w2d8HtXyWvmoGChyBmvHjfBwmvedMNSkJQx3ctwv99r1o6u6I/mVdokKdbpU0MbxPB4Ikawf59VpqEWYvN1wcrcF/PDJPhVLtpc0818g3toA/7nqiPn2uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845599; c=relaxed/simple;
	bh=+qiaIi0klqwiUS05wp5tbRPSt4Wfl/UgsGcrKTL7yWc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g0I7vj2B0rjU8NY+N7jZokerwla7uNIVOBu4Bx4E0HRedU7NC+bBhlUehEVF5p5tz/efk/wOA0uFIiIzWH4QEcmydHeQuVmmspZSX/whOZATZXAvueoUtEshTSv6mH13WOiHML94VCkCfLxKKO7jgljvndUk5Jsz+zCXkPNqm2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ir9ANkaC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ir9ANkaC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 832AD1F000FF;
	Thu,  1 Oct 2026 09:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790845598;
	bh=EgdrKZaT7WpKG4/pMr22P462E25bJ5Vof6QHb6zfCos=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ir9ANkaCkIcXG+mrxvtSPENCyg8/XTD2MkXcOd1HkGYWXvNlIUgte1q13xLc5tFPi
	 u4qjLtVsYxy0QbJMBB6nwiZOvrWCbB9a4kkOwr7y+J2jwE1/+oYGtu8X857C7DhlRm
	 NJQTW4zj5ywS+qGFSmr+0n1OvajaRUSepZIkBRBOWi7M0IQe98fErOLU8DAplUARRt
	 Pt8bDWLw6Wjfjm8WcqHS7WT5Fghd7/PnRf4bQwiI93y4DiCuSODZElcFe5o8JQjlId
	 VrQvLdnSclpHfSHtyOnAmUhyryFdIcf7WJca9tBZmQ9lXBTiJidkZXEx0RDegHwBNz
	 BLxtkzR1HmW0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 11/19] dmaengine: ti: k3-udma: move inclusion of
 k3-udma-private.c to k3-udma-common.c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261001084105.1692228-12-s-adivi@ti.com>
References: <20261001084105.1692228-1-s-adivi@ti.com>
 <20261001084105.1692228-12-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 09:06:37 +0000
Message-Id: <20261001090637.832AD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] mm: UAF in of_xudma_dev_get() due to dereference after put_device()
- [High] mm: UAF in xudma_dev_put() due to devm_ unbind race
- [Medium] Commit message claims 'No functional changes intended' but adds =
features
--

commit d7ff936b088ca2c00890bff99f72a6c55660576f
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma: move inclusion of k3-udma-private.c to k3-udma-comm=
on.c

Relocate the #include directive for k3-udma-private.c to k3-udma-common.c
to share code between UDMA variants and prepare for variant-specific
implementations.

>     No functional changes intended.

[Severity: Medium]
The commit message explicitly asserts "No functional changes intended", but=
 the
patch actively introduces functional module pinning logic (try_module_get).
Could the commit message be updated to accurately reflect these lifecycle
changes?

> diff --git a/drivers/dma/ti/k3-udma-private.c b/drivers/dma/ti/k3-udma-pr=
ivate.c
> index 44c097fff5ee6..d2501e074bcfb 100644
> --- a/drivers/dma/ti/k3-udma-private.c
> +++ b/drivers/dma/ti/k3-udma-private.c
> @@ -54,10 +54,26 @@ struct udma_dev *of_xudma_dev_get(struct device_node =
*np, const char *property)
>  		return ERR_PTR(-EPROBE_DEFER);
>  	}
> =20
> +	/*
> +	 * Callers keep using ud (via function pointers stored in it, e.g.
> +	 * ud->psil_pair) after this call returns, bypassing the dmaengine
> +	 * core's own try_module_get() protection. Pin the owning driver's
> +	 * module here so it can't be unloaded out from under a live glue
> +	 * client; xudma_dev_put() releases it.
> +	 */
> +	if (!try_module_get(ud->ddev.owner))

[Severity: High]
Does this code introduce a use-after-free race?

Earlier in of_xudma_dev_get(), put_device(&pdev->dev) is called, which drops
the reference to the platform device:

	ud =3D platform_get_drvdata(pdev);
	put_device(&pdev->dev);
	if (!ud) {
		pr_debug("UDMA has not been probed\n");
		return ERR_PTR(-EPROBE_DEFER);
	}

Immediately after this, the new code executes try_module_get(ud->ddev.owner=
).

If a concurrent device unbind (e.g., via sysfs) occurs in this tight window,
the devres-managed ud object can be freed. The subsequent access to
ud->ddev.owner dereferences the freed pointer.

Should put_device() be called after we are done accessing ud?

> +		return ERR_PTR(-ENODEV);
> +
>  	return ud;
>  }
>  EXPORT_SYMBOL(of_xudma_dev_get);
> =20
> +void xudma_dev_put(struct udma_dev *ud)
> +{
> +	module_put(ud->ddev.owner);

[Severity: High]
Can this dereference a freed pointer upon device unbind?

The ud pointer is implicitly managed by devres. When of_xudma_dev_get() ret=
urns
it to the client, it explicitly drops the device reference without establis=
hing
a device link. The module pinning added here does not prevent sysfs device
unbinding.

If the UDMA device is unbound, devres frees ud. Later, when the client clea=
ns
up, it calls this new xudma_dev_put(), which dereferences the already-freed
ud->ddev.owner.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001084105.1692=
228-1-s-adivi@ti.com?part=3D11
