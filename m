Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EC92737F9;
	Mon, 27 Jul 2026 21:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186523; cv=none; b=u/NJfQYT7EMhGLbN/6+VM04UVQvwFEaRcKxBp3/fPTCQX2LmUwpKpoxfFrHsC7urhHmR6szjyEq1C1ZWTQsrAwWGRHbu3WitkTZfKwh1JyZ9TbBJwIpsXIQf3SzQZLKPV/VP54JepqbEnBkxtEP5H2qf9xnVUXcWUieDGGluYGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186523; c=relaxed/simple;
	bh=fJveZJeF/SF9eZfktmfOZTcx/anrzEqrfJ0gfaa1PDc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mUUc7iDNh+OZajQUJ+dwGj3Ysw6PZThbChR/+dm3OKAzk9HLztpZxMvBk7oNWiBMfp+11btdRN7Sb3903s20yEcmqUYRO8XGuHGkoU7byNq3nCLfXSD/YNVd/YDtdS0fRVq79XG+41GmjiKIkB/bnpJRTWvqQ/P/+YC44AGiwjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oFJKEQ5Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oFJKEQ5Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73981F000E9;
	Mon, 27 Jul 2026 21:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186522;
	bh=C1sZy6oSoEfTM2lcRK3InYAvDyrECQvfa+BM3Y17xtA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oFJKEQ5ZZSkh+F0GK5dAKVf81uxgdZlVLUERvUiZP7BZzfGzM+i4683xZQxj98V9x
	 gYwSiAGBrpVnUp7b7YBTr64n28gAM6LLaKuFsoC/dvpBcap600ZFxOanx1ZnkVuDRe
	 4kf9gr5mBfDSOgUlCe05wqaZ0V3kmwlBsL/ePh4lN9nVrYNVw5Ays5kp4fqs71UlHn
	 RZDSrU1+EPHsYEk8Q07ZNpvMzWhMAO+3wzpaAD1Bgw25hr8QwoiEk17Fkl/xE3dBqD
	 WuBr9PHLBz5Xrs3ViXrTofY/H6amMbI16rvOvlC1Nh27FLgI+Oq0DL2/t2zGOISROs
	 VOHppQofRaEjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 33/64] dmaengine: sun6i: kill vchan BH on teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, linux-sunxi@lists.linux.dev, dmaengine@vger.kernel.org
In-Reply-To: <176cf55cdf7e686ba064befa2b257f3ae76696ab.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <176cf55cdf7e686ba064befa2b257f3ae76696ab.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:08:41 +0000
Message-Id: <20260727210841.B73981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Client callbacks flushed during cleanup can reschedule the driver =
tasklet after it was killed and clocks were disabled, leading to a hardware=
 fault and list corruption.
--

--- Patch [33]: [PATCH v2 33/64] dmaengine: sun6i: kill vchan BH on teardow=
n ---
commit 0c78bc25a98ea85ad52645998923d5aa57383201
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: sun6i: kill vchan BH on teardown
   =20
Use dma_chan_kill_bh() for virt-dma channel cleanup.

> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index a9a254dbf8cb9..9289c24dfcfaf 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -1097,7 +1097,7 @@ static inline void sun6i_dma_free(struct sun6i_dma_=
dev *sdev)
>  		struct sun6i_vchan *vchan =3D &sdev->vchans[i];
> =20
>  		list_del(&vchan->vc.chan.device_node);
> -		tasklet_kill(&vchan->vc.task);
> +		dma_chan_kill_bh(&vchan->vc.chan);

[Severity: High]
This is a pre-existing issue, but could this cleanup sequence trigger a
hardware fault or list corruption if a client callback submits a new
transfer?

During device removal or sysfs unbind, sun6i_dma_remove() kills the
hardware tasklet and disables controller clocks before calling
sun6i_dma_free():

drivers/dma/sun6i-dma.c:sun6i_dma_remove() {
    ...
    sun6i_kill_tasklet(sdc);

    clk_disable_unprepare(sdc->clk_mbus);
    clk_disable_unprepare(sdc->clk);
    reset_control_assert(sdc->rstc);

    sun6i_dma_free(sdc);
}

sun6i_dma_free() then calls dma_chan_kill_bh() which flushes pending work.
If a client callback runs during this flush and submits a new transfer,
sun6i_dma_issue_pending() is invoked:

drivers/dma/sun6i-dma.c:sun6i_dma_issue_pending() {
    ...
    list_add_tail(&vchan->node, &sdev->pending);
    tasklet_schedule(&sdev->task);
}

Because tasklet_schedule() is called unconditionally without checking if
the device is tearing down, it resurrects the killed tasklet.

When the scheduled tasklet runs, it accesses hardware registers without
clocks enabled, leading to an external abort. Additionally, it concurrently
accesses the channel lists while sun6i_dma_free() mutates them via
list_del() without locks.

Should the teardown order in sun6i_dma_remove() be adjusted to flush
callbacks before disabling clocks, or should sun6i_dma_issue_pending()
check a shutdown flag before scheduling the tasklet?

>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D33
