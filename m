Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D19827E1DC;
	Mon, 12 Oct 2026 08:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795136; cv=none; b=VNLtCCEQN6YfdhOYf54P1GwzczU3GvSwTsyrjNxlk85ugnxJE+jxooCGXqmw182xJTPJgylkAtt15zlgR1P52F2H0Gb9aI4qLFTdoYv6Wu2BAlyhNTPX7JwGkJEiF3nvHnfV3j/q3fdv7ewUmdcFz2JnbWyVYmlb7wwIWNGE1hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795136; c=relaxed/simple;
	bh=yzA0r1VVDBy94I3ufJMxtMszpsGgNtpBGeLDr9mPEzo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tAjdku3zDgge+L+Ef0QzuzfQa/LHbryO0OllZmNvHwmv1yzwEFJbqJ1EWePRcgenM/KU4SfJ/3NrM+Wg8otYTlwULsmNvhy9hWWCuppwPBkqhFM6Xfzj2xjBro4MFsWBgnygX87gBt3tDXXZS/ydd8+zpk0sxFpGyXP1+yKPtRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHAOB1RB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHAOB1RB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BD91F0089D;
	Mon, 12 Oct 2026 08:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791795135;
	bh=Fq+zJQ05pwJPnsCS0v5ESl4aIyC4Qwc7e0dfh2K1Bbs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QHAOB1RBxwxKX9rcsW6VdmmAA10cKfGnxnCL236KKolJaKEEOlvwD6DCeUg8hOu+h
	 JlVFFFHz0kGccAC21wP7Bqbuw0EHzWq0I1BCtGPGi6+gxqd6EdquK+0ER4/j4a9AtJ
	 X8aMcYtWHU/tsC3GmaUMaX74yC+uNJhk452fcF5ODu9qRoTbPsn3tRCApbazC/hzJ4
	 4tukbFeqzYRyxzvlDfw3SUWvSvKZ+DSRPzfzjAivZ1By2f3ljB5Y//tqhlo0Ju82IL
	 3nfDS0ws2cIbSYPzIPvKcTMYaE6odkzCjpqaqzPoXg4BIyvKqi6CrbCbzgOM+ydSSz
	 lx63MX8TW1zoA==
Message-ID: <sashiko-outbox-167869@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/6] dmaengine: arm-dma350: Add slave and cyclic
 transfer support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jelly Jia" <Jelly.Jia@cixtech.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, conor+dt@kernel.org, vkoul@kernel.org, robh@kernel.org
In-Reply-To: <20261012084155.2547480-3-Jelly.Jia@cixtech.com>
References: <20261012084155.2547480-1-Jelly.Jia@cixtech.com>
 <20261012084155.2547480-3-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 08:52:14 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dma: Premature peripheral unmap in d350_map_resource destroys queu=
ed mappings
- [Medium] dma: Cyclic residue calculation rewinds position on race fallback
--

commit 8c6ce8c99f8eafa2efa38cc3958ee695ea49436e
Author: Jelly Jia <Jelly.Jia@cixtech.com>
Subject: dmaengine: arm-dma350: Add slave and cyclic transfer support

This commit adds DMA slave and cyclic transfer support to the Arm DMA-350
driver. It translates and caches peripheral addresses and provides completi=
on
handling and residue reporting for the new descriptor types.

> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c

[ ... ]

> +static dma_addr_t d350_map_resource(struct d350_chan *dch,
> +				    phys_addr_t cpu_addr, size_t size,
> +				    enum dma_data_direction dir)
> +{
> +	struct device *dev =3D dch->vc.chan.device->dev;
> +	struct d350_chan_map *map =3D &dch->map;
> +	dma_addr_t dma_addr;
> +
> +	if (map->dir =3D=3D dir && map->cpu_addr =3D=3D cpu_addr &&
> +	    map->size =3D=3D size)
> +		return map->dma_addr;
> +
> +	d350_unmap_resource(dch);
> +
> +	dma_addr =3D dma_map_resource(dev, cpu_addr, size, dir, 0);

[Severity: High]
If a client queues multiple descriptors sequentially for different
directions, does unmapping the resource immediately here break any pending
descriptors that still rely on the old mapping? Since this function modifies
the dch->map state without holding the channel lock, could concurrent
preparation calls also race and cause double-unmaps or unmapped accesses?

[ ... ]

> +static u32 d350_get_cyclic_residue(struct d350_chan *dch)
> +{
> +	struct d350_desc *desc =3D dch->desc;
> +	size_t cmd_size =3D D350_SLAVE_CMD_WORDS * sizeof(u32);
> +	u32 period_residue =3D desc->bytes - desc->period * desc->period_len;
> +	u32 linkaddr, linkaddrhi, hi_new, lo_new;
> +	u64 next_cmd;
> +	int retries =3D 3; /* 1st time unlucky, 2nd improbable, 3rd just broken=
 */
> +
> +	/*
> +	 * desc->period counts the completed periods, so period_residue is the
> +	 * residue at the last period boundary. Subtract the progress made in
> +	 * the running period, read from CH_XSIZE: CH_LINKADDR points at the
> +	 * command after the one executing, so while the channel is still on the
> +	 * command of the running period it names the first command of the next
> +	 * period.
> +	 */
> +	hi_new =3D readl_relaxed(dch->base + CH_LINKADDRHI);
> +	do {
> +		linkaddrhi =3D hi_new;
> +		linkaddr =3D readl_relaxed(dch->base + CH_LINKADDR);
> +		hi_new =3D readl_relaxed(dch->base + CH_LINKADDRHI);
> +	} while (linkaddrhi !=3D hi_new && --retries);
> +
> +	next_cmd =3D (linkaddr & ~CH_LINKADDR_EN) | ((u64)linkaddrhi << 32);
> +	if (next_cmd !=3D desc->cmds_dma +
> +			((desc->period + 1) % desc->periods) * cmd_size)
> +		return period_residue;

[Severity: Medium]
When the hardware races ahead to the next period, does returning the
start-of-period residue cause the reported position to jump backwards?
Because progress was likely made and reported during previous polling,
reverting to period_residue could violate the monotonically advancing
position expected by the ALSA PCM core. Would returning the cached
dch->residue freeze the pointer safely instead?

> +
> +	period_residue -=3D desc->period_len - d350_get_residue(dch);
> +
> +	/*
> +	 * If the channel stepped to the next period while CH_XSIZE was read,
> +	 * the size belongs to a command of the next period and mixing it with
> +	 * the current one would overstate the residue: keep the value from the
> +	 * period boundary instead.
> +	 */
> +	hi_new =3D readl_relaxed(dch->base + CH_LINKADDRHI);
> +	lo_new =3D readl_relaxed(dch->base + CH_LINKADDR);
> +	if (hi_new !=3D linkaddrhi || lo_new !=3D linkaddr)
> +		return d350_desc_bytes(desc) - desc->period * desc->period_len;

[Severity: Medium]
Similar to the fallback above, if the hardware steps while we read CH_XSIZE,
does returning the start-of-period residue here also cause a backwards jump
in the reported position? Could this also be resolved by returning
dch->residue to freeze the progress safely, matching the fallback behavior
in d350_get_sg_residue()?

> +
> +	return period_residue;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012084155.2547=
480-1-Jelly.Jia@cixtech.com?part=3D2
