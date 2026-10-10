Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852EB49A3AB
	for <dmaengine@vger.kernel.org>; Sat, 10 Oct 2026 12:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637041; cv=none; b=tYAN4bRKL2FJkvI15svTLiiLYJzAPUsMikFnBf9zxWqGyR9f6M21C573QDlXX7uJIPzsNnR9pZ09JR5y9imxuOydxasTxdm7UAhcDVcG5lxiEKBhGljPLPBizTCGx8P8INyH1FHkOwXKncKuUUhNZvEnGhPa6jcU19lsgQXl67o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637041; c=relaxed/simple;
	bh=CwZU/clNausV2UdhY5mtcxHzKZ0Q6buBveQv29zQua8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QA7sYcbe5YGy+Sw6kPIBAZ98GO4JTHnukPrk+Q09RCgegGyBnMaLyZhXzlYQEyLERGbOnrkRaElBc1vg1L+/ZL5acoB2Z1oczYYrFQ84Hehbq60ywT76aLUkrrVU8To7q/xKMbKeyOD0ELsTcqnfJzO9VBnLMtXyDbkV/Xam8U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ef7Cogtf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ef7Cogtf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC9D1F000FF;
	Sat, 10 Oct 2026 12:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791637040;
	bh=SN+e7MmhlKk92237kJvCDqZTG6oKSUJklbLn7bMsm0o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ef7Cogtf+rKl+4Sbm9cTumfYbppPrkzcWOg5N8sgDSiNDpdrQ6maiIStonIkPiglL
	 rSgaflShR+l8WAGVXQW+nZ5aZO8PYSeSxLUvylNCHQO+n7f/vlpLTZcEPkQ2pN+Y3d
	 2GIOrtYt86Tt7lPSvf/SsDMCtTeuAs4S5Jiyagz53FroVJdcZoSMQfztcGiCl2hGaZ
	 Mpp3cHrVKM4rpYTf5UD9QizINNPpu5CV9rlFE6yNT14IAfzaRLBYcYauOGODQWvCGL
	 uBUu6jHs3kPhSYYa9VUfPLuzAevRKxvpavF/FHpOfwOW1Mtn8QXbK7yJTg8AO7a/14
	 1YchgW1uSevWw==
Message-ID: <sashiko-outbox-166555@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/8] dmaengine: ptdma: unmap descriptor before
 completing cookie
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20261010124348.19055-2-wsa+renesas@sang-engineering.com>
References: <20261010124348.19055-1-wsa+renesas@sang-engineering.com>
 <20261010124348.19055-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 12:57:19 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: ptdma: UAF in ae4_pending_work due to unremoved list en=
tries
--

commit 45d9a162336ad9b005d6d181ab13de82d05d7cf3
Author: Wolfram Sang <wsa+renesas@sang-engineering.com>

dmaengine: ptdma: unmap descriptor before completing cookie

To ensure that buffers are flushed, make sure that the descriptor gets
unmapped before completing the cookie.

Link: https://lore.kernel.org/r/20261009093745.539924-1-vkoul@kernel.org

> diff --git a/drivers/dma/amd/ptdma/ptdma-dmaengine.c b/drivers/dma/amd/pt=
dma/ptdma-dmaengine.c
> index 628c49ce5de9d..7f51d1e6c727f 100644
> --- a/drivers/dma/amd/ptdma/ptdma-dmaengine.c
> +++ b/drivers/dma/amd/ptdma/ptdma-dmaengine.c

[ ... ]

> @@ -362,8 +362,8 @@ static void pt_cmd_callback_work(void *data, int err)
>  		if (desc->status !=3D DMA_ERROR)
>  			desc->status =3D DMA_COMPLETE;
> =20
> -		dma_cookie_complete(tx_desc);
>  		dma_descriptor_unmap(tx_desc);
> +		dma_cookie_complete(tx_desc);

[Severity: High]
Can this result in a use-after-free when pt_terminate_all() is called?

pt_terminate_all() extracts all descriptors from the virt-dma channel and
frees them via vchan_dma_desc_free_list():

drivers/dma/amd/ptdma/ptdma-dmaengine.c:pt_terminate_all() {
    ...
	vchan_dma_desc_free_list(&chan->vc, &head);
    ...
}

However, for AE4 DMA devices, descriptors are additionally added to the
ae4cmd_q->cmd list during pt_create_desc(). pt_terminate_all() fails to
remove the freed descriptors from this hardware pending command list, and
does not acquire ae4cmd_q->cmd_lock.

The asynchronous worker thread ae4_pending_work() then iterates over the
uncleaned list, removes the freed descriptor, and executes its callback:

drivers/dma/amd/ae4dma/ae4dma-dev.c:ae4_pending_work() {
    ...
			cmd =3D list_first_entry(&ae4cmd_q->cmd, struct pt_cmd, entry);
			list_del(&cmd->entry);

			ae4_check_status_error(ae4cmd_q, ae4cmd_q->dridx);
			cmd->pt_cmd_callback(cmd->data, cmd->ret);
    ...
}

Since pt_cmd_callback_work() is the callback invoked here, will this execut=
ion
dereference the freed descriptor pointers and cause list memory corruption?

>  	} else {
>  		tx_desc =3D NULL;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010124348.1905=
5-1-wsa+renesas@sang-engineering.com?part=3D1
