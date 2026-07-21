Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AFC417BCE
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 06:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616203; cv=none; b=LwHkT/l2ahfM4lNgEj2o/CiF087hSKJ6d42KMZnQp++rU75IAY0/PP2kEoYIvuxzexsmVc8i0ZqH+ktGrkvBNJouxiJD3v2JPcGZM/QZXiIUNNJk/v24N5mg3NMV+kasR2CfS5ulpoe+3zcvs0tvRce0psYUwDu4BebAm273fzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616203; c=relaxed/simple;
	bh=H0S0C8t4u8LQPDmTJSiV5o0L8joTFgXt5sMMyrS2TAY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fWP5PAcr141VabMB5CbOIoOlztrSDdZyzpwj7GEM9mPCn9KT8kMWQiNgdIh5TL0MsujXM4n3cBktflaYoGYPZ/kXyvK5UPN5lgU1VhxFBy36jMZM/byQxaedMjno7NuIgsofjwmm2zGAnqbabz5mcyKCF1AqVbzcp3yNVFQ6hM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HrYRn/0u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HrYRn/0u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B091F000E9;
	Tue, 21 Jul 2026 06:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784616202;
	bh=vakxHhCJ1SOQvIPzfs2H5etAaMEQDlXHQwhzgMSpvc0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HrYRn/0uPjyg8sHEBrnyVOf8AvGLOaBZewMVNx7+autGiFv7OJqKUDmFjwHwdO4l+
	 nKhqhktPKcB4aycW2BLKCJNmkSl+Rm5IXX6C9owOD1b7fHWqUiQ1cTjqWbAx+Ju3qF
	 rqXaeA+cUqmfbvBnJldEsTqURJg9ByM74D5YatHn+fL4VnrUmDIKcCcjLAMOvOSGKj
	 1hIBhWMXtiGPstHlvXrm9PLWDUBWjFyIt4Wtn3mY9/fOs1E+CmDRSR7iFqYJbSJr1M
	 uZt4XHcYSib25yD89e0HTTuJMqD/TurDj57t/Xu6g4eEOmQQ3xsAOzlQUGwPJiNgXl
	 L+wuUyfcr8bjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 02/14] dmaengine: dw-edma: Add per-channel interrupt
 routing control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260721062815.4117887-3-den@valinux.co.jp>
References: <20260721062815.4117887-1-den@valinux.co.jp>
 <20260721062815.4117887-3-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 06:43:21 +0000
Message-Id: <20260721064321.B6B091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Read-modify-write (RMW) data race across PCIe on shared global har=
dware registers between the local endpoint (EP) and the remote host (RC) du=
ring channel setup.
--

--- Patch [2]: [PATCH v6 02/14] dmaengine: dw-edma: Add per-channel interru=
pt routing control ---
commit aca6a61cc638729c14f2ffefbd4893c100c7613c
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Add per-channel interrupt routing control

This patch adds channel interrupt routing state to the dw-edma driver and
initializes it from the controller configuration. It updates the native
code paths so that interrupt generation and DONE/ABORT masking follow the
selected mode, allowing local and remote systems to avoid servicing the
same status.

> diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/=
dw-edma-v0-core.c
> index f1abbbacca5e3..66a605f28a122 100644
> --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
[ ... ]
> @@ -353,12 +359,17 @@ static void dw_edma_v0_core_ch_enable(struct dw_edm=
a_chan *chan)
>  			break;
>  		}
>  	}
> -	/* Interrupt unmask - done, abort */
> +	/* Interrupt mask/unmask - done, abort */
>  	raw_spin_lock_irqsave(&dw->lock, flags);
> =20
>  	tmp =3D GET_RW_32(dw, chan->dir, int_mask);
> -	tmp &=3D ~FIELD_PREP(EDMA_V0_DONE_INT_MASK, BIT(chan->id));
> -	tmp &=3D ~FIELD_PREP(EDMA_V0_ABORT_INT_MASK, BIT(chan->id));
> +	if (chan->irq_mode =3D=3D DW_EDMA_CH_IRQ_REMOTE) {
> +		tmp |=3D FIELD_PREP(EDMA_V0_DONE_INT_MASK, BIT(chan->id));
> +		tmp |=3D FIELD_PREP(EDMA_V0_ABORT_INT_MASK, BIT(chan->id));
> +	} else {
> +		tmp &=3D ~FIELD_PREP(EDMA_V0_DONE_INT_MASK, BIT(chan->id));
> +		tmp &=3D ~FIELD_PREP(EDMA_V0_ABORT_INT_MASK, BIT(chan->id));
> +	}
>  	SET_RW_32(dw, chan->dir, int_mask, tmp);

[Severity: High]
This is a pre-existing issue, but can this read-modify-write sequence
in dw_edma_v0_core_ch_enable() cause a data race across the PCIe link?

Since dw->lock only provides mutual exclusion for the local CPU, if the loc=
al
endpoint and the remote host concurrently start or stop different DMA chann=
els,
could they simultaneously read, modify, and write the shared global registe=
rs
like int_mask (and linked_list_err_en just below this)?

If one system's update overwrites the other's, could this lead to silently
dropped interrupt mask or error enable bits, resulting in lost interrupts a=
nd
DMA timeouts?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721062815.4117=
887-1-den@valinux.co.jp?part=3D2
