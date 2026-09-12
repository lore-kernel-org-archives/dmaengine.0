Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB4C27FB37
	for <dmaengine@vger.kernel.org>; Sat, 12 Sep 2026 17:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789235642; cv=none; b=B71Hp62OFhL3aQlDHWUEHfj8MPpp16NkMHelchOx0ecU3xXAt+kOCr54dtiWFjrm/v2UWQ981nHx0A5yICTza4azNaemjixqbXX8d8gr3sE4TJNrwHN2NM13T1X8qesp87BFdsEo1aD2EI6kvc3A+UfLHTYWjOGV9dFVCkcrf7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789235642; c=relaxed/simple;
	bh=ZSQtzP3m+o95xzoDHbuS/lRRbEZ1sND6WgJpgftJ8WE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K7y9Bn/LmJ7hpGEirTFHF/AUHrOP9MdElaFRkx6QMS50JzSTkyMFht+1ebBshEP0XctLJdfuo7ntSVlc/kFwjzPBxUV6vkEaQQFCPdykINxEhMQ21kQT+hwCnMSko97qR2KtIs/nPnBQf9tXoZuaWrWcYnfFSMoL2pTMx8Vy9bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQIlwxFi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQIlwxFi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D0501F000FF;
	Sat, 12 Sep 2026 17:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789235640;
	bh=2y9C2+2giClAXlooa8vAneWgt0WGNTTQ2p35MtVEOEw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GQIlwxFiDk5ouhQUv6xAbMQPJkkOY2QhCOIJZNtDu9nr/LCFLNOroICWGHBP9Ia2c
	 eKsbpXHVOT1Y2MGqHrasp8Eohul9FfS4WSM/UqIxJIruGnaXlwxx+kxluNShYqM73I
	 clfE8N0ilPvieIJ5aXs7cPuHQms+GzPSLYIOGbNVX0VodsWS0AZe5yMIiQRIkYc1yw
	 nO/daUCpPbA/S6rEogmwPHUaANxABQR3Y9XsUX3cBpMRsNihHey5gCMt4sZmEMv66+
	 TiY4KzEJrmAKLAeFOXSYYQWd8GL6HqDmtgquYj3WXFamZA4cH3ETrNdXdpHnMqrAf4
	 /sA7hRI6XZsgg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dmaengine: Allow drivers to assign static
 channel IDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260912174023.1227397-2-den@valinux.co.jp>
References: <20260912174023.1227397-1-den@valinux.co.jp>
 <20260912174023.1227397-2-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 17:53:59 +0000
Message-Id: <20260912175400.5D0501F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but there is unprote=
cted list manipulation and channel count increments when dynamically regist=
ering DMA channels.
- [High] This problem wasn't introduced by this patch, but the exported fun=
ction `dma_async_device_channel_register` calls `dma_channel_rebalance` wit=
hout holding the required `dma_list_mutex`.
--

commit c9b886d4c7abff6716428d3defc1d41c973eb40b
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: Allow drivers to assign static channel IDs

The dmaengine core assigns channel IDs in registration order. If a driver
skips a hardware channel, chan_id can differ from the hardware numbering
and a client cannot reliably correlate a requested channel with hardware
resources.

> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 6ffd8bd82154a..cc64a4679e6fa 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -1078,6 +1078,7 @@ static int __dma_async_device_channel_register(stru=
ct dma_device *device,
>  					       struct dma_chan *chan,
>  					       const char *name)
>  {
> +	unsigned int id;
>  	int rc;
> =20
>  	chan->local =3D alloc_percpu(typeof(*chan->local));

[ ... ]

> -	/*
> -	 * When the chan_id is a negative value, we are dynamically adding
> -	 * the channel. Otherwise we are static enumerating.
> -	 */
> -	chan->chan_id =3D ida_alloc(&device->chan_ida, GFP_KERNEL);
> +	if (chan->chan_id & DMA_CHAN_ID_STATIC) {
> +		id =3D chan->chan_id & ~DMA_CHAN_ID_STATIC;
> +		chan->chan_id =3D ida_alloc_range(&device->chan_ida, id, id,
> +						GFP_KERNEL);
> +	} else {
> +		chan->chan_id =3D ida_alloc(&device->chan_ida, GFP_KERNEL);
> +	}
>  	if (chan->chan_id < 0) {
>  		pr_err("%s: unable to alloc ida for chan: %d\n",
>  		       __func__, chan->chan_id);

[Severity: High]
This problem wasn't introduced by this patch, but there is unprotected list
manipulation and channel count increments when dynamically registering DMA
channels.

When dynamically registering DMA channels, the idxd driver calls
list_add_tail(&chan->device_node, &dma->channels) in
drivers/dma/idxd/dma.c:idxd_register_dma_channel() and then
dma_async_device_channel_register() calls
drivers/dma/dmaengine.c:__dma_async_device_channel_register() which does:

	chan->client_count =3D 0;
	device->chancnt++;

	return 0;

Since idxd probes workqueues (WQs) as separate devices, these can be probed
concurrently. Without proper locking protecting the dma_device's channel li=
st
and count, concurrent registrations can result in list corruption and race
conditions, potentially leading to kernel panics or data corruption.

Could we add proper locking to protect the channel list and count during
dynamic channel registration?

[Severity: High]
This problem wasn't introduced by this patch, but the exported function
dma_async_device_channel_register() calls dma_channel_rebalance() without
holding the required dma_list_mutex.

In drivers/dma/dmaengine.c:dma_async_device_channel_register():

int dma_async_device_channel_register(struct dma_device *device,
				      struct dma_chan *chan)
{
	int rc;

	rc =3D __dma_async_device_channel_register(device, chan, NULL);
	if (rc < 0)
		return rc;

	dma_channel_rebalance();
	return 0;
}

The dma_channel_rebalance() function iterates over the global dma_device_li=
st
using list_for_each_entry(). Because dma_list_mutex is a static unexported
mutex in drivers/dma/dmaengine.c, callers of
dma_async_device_channel_register() cannot hold it.

This leads to an unprotected concurrent traversal of the global DMA device =
list,
which can race with other drivers registering or unregistering DMA devices.
Could this result in use-after-free or list corruption crashes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912174023.1227=
397-1-den@valinux.co.jp?part=3D1
