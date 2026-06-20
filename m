Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90A3233932
	for <dmaengine@vger.kernel.org>; Sat, 20 Jun 2026 17:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781975634; cv=none; b=DqQRc1CZ6O5vrRUKeJnPyUxhMAhM6X+iZLi9T/KQb5b1vfTc3tfdBSlVmrukQ4einjw0AQq2waNICIZDAp9Sk9q9tcuYvwSpaP58i+XgTSYSmVpS2NvzTX9z8EmA/D6I0B4eT1BMkpyXAFMi52t4G63fi6itAn9jd0inKANgHIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781975634; c=relaxed/simple;
	bh=4BYYG98ku5mojrH4sicICXijOZScjUeji3Qodjlb7Y4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OHalRJZEpFEAUo6u+BppcfUNW/qMPAX+jWFbWxWlpbbaawPm7yXcPH2di4wjJ6Ug3/gp0BIK5/XHRbnuL9dUWSmxULvFgyEKgHX+M9rH/YbdilljlIMTxdLbUAwN0CHCgk5lX5A/oPYo7Z1dSGREaFOwaKRArgtb+lSoPwdVj2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mudhcx1Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mudhcx1Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 436AE1F000E9;
	Sat, 20 Jun 2026 17:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781975633;
	bh=snEN5SU3E6Lk5hDleRdXbZrrzS8qsOvRAp7IBmFIdpo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mudhcx1QOJdsuqW/ilVdLX0sYYzcExt+ervJMtTqA5gro5v0XZefSzqu07MdXKRKq
	 q/zXhP9Fk/I6IloKbkvvjMb7dXcN06ktd/aon4CybgCbaqF4Z3NbsqEFlqhaB50d1p
	 H83Y7hlGTO2eih8V1lakj4VrjBp6C0WjobluiBF7FoYOW6aenrgMLROaXrNJ8rWRHq
	 Dh+TUG2YadZ/mVVcPWtQUk9qH6VhfxLww818Wr5Jh1K5gRX55F2dmiMIbMqUDv4hrQ
	 t/vfHn+mpXmRkLYXb9VNnInZeBLhoWGv1fE6uAcR77+Hp7P0XtX+i3yJhSJT+nOXMx
	 CJRxP7cqc9DJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/13] dmaengine: dw-edma: Add per-channel interrupt
 routing control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260620170040.3756043-2-den@valinux.co.jp>
References: <20260620170040.3756043-1-den@valinux.co.jp>
 <20260620170040.3756043-2-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 Jun 2026 17:13:52 +0000
Message-Id: <20260620171353.436AE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] V0 eDMA fails to set the Remote Interrupt Enable (RIE) bit for rem=
ote-routed channels on a local endpoint controller.
--

commit df5a2947e52cc02cfc126b63bc365277ac3752fa
Author: Koichiro Den <den@valinux.co.jp>
dmaengine: dw-edma: Add per-channel interrupt routing control

This commit adds per-channel interrupt routing control to the DesignWare
eDMA driver, allowing channels to route completion signals locally or
remotely. It updates the v0 eDMA and HDMA paths to configure interrupt masks
and generation based on the selected mode.

> diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/=
dw-edma-v0-core.c
> --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
[ ... ]
> @@ -331,7 +335,8 @@ static void dw_edma_v0_core_write_chunk(struct dw_edm=
a_chunk *chunk)
>  		j--;
>  		if (!j) {
>  			control |=3D DW_EDMA_V0_LIE;
> -			if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
> +			if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) &&
> +			    chan->irq_mode !=3D DW_EDMA_CH_IRQ_LOCAL)
>  				control |=3D DW_EDMA_V0_RIE;
>  		}

[Severity: High]
When a local endpoint controller delegates a channel to a remote host, the
irq_mode is set to DW_EDMA_CH_IRQ_REMOTE, but DW_EDMA_CHIP_LOCAL is also
present in the chip flags.

Because the check in dw_edma_v0_core_write_chunk() explicitly requires that
DW_EDMA_CHIP_LOCAL is not present, the first condition evaluates to false
and DW_EDMA_V0_RIE is never set.

According to the commit message, requesting a remote-only interrupt requires
setting both LIE and RIE while masking the local interrupt. Since
dw_edma_v0_core_start() correctly masks the local interrupt for these
channels, does this prevent the DMA completion event from being sent
entirely, potentially causing the remote host to wait forever?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260620170040.3756=
043-1-den@valinux.co.jp?part=3D1
