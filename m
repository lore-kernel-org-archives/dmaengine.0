Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E443BE64B
	for <dmaengine@vger.kernel.org>; Sat, 10 Oct 2026 12:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636889; cv=none; b=iIUDFgMHxfOPLLGigTeLv+nUwhnV+di1G/pKyr/b3pRrBtR9y3nATX6Av/rI0WP8NwJk1XXyqLueMieXGxRE04QJannr/+jEwkezQiPTeOCz5A8xvsUpy97ZdaAvMKkP+KmIVWUR00xoRpUw1NmiVZ6PK17aRolVU8PvXGEzqlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636889; c=relaxed/simple;
	bh=58bScPjrVNatlXx/9YBvVQvqIKR5+mSXjwCOxXaqBGA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=csXxNE1g37VWB/kJZzh4+7dP16yBXndkDdoMvDIhlsOWmErO+Guw/bpnktNGk5RF66az3Jy7kJxyc1jfliRweXVsCwOPOt1QLOS9UVQrKsxhx6G/8eSP57KE04OtN8ybQEv6vSnr/cmXN2kEpXbcmG8rRhJRbvkJGAtF6+kP7K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JaTVRVK3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JaTVRVK3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A32F41F000FF;
	Sat, 10 Oct 2026 12:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791636888;
	bh=vVvOzEHTdp5r37VSypXrPicDjlSjpkIgMST/cpPvnDc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JaTVRVK3eSCfuthxBb9Ape7xbTRftzoqWJkyq/hrGkDjTR+KrfJ9gNwhmagOebuoL
	 A/syJZc4tEtL/XIqR5PFpamOlSlP267zUKyFhLpbBEjvBJ3Brww3sZKQxcgTVz8gEa
	 1jV4w3kW3Z2qMkPMmBmVV7EjeYL+p4tvIRZDGB/U9CFHsI3pSPoNMiokWTyYmW+ktJ
	 niDV6Cvt53VtfXlN3D7j6qtlnrOfeB2szMEVESI+HWjfVe8CoW3Vvr0H8pHx3l/nE9
	 Puj6VytlQFgrAaDWq4+W1r4zEgvpQFU70xwtfAagR5pAA6lNIe/pvD6mEqnFaKlru+
	 kSCpzMnEHzuvw==
Message-ID: <sashiko-outbox-166552@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/8] dmaengine: mv_xor_v2: unmap descriptor before
 completing cookie
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20261010124348.19055-6-wsa+renesas@sang-engineering.com>
References: <20261010124348.19055-1-wsa+renesas@sang-engineering.com>
 <20261010124348.19055-6-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 12:54:47 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: UAF race from calling dmaengine_desc_get_callback_invok=
e late
--

commit 8c7213cd37abe1e50d7719fbacf46e143cda1fb6
Author: Wolfram Sang <wsa+renesas@sang-engineering.com>

dmaengine: mv_xor_v2: unmap descriptor before completing cookie

To ensure that buffers are flushed, make sure that the descriptor gets
unmapped before completing the cookie.

Link: https://lore.kernel.org/r/20261009093745.539924-1-vkoul@kernel.org

> diff --git a/drivers/dma/mv_xor_v2.c b/drivers/dma/mv_xor_v2.c
> index cad4d4fb51ac3..8a307431721fc 100644
> --- a/drivers/dma/mv_xor_v2.c
> +++ b/drivers/dma/mv_xor_v2.c
> @@ -581,9 +581,8 @@ static void mv_xor_v2_tasklet(struct tasklet_struct *=
t)
>  			 * lock is required the IMSG threshold provide
>  			 * the locking
>  			 */
> -			dma_cookie_complete(&next_pending_sw_desc->async_tx);
> -
>  			dma_descriptor_unmap(&next_pending_sw_desc->async_tx);
> +			dma_cookie_complete(&next_pending_sw_desc->async_tx);
>  			dmaengine_desc_get_callback_invoke(
>  					&next_pending_sw_desc->async_tx, NULL);
>  		}

[Severity: High]
Does completing the cookie before extracting the callback information creat=
e a
use-after-free race condition?

dma_cookie_complete() updates tx->chan->completed_cookie, which makes the D=
MA
transaction completion visible to clients polling via dma_async_is_tx_compl=
ete().

After completion is signaled, clients are legally allowed to free the callb=
ack
context (callback_param), recycle resources, or even unload the module
containing the callback function.

If a polling client races and frees the resources immediately after seeing
completion, the subsequent call to dmaengine_desc_get_callback_invoke() cou=
ld
dereference a freed callback_param or jump to unmapped module memory.

Should the callback information be cached using dmaengine_desc_get_callback=
()
before calling dma_cookie_complete(), and then invoked via
dmaengine_desc_callback_invoke() afterwards?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010124348.1905=
5-1-wsa+renesas@sang-engineering.com?part=3D5
