Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29474B66CC;
	Thu,  3 Sep 2026 14:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445441; cv=none; b=c7A3vLFNKy0nUjI9lzHaCJHIlNMzmWApbBMjBbc1h3El2O8MTYsfMuEMlcf/74ooMqVHB9HVNlJPiBXXBZX64m8hOs+CKaUN7GuyrUjGrNWhKlCY/waRydwS6d30J0f/nOBIj0xiDXzSZxKi/wEiKmCVdiamiso4b4RfLIDHoQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445441; c=relaxed/simple;
	bh=MyI5wxkojcuKGUWN1rj36jign9XYScsgysdPNZpPvmM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ucwkcAWws9lQ0+1pk+qEYL9BHI5OYWnURnWRajKwLTEU+VxJAzIdbZNSgQ3+YzgEzZZLuqdTpO7rzsUkz8TL11eortkiFXvv+WWpTd14O2ZcxO9M3YmTL1eUks13Uxhgpu9C94xX7zYpUVIrpQ9BOjFhPnzEWQw5zyYkZl3yNn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cn+D29HU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cn+D29HU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A875B1F00A3E;
	Thu,  3 Sep 2026 14:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788445437;
	bh=iQTP00HjlNEAzwXD/mAZCQve51FeRnhCkaiErz4E81w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cn+D29HUVgZ4TVmGgdDOy1yTv8XAXX6D6zi0sqWFfejE04H3Z4qUdS67iEWOiHjnp
	 GfalLoD7zi3BeJDrtV/24pCTPRDM9sakbBHS1dhRAJzscysuZpVtD1iDhp0Khq4KWy
	 /EWpX+aiBdIwD1I00+aelOwJ3O/BwjggZfexwxxLv1Ou+v3KzAaZ2d8qOR85U5RsJs
	 ytKUuRLY7yX5F/587vMs/nGvv+WeGsUiOPuNnZRvW6+wSTYirkkit+wIijNZQ3vJnR
	 wmlbVnhsWqnHmYTzKTN6ir+6zMl//nAI2UA+ZbdQTiNtNAUlj2WJ93MomSMx2jCNxX
	 20FrE65rHq5lg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dmaengine: imx-sdma: Use non-atomic __set_bit() for
 event_mask setup
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260903-dma-mask-v1-2-211ffd12c236@nxp.com>
References: <20260903-dma-mask-v1-0-211ffd12c236@nxp.com>
 <20260903-dma-mask-v1-2-211ffd12c236@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 14:23:56 +0000
Message-Id: <20260903142356.A875B1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Event mask configuration for event_id >=3D 32 is broken on 64-bit =
architectures, causing single-event DMA channels to fail.
- [High] Lockless iteration of `sdmac->terminated` in worker thread races w=
ith list modification in `sdma_terminate_all()`, causing list corruption.
--

commit 0310ee402ce9c50c678bc6f3ddf91b00a310f763
Author: Peng Fan <peng.fan@nxp.com>

dmaengine: imx-sdma: Use non-atomic __set_bit() for event_mask setup

In sdma_set_watermarklevel_for_p2p(), the event_mask[] fields are zeroed
in sdma_config_channel() right before this function is called, and the
channel has already been disabled. There is no concurrent access to
event_mask at this point, so replace set_bit() with __set_bit().

> diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> index 36368835a845c..63261ab6402b9 100644
> --- a/drivers/dma/imx-sdma.c
> +++ b/drivers/dma/imx-sdma.c
> @@ -1241,8 +1241,8 @@ static void sdma_set_watermarklevel_for_p2p(struct =
sdma_channel *sdmac)
>  	int lwml =3D sdmac->watermark_level & SDMA_WATERMARK_LEVEL_LWML;
>  	int hwml =3D (sdmac->watermark_level & SDMA_WATERMARK_LEVEL_HWML) >> 16;
> =20
> -	set_bit(sdmac->event_id0 % 32, &sdmac->event_mask[1]);
> -	set_bit(sdmac->event_id1 % 32, &sdmac->event_mask[0]);
> +	__set_bit(sdmac->event_id0 % 32, &sdmac->event_mask[1]);
> +	__set_bit(sdmac->event_id1 % 32, &sdmac->event_mask[0]);
> =20
>  	if (sdmac->event_id0 > 31)
>  		sdmac->watermark_level |=3D SDMA_WATERMARK_LEVEL_LWE;

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the event
mask configuration, I noticed a potential issue for single-event channels
on 64-bit architectures.

For single-event channels, sdma_config_channel() sets the bit directly:

drivers/dma/imx-sdma.c:sdma_config_channel() {
    ...
    __set_bit(sdmac->event_id0, sdmac->event_mask);
    ...
}

On 64-bit architectures, event_mask is an array of 64-bit words, so an
event_id of 32 sets bit 32 in event_mask[0]. Later in sdma_load_context(),
this value is assigned to context->gReg[1]:

drivers/dma/imx-sdma.c:sdma_load_context() {
    ...
    context->gReg[1] =3D sdmac->event_mask[0];
    ...
}

Since gReg elements are 32-bit (u32), the 64-bit value is truncated,
silently dropping the upper 32 bits and leaving gReg[1] as 0.

Will this cause single-event DMA channels with an event ID >=3D 32 to fail
completely on 64-bit platforms like i.MX8?

[Severity: High]
This is also a pre-existing issue, but I noticed a potential list corruption
in the terminate worker.

When a client calls dmaengine_terminate_all(), the driver clears sdmac->desc
and schedules the asynchronous worker sdma_channel_terminate_work().

If the client immediately submits a new descriptor, starts it, and terminat=
es
again before the worker finishes, sdma_terminate_all() will acquire the
channel lock, execute vchan_get_all_descriptors(), and splice the new
descriptors into sdmac->terminated:

drivers/dma/imx-sdma.c:sdma_terminate_all() {
    ...
    vchan_get_all_descriptors(&sdmac->vc, &sdmac->terminated);
    ...
}

Concurrently, the worker thread locklessly iterates over and removes items
from sdmac->terminated:

drivers/dma/imx-sdma.c:sdma_channel_terminate_work() {
    ...
    vchan_dma_desc_free_list(&sdmac->vc, &sdmac->terminated);
    ...
}

Could this data race cause list corruption and lead to a kernel panic or
use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-dma-mask-v=
1-0-211ffd12c236@nxp.com?part=3D2
