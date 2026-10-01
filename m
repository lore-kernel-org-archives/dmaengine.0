Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947A03F104D;
	Thu,  1 Oct 2026 09:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845405; cv=none; b=I2zaFilHIC8neimobLxTTWv2e0zac117slBZmpyd0vTvO69Nzqf92UEydBKTzSjnrvQPqT/ULetJyeye8U2eWp6o7mRQ1KKhV4ept3TnH7d+KeXcymsIpLaT+kIO+5wwMhAv1IZt1rWPGpqf1SiLqbjcYju1UdUQDyPPGqd0B0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845405; c=relaxed/simple;
	bh=QpifyrwnaF/PT1WYPiygHS7SUiSoV6Y41ccY54/KiWY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uhr1C5/S6Z/Q3mGLtx1fryvOa5lvBQY8EHkZzmAX7oRMCRsJROH+W/rm8BQG85Exoe0wU6ivWtNr20ZhkfeSb7tyskZAmilAKY9rEnSAb2nUOIml3oMGjbjg4lnw8B+nZnnucikcKPs+UXhkDBsHTmYXTB07c3bBb4dsEROQx1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c2gofywA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c2gofywA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 155D51F000FF;
	Thu,  1 Oct 2026 09:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790845404;
	bh=9U5llXnfSUuvlKmWPUwr40j7ZBplB7KjHNSU6jNXDak=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c2gofywAqzK0lYzehKLym074CGTMtzJQYl8z96tm/aZ9e0CC6c3omYeWDA/LGXUML
	 Gk72x50++uRyVCWLuM14Q2MfPdJ3w99QazSu/14rusGGAcikxMY+FMEsTv8IgacwKU
	 1XnUw5ps8NJf9UQyXHdlMq8ZsQg7lLkUUZpbQqaMsEPBma530dIsXTiWvZfaPAdefX
	 eFNEQvU9a+KdJJaIbw3DUCbZYlq+t2eI6ABZuCKAP5gj8s5SzBYbr6l+hxNCXOAPx5
	 7EFfrlSWrOnce7ZCPeHDBVWrdH/XNG6Og+P4XYCipllF+ZZO0fJ8beGQO9Kgo+M+UL
	 4Qpd4miSMPFcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 05/19] dmaengine: ti: k3-udma: move descriptor
 management to k3-udma-common.c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: robh@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261001084105.1692228-6-s-adivi@ti.com>
References: <20261001084105.1692228-1-s-adivi@ti.com>
 <20261001084105.1692228-6-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 09:03:23 +0000
Message-Id: <20261001090324.155D51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dmaengine: ti: missing <linux/slab.h> include in k3-udma-common.c
--

commit 0bc54c526536ebf3ec79e663e240494d3391a71a
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma: move descriptor management to k3-udma-common.c

This commit refactors the K3 UDMA driver by moving descriptor handling logic
from k3-udma.c to a new k3-udma-common.c library. This change prepares the
driver for supporting the new K3 UDMA v2 variant.

> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-com=
mon.c
> new file mode 100644
> index 0000000000000..9b7ae758bdc90
> --- /dev/null
> +++ b/drivers/dma/ti/k3-udma-common.c

[ ... ]

> +static struct udma_desc *udma_alloc_tr_desc(struct udma_chan *uc,
> +				     size_t tr_size, int tr_count,
> +				     enum dma_transfer_direction dir)
> +{

[ ... ]

> +	/* We have only one descriptor containing multiple TRs */
> +	d =3D kzalloc(sizeof(*d) + sizeof(d->hwdesc[0]), GFP_NOWAIT);

[Severity: Low]
Could we add an explicit include for <linux/slab.h> in this new file?

The file k3-udma-common.c explicitly calls kzalloc(), kzalloc_flex(), and
kfree(), but <linux/slab.h> is not explicitly included. This can cause build
failures on configurations where the header isn't implicitly pulled in.

> +	if (!d)
> +		return NULL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001084105.1692=
228-1-s-adivi@ti.com?part=3D5
