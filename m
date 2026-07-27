Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C754C37E300
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 17:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785173010; cv=none; b=Kq3g2WW+oT2XIFYp+t1syq3A8JYH6mZ2EGCskVT7AiLJ9Y3JPc4eryoD65njmJDGVsUVWnkS1cb1/xFv8NPGwgOTZYjFGEp6bIkxnBOw+O9hpcVXSngE4BVE6weLxjGkpFaBy5WO5XCRMSk3CAwsJJDT4qxkrOjaSa3pNayao+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785173010; c=relaxed/simple;
	bh=rAJVVoZdM7rF5QXn+uidNLqMduEP46X1ZC5uH9tm8is=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bjed85z9hs/U+2Hn2PdmGWQkGz/Jk8IG2qvGhc7ycoY1GQ0jyBZwYxRRZ33x9xyANpGfAebGHeq6Og7i0bpO6iex8ZFSuBd/8gxobxOWz3H5QcZGfyWkiF8PwaBAPDyAbonyV1W+G8EdmgtUTDmru8Z0U6UPv5HB1aWJpiQbLTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUDfgm6s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUDfgm6s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5C81F000E9;
	Mon, 27 Jul 2026 17:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785173006;
	bh=SPVzCEckAtQ8b9GU46PAOxs73BVJbU7hzQeag0JMbT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VUDfgm6suschgxAVKZt6yGYoTCrDUyc77nekEv2VRasH3CEFIv0MXDa12YvX4Kg0B
	 dnvSIpo2hVoW6jADqg0qVCUQ4MV8bMGVzEz+CpkWZSp+7xcoInL75fUI7NpsFgrCtW
	 IaAex19v3jJbRSrmAbHefzr8U0ZnOZdEyen2DBQkUBFl4mvIvGoiNUgO9W/2azdLHW
	 mZjw4y2NVd+6FUKed3HyYc8SrucSE3Or7zx4f3zegLDqD47nD3v3bNfY1lET+3Pkli
	 SOcj7m5jQ42nVeS3quXTxIyx3Dk6Ja3eS6x6XWrNAquGrP3npMomrKL6yQZ7nIil/p
	 H+9g/qsmBqglA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/24] dmaengine: dw-edma: Centralize LL doorbell
 decisions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260727170323.2321369-8-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-8-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 17:23:25 +0000
Message-Id: <20260727172326.2C5C81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The DONE interrupt handler fails to clear EDMA_REQ_STOP and EDMA=
_REQ_PAUSE if the descriptor list is empty, contradicting the commit messag=
e's stated intent to prepare for LL progress reclamation.
--

--- Patch [7]: [PATCH v3 07/24] dmaengine: dw-edma: Centralize LL doorbell =
decisions ---
commit ee61354242533ea66a01a91592b3314e404a95eb
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Centralize LL doorbell decisions
   =20
LL fill currently rings the doorbell every time. This patch moves that deci=
sion
to dw_edma_core_ch_maybe_doorbell(), which rings only for a BUSY LL channel=
 with
pending entries. This centralization prevents EDMA_REQ_STOP completion from
restarting terminated work.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index b419ff2becf9e..c036510dabcb3 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c

[ ... ]

> @@ -733,6 +743,8 @@ static void dw_edma_done_interrupt(struct dw_edma_cha=
n *chan)
>  	default:
>  		break;
>  	}

[Severity: Medium]
Will this lead to a permanent channel hang when LL progress reclamation is
introduced?

Looking at dw_edma_done_interrupt() just above this change, the DONE interr=
upt
handler fails to clear EDMA_REQ_STOP and EDMA_REQ_PAUSE if the descriptor l=
ist
is empty:

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_done_interrupt()
	case EDMA_REQ_STOP:
		vd =3D vchan_next_desc(&chan->vc);
		if (!vd)
			break;

		dw_edma_finish_termination(chan);
		break;

The commit "Dispatch DONE interrupts by channel request" explicitly claims =
to
restructure the code so that STOP and PAUSE still have state to update even
when no descriptor remains.

However, the implementation adds if (!vd) break; which completely skips the
state updates when no descriptor remains.

If a future patch asynchronously removes the last descriptor before the DONE
interrupt handles an EDMA_REQ_STOP, won't the channel remain permanently
stuck in EDMA_REQ_STOP without completing termination, leading to an infini=
te
loop in dw_edma_wait_termination?

> +	dw_edma_core_ch_maybe_doorbell(chan);
> +
>  	spin_unlock_irqrestore(&chan->vc.lock, flags);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727170323.2321=
369-1-den@valinux.co.jp?part=3D7
