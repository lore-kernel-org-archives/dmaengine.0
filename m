Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CF23D3317
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 21:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784842219; cv=none; b=UPnZH7rLR8yg+L9QGh5Og56fImfZ8FutYRz/2jzscCrDQQdfTZDR7XpAC4ag8MW4RSezeDmdFxYKzp+7ni/WjmtncKRjzCDL5+x7iRkv1Zg+mR3Wbmjx5gWjHNKaZQYlCC7Y1rDKHq8jeK3SkWzJCHUwC6D6FbvkOQqfPjn8O9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784842219; c=relaxed/simple;
	bh=b9w4seTknyVBwY1gJlnO4DuHfNB2mYbp/HAna/5LW74=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ixPinzMemPU7BjAK4kD3yjaURnX0P5SGi8VwyC9Eaatu4AuZmifJIKoc03ALSuEsZghbNpDXjIzUObEW45lI1MwSA0Q73iiLyCxRH8bRkCPUIWBnayor+7SVk6CqDnPMDFZQl0qCjiqbF7kgSqVGqzu9PixHasLACj6F9HohUzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HAfV1Zfq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HAfV1Zfq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8751F000E9;
	Thu, 23 Jul 2026 21:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784842217;
	bh=hzQpMmV0PMbNQF1+gpKhIWBu5L6ThwaNORkso/1XgzI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HAfV1ZfqodlmDrxZNGPySiI8HMQkxfSPq6B/O29BEaIIDB0L1G2eJSv58o8O45VXO
	 I+phz8mCji/JMllod/230AILgZwin5HEXx9M+kWjlQJRPkyCR/ck4Nb7ijiwRcY1Uc
	 5v68ZrbBo918nGbbjEge5nzUnfl0NsVh2piIKVaCj2Ss/odwfAZAgLctbQEFEDC8nk
	 CRw3ddSsAAI9xaIY9pcH7+iehGfV0FSis9hdORKvOUH1oeynIjXHzpP050fCYRsarz
	 MDJdgiE940ZbB3d3afKWpCsCDFNDrRMvtErYF2POn0FLBHkKN6ug9IZ31zCVZ412Im
	 4yb3b25tjJaCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: pl08x: Create debugfs stats file under
 device folder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Zapolskiy" <vz@kernel.org>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260723211739.289699-1-vz@kernel.org>
References: <20260723211739.289699-1-vz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 21:30:16 +0000
Message-Id: <20260723213017.3E8751F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `amba-pl08x` driver does not implement a `.remove` callback, b=
reaking teardown symmetry on unbind and causing severe resource leaks and U=
se-After-Free vulnerabilities.
--

--- Patch [1]: [PATCH] dmaengine: pl08x: Create debugfs stats file under de=
vice folder ---
commit 178237cec2bb84665705001630a35ef76e87cfb1
Author: Vladimir Zapolskiy <vz@kernel.org>

dmaengine: pl08x: Create debugfs stats file under device folder

This commit changes the debugfs initialization for the pl08x driver. It
creates a stats file under the dedicated dmaengine device folder instead of
the top-level debugfs mountpoint.

> diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
> index 5e88fd44812de..543c2eb8cfa81 100644
> --- a/drivers/dma/amba-pl08x.c
> +++ b/drivers/dma/amba-pl08x.c
[ ... ]
> @@ -2500,8 +2500,8 @@ DEFINE_SHOW_ATTRIBUTE(pl08x_debugfs);
>  static void init_pl08x_debugfs(struct pl08x_driver_data *pl08x)
>  {
>  	/* Expose a simple debugfs interface to view all clocks */
> -	debugfs_create_file(dev_name(&pl08x->adev->dev), S_IFREG | S_IRUGO,
> -			    NULL, pl08x, &pl08x_debugfs_fops);
> +	debugfs_create_file("stats", 0444, pl08x->memcpy.dbg_dev_root,
> +			    pl08x, &pl08x_debugfs_fops);
>  }

While reviewing this patch, I noticed an issue in the amba_driver struct
further down in the file:

drivers/dma/amba-pl08x.c:pl08x_amba_driver
static struct amba_driver pl08x_amba_driver =3D {
	.drv.name	=3D DRIVER_NAME,
	.id_table	=3D pl08x_ids,
	.probe		=3D pl08x_probe,
};

[Severity: High]
This is a pre-existing issue, but does pl08x_amba_driver need a .remove
callback to handle unbinding safely?

If an administrator unbinds the driver via sysfs or unloads the module, the
AMBA bus detaches the device without invoking any driver-specific cleanup.

Because there is no .remove callback, wouldn't this leave non-devres
resources and global subsystem registrations like dma_async_device_register
active while the module is unloaded?

Could this lead to a use-after-free or kernel panic if the dmaengine core
accesses the leaked device from the global list, or if the hardware asserts
an interrupt after the module is unloaded?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723211739.2896=
99-1-vz@kernel.org?part=3D1
