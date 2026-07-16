Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D5525F7A5
	for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 15:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784216744; cv=none; b=XORrZhIOAmL4oFYIMuJjU/qnS6iu1oYUYcge5MrTebjiWP13Oy0O/HN6+f/CyZMOVx1uGRl4jWul2CBk+jto4xly/g++Gu/JV9yUvLsg20tM6KE6vzpV4L4UkWp+2Vw8iWLCz1SrLf8v2Ak5sZtoOGUYloRT9fKXxq1vQN+UUjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784216744; c=relaxed/simple;
	bh=QR8rUxPQZfOm6+G/iMyrNGQDoArU+eKVWun51HNKxVo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iXD1nyLgU6anFghDC30z2pKt6IUZkIgYkbw528pvynt6t90lCrbinxTdjRQN3qDvbrj+xiHZL3o8PkXnC9LV1BB02Wv5qgaMACNt2xIT13UQ7wWlTGSBJr4xM4jAptMgM3sDBAaXE2SHkGHJ/Qq80gTYDzOD7lvx0qmI2BpDp9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AGjQQHYb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AGjQQHYb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420501F000E9;
	Thu, 16 Jul 2026 15:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784216742;
	bh=lsa6nM+KfcWQfdAdaOVTBe6oNZArcqGctdejgSrOBR4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AGjQQHYbz4OlLIAIdyXfWsaTuh/ijLGJl20UcBBzrqcGYwOs2t6vDDmJVwZhyPHRh
	 qoGs8Jz7ig0+zWDdHlm3nSYrLi1bzYujD5po3DL5KsYtvQ7Kz8vB3RCO82grdm1At8
	 lzFJydMWHNN9JV4n0trn33igVRq2ob5YjTDnltQ0NnxnuNC4N3SfdRQDXwH9WXxrEe
	 T70VqL6mSZWGnrcEuRgBSocweKonvFAo+1ubGCPaAvyIQM/AgKufl5AEVkgbfli27i
	 Qc2/NddhLgAYPJf/cZu853xW0Z65WPpuDONzWBW86QBOGKThcIc9SNN2bQo41eQgvm
	 VB76uvlz7mHIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/9] dmaengine: dw-edma: Complete descriptors before
 pausing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260716152503.1747922-5-den@valinux.co.jp>
References: <20260716152503.1747922-1-den@valinux.co.jp>
 <20260716152503.1747922-5-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 15:45:41 +0000
Message-Id: <20260716154542.420501F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but remains unfixed:=
 dw_edma_device_pause() and dw_edma_device_resume() modify shared state and=
 access virt-dma lists without holding the required chan->vc.lock.
--

--- Patch [4]: [PATCH v4 4/9] dmaengine: dw-edma: Complete descriptors befo=
re pausing ---
commit ae2fd62162735ab1efcac8f4a660ab9c1e877d64
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Complete descriptors before pausing

This commit ensures that the DMA engine checks for descriptor completion
before acknowledging a pause request. If there is no work to start on
resume, it leaves the channel idle. It also ignores done interrupts while
the channel is paused so a stale or repeated interrupt cannot change its
state or start queued work.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index daf70df59e077..ac40a832a9c76 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -327,7 +327,8 @@ static int dw_edma_device_resume(struct dma_chan *dch=
an)
>  		err =3D -EPERM;
>  	} else {
>  		chan->status =3D EDMA_ST_BUSY;
> -		dw_edma_start_transfer(chan);
> +		if (!dw_edma_start_transfer(chan))
> +			chan->status =3D EDMA_ST_IDLE;

[Severity: High]
This is a pre-existing issue, but does dw_edma_device_resume() (and
dw_edma_device_pause()) modify shared state and access virt-dma lists
without holding the required chan->vc.lock?

For dw_edma_device_resume(), calling dw_edma_start_transfer() locklessly
iterates over chan->vc.desc_issued via vchan_next_desc() and mutates chunk
structures.

Could this cause list corruption or lockdep splats if run concurrently with
the interrupt handler or dmaengine_terminate_all()?

Similarly, in dw_edma_device_pause(), can a time-of-check to time-of-use
race occur if it evaluates chan->status =3D=3D EDMA_ST_BUSY locklessly?

If dw_edma_done_interrupt() concurrently completes the last descriptor and
transitions the state to EDMA_ST_IDLE, the pause function could then
overwrite chan->request =3D EDMA_REQ_PAUSE.=20

Could this leave the channel in an invalid state (status =3D=3D EDMA_ST_IDL=
E,
request =3D=3D EDMA_REQ_PAUSE) where it cannot be resumed (since resume exp=
ects
EDMA_ST_PAUSE) and cannot process new descriptors?

>  	}
> =20
>  	return err;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716152503.1747=
922-1-den@valinux.co.jp?part=3D4
