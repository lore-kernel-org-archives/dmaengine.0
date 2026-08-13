Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B00374E5B;
	Thu, 13 Aug 2026 14:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786630804; cv=none; b=sPhD116mQTD/bnsxesE3YME2YMhfucePmSWnC8D+Bi3VjOghRSPG73dsHjx9LC95CZzvqp6UpeDy90YU0VG8LoPL3G2se63QxuWKgATmJU10KVMEnKPlvHQnt3IQymW/qLYgrnSlIWBXvyk8lC/tfF37bHs2KXWKacv8QSepmW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786630804; c=relaxed/simple;
	bh=n7oi25iCKuVqPGymJNIROauY956TTJ67rNY2jdhha/Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WuMVcov/5YKOxwYhc3qYvxj9rfsP8NypBTeneBbHOdoIzFPbL6YDPgrMy3LvSIGwWBbYm3jyXFKkXe1nBJ6GTjE3ffejV3dYViILFpRlNJ2CDFvIJF16u5Pfwg/0C/hZyQ7vFL9IMMY7+zgRaOqXVJ/s8DRrkKyNpUHv02JV9hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5UWHK11; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j5UWHK11"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7466B1F000E9;
	Thu, 13 Aug 2026 14:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786630795;
	bh=lXF3hVVcCNoFKsGvkopsSNbMFlEQCRiB9PbysDlekjg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j5UWHK11IhwCWHjH4ymDvmjb4hvFK0TIqJ+a/c/3lwDqiAo22iOGxZDvKVGZSILVw
	 RP3zWNZYwTR6U0FUbo1QdFXdBn/6QWrUL8wmUcQ8yiTl9zeQWitWuIJV0Cj2K/QN1q
	 /b9y0UwzC3Tc915wCxkEILVNc7RjaextoQi3xVHRLkIu7DfhHTdIb8k4bzB67I+iTj
	 pb+l3+6nePKy945ppWZ4De4gsqL1qY3AWOB77oIccdWrsVghRd7JDFpB+k7ABFzn7N
	 aXezRzxpxRgALucsbxYqbDSEjh81vxBWIty5Ev2u9xS05fJjU+L9eDWr4jk3CGaN1N
	 TuTsZJO0vPOXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/4] dmaengine: qcom: gpi: Add lock/unlock TREs for
 multi-owner I2C transfers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Kumar Savaliya" <mukesh.savaliya@oss.qualcomm.com>
Cc: robh@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260813140047.1006478-3-mukesh.savaliya@oss.qualcomm.com>
References: <20260813140047.1006478-1-mukesh.savaliya@oss.qualcomm.com>
 <20260813140047.1006478-3-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 14:19:55 +0000
Message-Id: <20260813141955.7466B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Critical] Setting `TRE_FLAGS_IEOB` on LOCK and UNLOCK TREs causes multip=
le completion events per descriptor, leading to Use-After-Free and queue co=
rruption.
- [High] The driver prematurely drops the hardware lock in Write-then-Read =
multi-message transfers due to misinterpreting `DMA_PREP_INTERRUPT`.
- [High] Failure to reset `gchan->lock_pending` during channel reset or ter=
mination permanently bypasses hardware locking for subsequent transactions.
- [High] `gpi_prep_slave_sg()` blindly hardcodes the maximum TRE requiremen=
t to 3, failing to account for the newly added LOCK and UNLOCK TREs, causin=
g ring buffer overflow.

Pre-existing issues:
- [High] Dangling pointer in `gchan->config` leads to Use-After-Free during=
 channel reallocation.
--

--- Patch [2]: [PATCH v9 2/4] dmaengine: qcom: gpi: Add lock/unlock TREs fo=
r multi-owner I2C transfers ---
commit b6883d50c999f402ed4f7be119614262119be22d
Author: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

dmaengine: qcom: gpi: Add lock/unlock TREs for multi-owner I2C transfers

This commit adds support for emitting lock and unlock Transfer Ring Elements
(TREs) around I2C transfers on QUP-based controllers shared with other
processors. The GPI driver autonomously determines the placement of these
TREs based on transaction boundaries and latches a multi-owner flag during
initial configuration.

> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index a5055a6273af6..25fe7410bee2e 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c

[ ... ]

> @@ -518,7 +529,7 @@ struct gpii {
>  	bool ieob_set;
>  };
> =20
> -#define MAX_TRE 3
> +#define MAX_TRE 5

[Severity: High]
While MAX_TRE is increased to 5 here, does gpi_prep_slave_sg() still
hardcode the maximum TRE requirement to 3 when checking if the ring buffer
has enough elements available via gpi_ring_num_elements_avail()?

If the ring buffer only has 3 or 4 slots available, could this pass the
check but fail to enqueue the remaining elements like the UNLOCK TRE,
potentially locking the hardware bus?

>  struct gpi_desc {

[ ... ]

> @@ -1617,6 +1629,17 @@ gpi_peripheral_config(struct dma_chan *chan, struc=
t dma_slave_config *config)
>  	gchan->config =3D new_config;
>  	memcpy(gchan->config, config->peripheral_config, config->peripheral_siz=
e);
> =20

[Severity: High]
This isn't a bug introduced by this patch, but when
gpi_free_chan_resources() frees this memory with kfree(gchan->config), it
leaves gchan->config as a dangling pointer.

Since gchan elements are statically allocated arrays reused across DMA
channel requests, if the channel is requested again, will this call to
krealloc() receive the freed pointer and cause a slab use-after-free?

> +	/*
> +	 * Latch the multi_owner flag from the initial config call so the GPI

[ ... ]

> @@ -1627,10 +1650,33 @@ static int gpi_create_i2c_tre(struct gchan *chan,=
 struct gpi_desc *desc,
> +	/*
> +	 * Insert a LOCK TRE before the first transfer of a multi-owner
> +	 * transaction.  The GPI driver detects the transaction start
> +	 * autonomously: if multi_owner is set and no lock has been issued
> +	 * since the last unlock (lock_pending =3D=3D false), this is the first
> +	 * descriptor in a new transaction.
> +	 */
> +	if (chan->multi_owner && !chan->lock_pending) {
> +		tre =3D &desc->tre[tre_idx];
> +		tre_idx++;
> +
> +		tre->dword[0] =3D 0;
> +		tre->dword[1] =3D 0;
> +		tre->dword[2] =3D 0;
> +		tre->dword[3] =3D u32_encode_bits(1, TRE_LOCK);
> +		tre->dword[3] |=3D u32_encode_bits(1, TRE_FLAGS_IEOB);

[Severity: Critical]
Adding TRE_FLAGS_IEOB to the LOCK and UNLOCK TREs means a single transaction
produces an EOB event (from Lock), an EOT event (from DMA), and another EOB
event (from Unlock).

In gpi_process_xfer_compl_event(), EOB events fall through to the success
path which pops the active descriptor from gchan->vc and frees it. Since a
single descriptor generates multiple events, could the event handler pop and
free unrelated descriptors from the queue, causing a use-after-free?

> +		tre->dword[3] |=3D u32_encode_bits(0, TRE_MINOR_TYPE);
> +		tre->dword[3] |=3D u32_encode_bits(3, TRE_MAJOR_TYPE);
> +
> +		chan->lock_pending =3D true;

[Severity: High]
If a transaction errors out after a LOCK TRE is generated and the client
calls gpi_terminate_all() to abort the transfer, gchan->lock_pending is not
reset to false.

On the next transaction, will gpi_create_i2c_tre() evaluate lock_pending as
true and skip inserting the necessary LOCK TRE, causing transactions to run
on the shared bus without acquiring the hardware lock?

> +	}
> +
>  	/* first create config tre if applicable */
>  	if (i2c->set_config) {

[ ... ]

> @@ -1690,6 +1736,35 @@ static int gpi_create_i2c_tre(struct gchan *chan, =
struct gpi_desc *desc,

[ ... ]

> +	/*
> +	 * Insert an UNLOCK TRE after the last write transfer of a multi-owner
> +	 * transaction.  DMA_PREP_INTERRUPT marks the final descriptor in the
> +	 * batch; reads carry their own completion event so the unlock follows
> +	 * the write leg of each read message.
> +	 */
> +	if (chan->multi_owner && is_last && i2c->op !=3D I2C_READ) {
> +		tre =3D &desc->tre[tre_idx];
> +		tre_idx++;
> +
> +		tre->dword[0] =3D 0;
> +		tre->dword[1] =3D 0;
> +		tre->dword[2] =3D 0;
> +		tre->dword[3] =3D u32_encode_bits(1, TRE_UNLOCK);

[Severity: High]
If the i2c-qcom-geni client driver executes Write-then-Read sequences by
setting DMA_PREP_INTERRUPT on the write leg to wait for its completion, will
this logic equate the flag with the absolute end of the I2C transaction?

Could this prematurely append an UNLOCK TRE between the write and read,
destroying the I2C bus stretch and allowing other owners to interleave
transactions and corrupt the bus state?

> +		tre->dword[3] |=3D u32_encode_bits(1, TRE_FLAGS_IEOB);
> +		tre->dword[3] |=3D u32_encode_bits(1, TRE_MINOR_TYPE);
> +		tre->dword[3] |=3D u32_encode_bits(3, TRE_MAJOR_TYPE);
> +
> +		chan->lock_pending =3D false;
>  	}
> =20
>  	for (i =3D 0; i < tre_idx; i++)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813140047.1006=
478-1-mukesh.savaliya@oss.qualcomm.com?part=3D2
