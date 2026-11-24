Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522536;
	b=dn2S214LNS8BR6Zt89FTdd4tAtXS7YMoFUPFYpb2vJhPnSvFU8k/OFjpGdBddRAtACpm
	 rBNPCvbbd5jOkzzfG5yjrCtJImybwpee0AIk5hAZdtWqZI2lEdzhBLWh+SHpCzemA0fIK
	 /EymmcnEJhvQ06Zqp0JDJeL1Ol88mng/xxC998mA8ILijeLoIIDJBou1b1ybap/vVhPXQ
	 ZHljnJJkjzSwbICUZrVn6k9SqrQgPw1gUEfCEuT7paaB3AOqL8BwUT5mcudEiNMsGSsJq
	 0X0uXNK/6UmM/Iz/iMRQWwWS9yc8ZnH1tG/RZp72VXk/SFUZlnUCcUDX3IO+IvmLICg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522536;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dkYcuYZJ2ds8v9R0Qugsm/nw6v7SQBHfDvAldgoXI6E=;
	b=UvPhyurMQFQYLqbUdSf/hOgtj6NkizhM7ysWgo3ELC7V2KYZxS46vBBxVrPjBwlZj3TW
	 QesZWjbFrgtCdnWG0UlQ4iMxIgGEaY9dla+mpMvx16+Jm3Bd65QJIAWEPelRBcAmNVdr2
	 JjU09aGU12qI3NzHACktVwh+eX/yFZxu5XiYveg+6XJxKFwuQG8i0sqDtqvKT+L1lwRIG
	 e278ukOTMrmrsuYHIUlsMGF5ngmRxvbdvaApom0cDM+kU21y3eelg4ZwpbWCHM/CNZmO+
	 R+SV5luFjCF0RofsJxo+10yi+YsUC8GFIIx0iV5ErNgYcD+wIc3aR1ZNOufJpykUSWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="CC5G7YU/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A41606A31E;
	Tue, 24 Nov 2026 12:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CC5G7YU/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9093C1F000CA;
	Tue, 24 Nov 2026 12:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795522535;
	bh=dkYcuYZJ2ds8v9R0Qugsm/nw6v7SQBHfDvAldgoXI6E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CC5G7YU/7iwMdtBQDCK4in21hqWHs5YHfMixIllLn0E+dSHi9evnDbBVQRKpdochw
	 lk8ZrswhQUwg9fyXNg6VOV0FB5Z0KS3W96HSwthw2DNKAUvUdZhFYH+MtSLBJZwnwb
	 77hezvRVJwclcLaQ/AnBD25JkFYCkjokmyKlPDZA3cCfXWByRCP6FL+rwRWd23v2ug
	 DA3D3QlhUynWneowRowGwT5Gtd6Atih5Ax+w3SiZbQI1QdUhd9FWR3IB4x42owEh2V
	 +5kFvKcKaNQbf9A/tHKvfMvjHM4A3C6iwSycWqPwaCkeHs29/Pt0gvnJjcH4Rwd1pK
	 CD0zMzkMfQf7g==
Message-ID: <sashiko-outbox-231114@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 05/20] dmaengine: ti: k3-udma: move descriptor
 management to k3-udma-common.c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261124-dma-upstream-v13-v13-5-bd4251fdc6d4@ti.com>
References: <20261124-dma-upstream-v13-v13-0-bd4251fdc6d4@ti.com>
 <20261124-dma-upstream-v13-v13-5-bd4251fdc6d4@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 12:15:35 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dmaengine: ti: k3-udma-common: missing linux/module.h inclusion
--

commit 229f89d3ed7c629f27bb39ee93374961f11ea63b
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma: move descriptor management to k3-udma-common.c

This commit moves the DMA descriptor handling functions from k3-udma.c into
a new k3-udma-common.c module controlled by CONFIG_TI_K3_UDMA_COMMON.

> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-com=
mon.c
> new file mode 100644
> index 0000000000000..f9060bcab8a5a
> --- /dev/null
> +++ b/drivers/dma/ti/k3-udma-common.c
> @@ -0,0 +1,1244 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Copyright (C) 2025 Texas Instruments Incorporated - http://www.ti.com
> + *  Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
> + */
> +
> +#include <linux/dmaengine.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/dmapool.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/ti/k3-ringacc.h>
> +#include <linux/slab.h>
> +
> +#include "k3-udma.h"

[ ... ]

> +MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
> +MODULE_LICENSE("GPL v2");

[Severity: Low]
Should k3-udma-common.c explicitly include linux/module.h?  It is built as
a tristate module and uses MODULE_DESCRIPTION(), MODULE_LICENSE() and
EXPORT_SYMBOL_GPL(), so relying on transitive header inclusion could break
the build if the included headers change.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-dma-upstre=
am-v13-v13-0-bd4251fdc6d4@ti.com?part=3D5
