Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FC03E49C4;
	Fri,  9 Oct 2026 05:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791523641; cv=none; b=bYV1kNoVHAh4tJG2vhcj7Mvkr2KJ4sN76SrzXwAi4/+Pms+INU1TdJ3OR+BblPMlxN4MMZ54/zVjK3K1iey3oD+ljrEw7GteGn4sjDxzoC8aPvJI/MED42nHtTUCXkLu5k5q3Dpe6z/l3NyVqKLBn92anbpSFtlttz964qrpXUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791523641; c=relaxed/simple;
	bh=tmoXTfHj7SLpHX9GQNjp78tzpmh82U6eTPbqFlelfog=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=XfVsVBOrNZyAL/1cphVlpIIMfHcfn8z1KbYuZ3849pa7n/Oora0KBu8uDDHoRxJT1wwSyLSA0VWyVmlWvEXV7kJDQUKawu/ngfycMFc9y19Jd0WyW23l2vtcOkXAU3UGL48J++Ehj0gh5Da5iKF7S65/AHN0E5a1H7xlwDhCTNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TK+zwXCN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TK+zwXCN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8151F000FF;
	Fri,  9 Oct 2026 05:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791523638;
	bh=Tl95rq9MAVqGZkHhXeQeWCYa4MpT42GZx79edcnOWKU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TK+zwXCNTHgAk+2pU0KeRZEGPzK3h2sZBrNRSl3maL4q4pyYUCcnwyP7w9XNvaQIj
	 9m6UMIkLyb1ztWM7SBdu8MDEMMF6uwure+nvO3KT34Aj60qpLr26hmv5fi5HE+vdi2
	 1Atr5RtE6sOHM2HKcNmZkNqB7ENUpPVYwBtNHXGlHhD329UWpzvy/TSD5lZo1gkKrZ
	 Ugo4z/eh4WqUjBm9ws4DbZH6CIEWM5Mkfm87PliWCs25YPwpGc9vZb5Clcx8zsdFjY
	 q+Ur94Sga5PAcFd/SPfvmqtuvJgnDwKJPJHFd/rkR6w74oQGfKBadUb8hUZx3H/gsf
	 Y+78FhTr2RHXQ==
Message-ID: <sashiko-outbox-164893@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/6] dmaengine: arm-dma350: Sync the slave command
 list before starting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jelly Jia" <Jelly.Jia@cixtech.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009051846.1115962-4-Jelly.Jia@cixtech.com>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-4-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 05:27:17 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dma: arm-dma350: API misuse passing cmds_bus instead of cmds_dma to=
 DMA API
--

commit 2fca36adfda1fb6f57b81f4afd90229dd12fdb46
Author: Jelly Jia <Jelly.Jia@cixtech.com>

dmaengine: arm-dma350: Sync the slave command list before starting

This commit fixes a stalled transfer issue on non-coherent devices by
synchronizing the slave command list before starting the channel. It adds a
sync step to ensure written command words are visible to the hardware and
SWIOTLB bounce buffers are refreshed.

> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index bbcf4071c3e75..e3fbfcce66e8e 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c
> @@ -306,6 +306,21 @@ static int d350_alloc_cmds(struct dma_chan *dchan, s=
truct d350_desc *desc,
>  	return 0;
>  }
> =20
> +/*
> + * The command words are written after the command list has been mapped,=
 so
> + * make them visible to the device before the descriptor is submitted. T=
his
> + * also refreshes the bounce buffer when the mapping is bounced through =
the
> + * SWIOTLB. It is a no-op for a DMA coherent device.
> + */
> +static void d350_sync_cmds(struct device *dev, struct d350_desc *desc)
> +{
> +	if (!desc->cmds)
> +		return;
> +
> +	dma_sync_single_for_device(dev, desc->cmds_bus, desc->cmds_size,
> +				   DMA_TO_DEVICE);

[Severity: Low]
Is desc->cmds_bus the correct address to pass to the DMA API here?

The DMA API requires the dma_addr_t handle returned by dma_map_single()
for all synchronization operations. It looks like the d350_desc struct
explicitly defines desc->cmds_dma for this purpose, while desc->cmds_bus is
designated as the hardware-visible address.

While both fields might currently hold identical values, passing the hardwa=
re
address to the DMA API could violate the API semantics. If bus address
translation or IOMMU offsets are introduced in the future where the hardware
view diverges from the DMA API token, could this result in SWIOTLB sync
failures or memory corruption?

Should this use desc->cmds_dma instead?

> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009051846.1115=
962-1-Jelly.Jia@cixtech.com?part=3D3
