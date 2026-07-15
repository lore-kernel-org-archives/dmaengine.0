Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C2041A563
	for <dmaengine@vger.kernel.org>; Wed, 15 Jul 2026 18:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784139565; cv=none; b=QankrCVEHtcbudyLJQKIG9YVuhiueijSslIu3TM/0qlPrOmXQOmVg5+/5VFwd3/EX2+uIEreIYvM6Lt4zLoY7a+Uqul62MdJ0UIVTsEh1zjabmiz8hIO50V8DRlyKLGJwXMS3788YrgIBHcJprkFXPmVXHklEvkOAEbWYQ+wCV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784139565; c=relaxed/simple;
	bh=MCexJN30VKCEh954MrnHOmtL6aLVL7pEZyY3oF/UfwQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=saGQGTfzfohCtWJ3XO0xs31M7Q/S2DKZ97ysjHKtJbfwW03Vfjk9ZMuGSKQrNxqyx9orRCXnsG+1OYicQYdJmZHTTXv79Ojj8IZq6EbqaXMUIbUXrepck6QvIAE4ZNom8udc7BawcW6YK6ULHX3FFNlAqeEVqI+a28jSQJ83j6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sni0m7bU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sni0m7bU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6551F000E9;
	Wed, 15 Jul 2026 18:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784139562;
	bh=TWv020SLIy1nu6F2/Jcovi6d+M1WlMKtBX6Eg+qzNyA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sni0m7bUsuItpY6c4uWp7sm0ubtQ8cSUpYIqui9zqlIt9+kEH4XP6q00Bg6jQsw6D
	 n2lDJ2mlZLz2v4uBaj2SOmGBU3e1o0Cfs0o0+7CIF4VrN4rvlKLpLqOnlE6uVLNKHu
	 fkJ7OzxWQx8towfeUsRM2VcLdBC6Lir+/hM26h0Y/pVAuukMe2fNN3rYDDd1k/kr3F
	 6Fq2LQYH0V7TNGa6/W6C1lgtdXMl/gmIepmMlGOSfmlpeBiz8GgStx9zYG49OJtlNL
	 dD+o+e4ickLlPuj4NOwwVKKT9Azike8GlF2KYzTDU8yflDRooJcpbRZcctjJRFaZZh
	 iqCC92N5We5/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/9] dmaengine: dw-edma: Serialize channel state
 checks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260715175740.1110404-6-den@valinux.co.jp>
References: <20260715175740.1110404-1-den@valinux.co.jp>
 <20260715175740.1110404-6-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 18:19:21 +0000
Message-Id: <20260715181921.CA6551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] `dw_edma_device_terminate_all()` fails to actually stop the DMA ha=
rdware engine, leaving it vulnerable to permanent hangs if the hardware sta=
lls.
- [High] The driver advertises `DMA_CYCLIC` support and accepts cyclic tran=
sfers, but fails to implement true infinite looping or fire the required pe=
riod completion callbacks.
--

--- Patch [5]: [PATCH v3 5/9] dmaengine: dw-edma: Serialize channel state c=
hecks ---
commit 1467b5248fd39f737e5901d6f209dccdfffd622e
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Serialize channel state checks

The commit fixes a race condition between pause()/resume() and interrupt=20
handlers by extending vc.lock coverage to include channel state checks.=20
This prevents the channel from becoming permanently wedged due to missed st=
ate=20
updates, and ensures issue_pending() uses the correct configuration state.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index b06b299661c02..8b0e2af734da9 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c

[ ... ]

[Severity: High]
This is a pre-existing issue, but does dw_edma_device_terminate_all() fail =
to
actually stop the DMA hardware engine?

If the hardware stalls (e.g., due to an unresponsive peripheral or AXI bus=
=20
hang), it looks like the DMA channel could become permanently wedged. When a
client calls dmaengine_terminate_all() to abort a transfer, the code sets a
software flag:

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_device_terminate_all() {
    ...
    } else if (chan->request > EDMA_REQ_PAUSE) {
        err =3D -EPERM;
    } else {
        chan->request =3D EDMA_REQ_STOP;
    }
    ...
}

Will this cause the polling loop in dw_edma_wait_termination() to time out=
=20
if the hardware is stalled and the interrupt never fires? Should the hardwa=
re=20
be explicitly stopped rather than relying exclusively on natural completion?

[Severity: High]
This is a pre-existing issue, but does the driver fail to implement true=20
infinite looping for DMA_CYCLIC transfers?

When a client submits a cyclic transfer via device_prep_dma_cyclic(), it is=
=20
unrolled into a finite list of bursts based on xfer.cyclic.cnt. However, in=
=20
dw_edma_done_interrupt(), the descriptor appears to be completely finished=
=20
without calling vchan_cyclic_callback(vd):

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_done_interrupt() {
    ...
    case EDMA_REQ_PAUSE:
        desc =3D vd2dw_edma_desc(vd);
        if (!desc->chunks_alloc) {
            dw_hdma_set_callback_result(vd,
                                        DMA_TRANS_NOERROR);
            list_del(&vd->node);
            vchan_cookie_complete(vd);
        }
    ...
}

Will this cause subsystems relying on cyclic DMA (like ALSA for audio) to h=
ang=20
indefinitely while waiting for period completion events?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715175740.1110=
404-1-den@valinux.co.jp?part=3D5
