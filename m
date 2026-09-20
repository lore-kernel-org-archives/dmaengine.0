Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5A835C693;
	Sun, 20 Sep 2026 23:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789945343; cv=none; b=JHdSSzJvWrhinLo7bsyNkApYEIrMw4wmvu2qAREGZOfDe+3dd9oLaUbnc9HLszvGN251fkIHH5qJopapcKothM/cLdn/G4DEt3Lc75GUyZWZfNy1IxPcTmFol8/vuw3jAiIlgt2+SJFUTLYZ3/HS/JiR0lmTSmbhg8uq7OZL+1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789945343; c=relaxed/simple;
	bh=aTZ1FVI31qIkGJiTeDOSHROTL8Evk6lxJRYkemRrvVA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BdCPpDz/dWuMBMvuay5+Q4dRZYXhNps6zDmvbCEIjI4FH9yfEx9pDS0FOzk4DTVeSqD8AcmVaaHVv4eEwTWZF7SE5c9OlxKz/RCi1FONTo03Ihxag4Y5BKsgqK3Z1zX9BwmvBPRagQAYlEuml/Yz+6WEoI1X0ZMJliyHdWOEqAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWGT2cfg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWGT2cfg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A79471F000FF;
	Sun, 20 Sep 2026 23:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789945342;
	bh=KJuZJlPFVQ47PNxIUEMxDPt2XC76j36WVwiEcIYDtDI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YWGT2cfgEel34pBwAiN+wC4wNJYGULCJf63rlPev7HVPr/EZMoVFa38UFVgV79Iev
	 pyEHCPU2ePgstVnqe/Lzmx2Xc3KzfIDCjlZEwFW35XWeMJa23Brw/rLFCkrAHiP8+3
	 mSahodT4q22AxwM4cGIzW1CUhG+nBfslOiBmYt2x7ZFTtQjyzSZMLdLA9Hdy7GUZcY
	 i71F1ULO5m4/Al12DY9LzNX0t1PsGTlqxtmfwj2204nVEMC6UtP/1BhSvzU5+GvEWz
	 g2HUnz/9h2XvpRD9WWbzU++fQtdzCK32SEdpH+cP/ji8Jub9zJ8lYPiZv+FFvyNV2y
	 0EG6FTaHDI9kw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 14/18] misc: sram: Enable runtime PM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: dmaengine@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, vkoul@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260921-ux500-power-domains-v7-1-v3-14-9352be6b86b1@kernel.org>
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
 <20260921-ux500-power-domains-v7-1-v3-14-9352be6b86b1@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 23:02:21 +0000
Message-Id: <20260920230221.A79471F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] misc: sram: Missing pm_runtime_get_sync() in sysfs read/write paths
- [Medium] misc: sram: Hardware initialization is not restored after runtim=
e resume
--

commit b2dc9fd44cd639efd34dbecb064c4f1f3097e1eb
Author: Linus Walleij <linusw@kernel.org>

    misc: sram: Enable runtime PM
   =20
    Enable runtime PM for generic SRAM devices after probe has initialized
    the SRAM mappings and partitions.
   =20
    This lets SRAM devices with attached power domains be managed through
    runtime PM references from their consumers.

> diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
> index c8990e83a65a2..7f19dca7b818e 100644
> --- a/drivers/misc/sram.c
> +++ b/drivers/misc/sram.c

[ ... ]

> @@ -425,6 +426,10 @@ static int sram_probe(struct platform_device *pdev)
>  			goto err_free_partitions;
>  	}
> =20
> +	ret =3D devm_pm_runtime_set_active_enabled(&pdev->dev);

[Severity: High]
Does this code allow sysfs read/write paths to access unpowered MMIO hardwa=
re?

Since runtime PM is now enabled, the SRAM device can be suspended by its
attached power domain. If userspace accesses the exported sysfs bin
attributes, sram_read() and sram_write() perform MMIO accesses without
waking the device:

drivers/misc/sram.c:sram_read() {
	...
	mutex_lock(&part->lock);
	memcpy_fromio(buf, part->base + pos, count);
	mutex_unlock(&part->lock);
	...
}

Will this cause an asynchronous external abort and crash the system if the
hardware is accessed while suspended?

[Severity: Medium]
Will hardware state be lost and not restored on resume?

Earlier in sram_probe(), hardware initialization is performed:

drivers/misc/sram.c:sram_probe() {
	...
	if (config && config->init) {
		ret =3D config->init();
	...
}

If the device is attached to a PM domain that powers it down, waking it up
will turn on the power but will not re-apply the config->init() callback
(such as atmel_securam_wait) because the driver lacks a runtime_resume
callback.

Can this lead to hardware faults or data corruption if the RAM is accessed
before it is ready?

> +	if (ret)
> +		goto err_free_partitions;
> +
>  	if (sram->pool)
>  		dev_dbg(sram->dev, "SRAM pool: %zu KiB @ 0x%p\n",
>  			gen_pool_size(sram->pool) / 1024, sram->virt_base);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-ux500-powe=
r-domains-v7-1-v3-0-9352be6b86b1@kernel.org?part=3D14
