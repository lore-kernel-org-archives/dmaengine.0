Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDA33451CC
	for <dmaengine@vger.kernel.org>; Fri, 14 Aug 2026 05:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786684434; cv=none; b=i1tY3vrKCeQWAkbYfzrWTuRM7DKJCzHErzHeR6Gn+HhJ1nrblB0vR3yeec8z8a9po7Pki63EMRTn5KC2QoVUbdn9hwLZPgT3uvtCBr2xhtQtelaRYqh8VtxO6lw4A66fAJXYKyFCR6NgIjH5gIkXo+65bEuTNUIUO8+RL7cmW+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786684434; c=relaxed/simple;
	bh=/aKAdyXP373S+wwt6LTTGRv48ORP9s6ILCNpmaQGDAI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s4d0J6c/vStdSz73+bDeWG41IqMbf+irsjQ7Aci6NW4LcA7kRxHt1o7K6gqp5qe8q8UvXgJhai/lJKSK3zF7S2gRHgcpTc+2esKRy/h2dRnN2BXZxLu3NQwxUfO4HRDon73k4IbahVl4Mi3WGojC7FjPPz+nXWfcyHuB84+gYm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0Oy/+lr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0Oy/+lr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 163611F000E9;
	Fri, 14 Aug 2026 05:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786684432;
	bh=e2s8y868+7lqF+9xWeUkULu3yTmwarlvJ4AuwFk84g4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M0Oy/+lrpN5fob3WgFFP9VZj5rA4H8zRLbRhPztMLmkFxTZyBlbFQOZhXg3Qnmtz9
	 L3zFAF8zIdH4JSBH4EBdnHN+bSROQjmj4VnNHoForxotqtHbtZuN/3dNX+NmARWpQ+
	 80E4Nba2iYMdPBft2TjaObOq6/7eNxgfuzrLQ0WrBQpyvTcSSe40vVxVSQRXWvvD+d
	 c9bFPRC1iF+/iUhf4h3FyRziG+ymQxjJPM887wgPBQDPza6FIMPxQRBsfZAw8Jfc/w
	 XcS7kB/Y+HgErieE6gOPNHq+n1LG3UqbUIZ1FepIWf0vpT/WBTNEXE8T8aXf0AwheC
	 ZhM/+xIqd+Pzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 1/8] dmaengine: zynqmp_dma: Fix PM rollback on
 sw_desc_pool alloc failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Golla Nagendra" <nagendra.golla@amd.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260814045616.1661199-2-nagendra.golla@amd.com>
References: <20260814045616.1661199-1-nagendra.golla@amd.com>
 <20260814045616.1661199-2-nagendra.golla@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 05:13:51 +0000
Message-Id: <20260814051352.163611F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch fixes a runtime PM reference leak when `sw_desc_pool` al=
location fails, but misses an identical PM reference leak and a memory leak=
 when `desc_pool_v` allocation fails.
- [High] The probe function leaks the PM runtime usage counter on error pat=
hs if PM runtime is enabled.
- [High] Dropping the spinlock inside `list_for_each_entry_safe` in `zynqmp=
_dma_chan_desc_cleanup` exposes the list to concurrent corruption.
--

--- Patch [1]: [PATCH V2 1/8] dmaengine: zynqmp_dma: Fix PM rollback on sw_=
desc_pool alloc failure ---
commit b97e6284964e1fb9d4c743aeb8e1818fb367a1d3
Author: Golla Nagendra <nagendra.golla@amd.com>

dmaengine: zynqmp_dma: Fix PM rollback on sw_desc_pool alloc failure

If sw_desc_pool allocation fails after pm_runtime_resume_and_get()
succeeds in zynqmp_dma_alloc_chan_resources(), the error path returns
without dropping the runtime PM reference. Route that failure path
through err_pm so the runtime PM reference is balanced before
returning the error.

> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_=
dma.c
> index f6a812e49ddca..9f1e69700dd02 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -483,8 +483,10 @@ static int zynqmp_dma_alloc_chan_resources(struct dm=
a_chan *dchan)
>  		return ret;
> =20
>  	chan->sw_desc_pool =3D kzalloc_objs(*desc, ZYNQMP_DMA_NUM_DESCS);
> -	if (!chan->sw_desc_pool)
> -		return -ENOMEM;
> +	if (!chan->sw_desc_pool) {
> +		ret =3D -ENOMEM;
> +		goto err_pm;
> +	}
> =20
>  	chan->idle =3D true;
>  	chan->desc_free_cnt =3D ZYNQMP_DMA_NUM_DESCS;

[ ... ]

> @@ -516,6 +518,10 @@ static int zynqmp_dma_alloc_chan_resources(struct dm=
a_chan *dchan)
>  	}
> =20
>  	return ZYNQMP_DMA_NUM_DESCS;
> +
> +err_pm:
> +	pm_runtime_put_autosuspend(chan->dev);
> +	return ret;
>  }

[Severity: High]
This is a pre-existing issue, but I noticed another leak in this same
function. If dma_alloc_coherent() fails:

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_alloc_chan_resources() {
    ...
    chan->desc_pool_v =3D dma_alloc_coherent(...);
    if (!chan->desc_pool_v)
        return -ENOMEM;
    ...
}

Does this path also leak the PM reference and chan->sw_desc_pool since
it returns directly instead of jumping to an error label?

[Severity: High]
This is a pre-existing issue, but the probe function seems to have a similar
PM leak on error paths.

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_probe() {
    ...
    ret =3D pm_runtime_resume_and_get(zdev->dev);
    ...
err_disable_pm:
    if (!pm_runtime_enabled(zdev->dev))
        zynqmp_dma_runtime_suspend(zdev->dev);
    pm_runtime_disable(zdev->dev);
    return ret;
}

If pm_runtime_resume_and_get() succeeds but a subsequent step fails, we jump
to err_disable_pm. Is the PM runtime usage counter leaked here since there
is no pm_runtime_put_noidle() called before disabling PM?

[Severity: High]
This is a pre-existing issue, but there might be a race condition in
zynqmp_dma_chan_desc_cleanup().

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_chan_desc_cleanup() {
    ...
    list_for_each_entry_safe(desc, next, &chan->done_list, node) {
        ...
        if (dmaengine_desc_callback_valid(&cb)) {
            spin_unlock_irqrestore(&chan->lock, irqflags);
            dmaengine_desc_callback_invoke(&cb, NULL);
            spin_lock_irqsave(&chan->lock, irqflags);
        }
    ...
}

Since the spinlock is temporarily dropped inside the list_for_each_entry_sa=
fe
loop, can concurrent modifications to the list invalidate the next pointer
and cause memory corruption when the lock is reacquired?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814045616.1661=
199-1-nagendra.golla@amd.com?part=3D1
