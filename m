Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A0748164E
	for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 17:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787161640; cv=none; b=pd3xlSahtgmQ08XO922xCNjXH1CzO2Xvwx5UpgwLoYrAW6k3FgE00DTLiqHtMAEBhTsW4nSqwSTWgDq2pw90NKUTcz3eWbwMb2ECrSG68Sang7ER2y+nsoSJgrCZlwbrokt8PUlYXpksWuUWVoxo7mvT84105BeiCraxzL5k6zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787161640; c=relaxed/simple;
	bh=BDfCIt0m5Ofx/XDhu5sUeulM9jLmzNKNLfOkIjMlGgg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=clbaG+n1nB9ENI9AwA4AqXpw/R8wiEPM6JiVR59IkaKgbDQ8pMMftDsbB5guVbKZbTeMVb5bMpSAGOCW97RM9cZDsAyEDLnlUIFghA+hquyNjRhvSD84KQCkQb1nDXsHy/GPLQ8k66yedkmiF0/iuPX+a/QcZFq4Eg1M8plOMfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RhtBFYvf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RhtBFYvf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AFE81F00A3D;
	Wed, 19 Aug 2026 17:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787161639;
	bh=OF2AKA4EXyRHJIQ5f0eGV+ErQ2Alr8pns6cFz1UWUog=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RhtBFYvfCJmKGGMGLKGg3WyITIvnI+LOL1XnfBJ5fedOBZn8DPtKrQcu4Pr320c9i
	 P8CGbUiW3JwsknynOUye/sjzOWXrA7dyI+nu/Krijx708FexJ6zIoXF5zezw78GqkS
	 OGD/5q04xOlKDzH6JZuNiZyApowt/ZSeAA9f3AqvvM9uKMAfghwD2Z9Wz55rd4uzfe
	 iMfK74nRoRQcy8JTUgUz4OzjOxUO50GkEOzfeloELqhuyZOYcdaDPzQtwvAaQ9ztWb
	 28Qj2KcskeyIEao/qLJ//ykvR3tAVnJhijtMcV7nDFW4H7ROqUts9u+32F9Ci2hdaF
	 YyyUHI1DUcklw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V6 1/4] dmaengine: xilinx_dma: Fix MCDMA descriptor
 fields based on DMA direction
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Neeli" <srinivas.neeli@amd.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260818174151.1608971-2-srinivas.neeli@amd.com>
References: <20260818174151.1608971-1-srinivas.neeli@amd.com>
 <20260818174151.1608971-2-srinivas.neeli@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 17:47:18 +0000
Message-Id: <20260819174719.2AFE81F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] xilinx_dma_tx_status ignores the requested cookie when reporting t=
he residue.
--

--- Patch [1]: [PATCH V6 1/4] dmaengine: xilinx_dma: Fix MCDMA descriptor f=
ields based on DMA direction ---
commit 5b7fc319de466b2688413e1d7e8a139d9c3d5d82
Author: Srinivas Neeli <srinivas.neeli@amd.com>

dmaengine: xilinx_dma: Fix MCDMA descriptor fields based on DMA direction

The MCDMA BD format differs between memory-to-device (MM2S) and
device-to-memory (S2MM) directions. This commit refactors the descriptor
structure to use unions with direction-specific field mappings and updates
the residue calculation logic to select the correct status field.

> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index 404235c173538..965fb69a2a3ad 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
[ ... ]
> @@ -1013,9 +1023,11 @@ static u32 xilinx_dma_get_residue(struct xilinx_dm=
a_chan *chan,
>  					   struct xilinx_aximcdma_tx_segment,
>  					   node);
>  			aximcdma_hw =3D &aximcdma_seg->hw;
> -			residue +=3D
> -				(aximcdma_hw->control & chan->xdev->max_buffer_len) -
> -				(aximcdma_hw->status & chan->xdev->max_buffer_len);
> +			residue +=3D aximcdma_hw->control & chan->xdev->max_buffer_len;
> +			if (chan->direction =3D=3D DMA_DEV_TO_MEM)
> +				residue -=3D aximcdma_hw->s2mm_status & chan->xdev->max_buffer_len;
> +			else
> +				residue -=3D aximcdma_hw->mm2s_status & chan->xdev->max_buffer_len;
>  		}
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but does xilinx_dma_tx_status()
ignore the requested cookie when reporting the residue?

Looking at xilinx_dma_tx_status() in drivers/dma/xilinx/xilinx_dma.c, it se=
ems
to unconditionally compute and return the residue for the last entry in the
active list:

	desc =3D list_last_entry(&chan->active_list,
			       struct xilinx_dma_tx_descriptor, node);
	/*
	 * VDMA and simple mode do not support residue reporting, so the
	 * residue field will always be 0.
	 */
	if (chan->has_sg && chan->xdev->dma_config->dmatype !=3D XDMA_TYPE_VDMA)
		residue =3D xilinx_dma_get_residue(chan, desc);

This means it will always report the residue of the most recently submitted
transaction, rather than the transaction the caller asked about via the coo=
kie.

If a DMA client (e.g. a serial driver polling residue for partial Rx data)
queues multiple non-cyclic scatter-gather DMA transactions on a Xilinx DMA
channel, issues them, and then calls dmaengine_tx_status() to query the
residue of an earlier transaction, it would get the remaining byte count
of the last queued descriptor instead.

Should this iterate through the active and pending lists to look up the
descriptor associated with the requested cookie?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818174151.1608=
971-1-srinivas.neeli@amd.com?part=3D1
